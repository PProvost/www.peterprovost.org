---
layout: post
title: "Visual Studio 11 Fakes Part 1 - Stubs"
date: 2012-04-13 20:51
comments: true
published: false
categories: 
- Code
tags:
- unit testing
- tdd
- visual studio
- vs11
---

## Background

For quite a while we've been getting feedback from customers asking us to ship a
mocking framework in Visual Studio. I was always a big cautious about providing
this for a few different reasons.

First, I've always been reluctant about recommending "mocks" when unit testing,
preferring stubs in most cases. For anyone unsure of the difference between a
Mock and a Stub, let me quote Martin Fowler:

{% blockquote Martin Fowler http://martinfowler.com/articles/mocksArentStubs.html Mocks Aren't Stubs %}

On the one hand there is a difference in how test results are verified: a
distinction between state verification and behavior verification. On the other
hand is a whole different philosophy to the way testing and design play
together...

{% endblockquote %}

Basically a stub is a test fake (or dummy) that is used as a stand-in for the
real type. You do this to avoid having to pass in a real object, which would
extend your test beyond the realm of "unit". They are frequently used when doing
classical "Arrange, Act, Assert" state-based testing. A mock, on the other hand,
provides not only a fake implementation but also logic for verifying how calls
were made on the fake. When you are testing side- effects, protocols and
interactions between objects, they are extremely valuable.

<!-- more -->

The concern is that I have often seen people fall into using behavior
verification where none is needed. Overuse of mocks inhibits free refactoring of
the code because, as Martin discusses in his essay, it leads to a very tight
coupling between the tests and the implementation instead of just to the
interface contract. I might blog more on this later, but let's keep going.

The second reason for my reluctance was that there are quite a few good
Mock/Stub implementations available in the community. Moq, Rhino, NMock and
others have strong followings and good reputations and I wasn't sure I wanted to
get into the business of competing with them.

But despite the misgivings about competing with community driven projects, we
still received lots of feedback from customers asking for us to address people's
needs for easily creating fast-running, isolated unit tests. A part of this is
because many customers are unable to use open-source or third-party tools.
Another part is simplicity: people would rather have what they need on-hand, in
the box.

## Introducing Visual Studio 11 Fakes

{% pullquote %}

In the end, we decided we would make an investment in this area and in Visual
Studio 11 Beta, we included the first publicly available version of VS11 Fakes.
{" Our goal with the Fakes framework is to enable developers to quickly and
easily isolate their unit tests "} from their environment. We made a decision in
the Beta release to focus on two kinds of test fakes (aka test doubles):

* **Stubs** are concrete implementations of interfaces and abstract classes that
  can be passed in to your system under test. The developer provides method
  implementations via .NET delegates or lambdas.

* **Shims** are run-time method interceptors. With Shims you can provide your
  own implementation for almost any method available to your code in .NET, and
  that includes types and methods from the .NET base class libraries.

The syntax for both Stubs and Shims is very similar. In this article, I will be
discussing Stubs, focusing on how and when to use them. My next article will
cover Shims, showing how you can use them to test "untestable" code.

{% endpullquote %}

## The System-Under-Test

For this article, we will assume the following system-under-test (aka SUT).
Please note that this is an abridged version and not a real-world
implementation. I will post a complete sample application at a later time.

``` csharp System Under Test
namespace FakesDemo
{
   public class Customer
   {
      public int Id { get; set; }
      public string Name { get; set; }
      public string Email { get; set; }
   }

   public interface ICustomerRepository
   {
      Customer GetById(int id);
      IEnumerable<Customer> GetAll();
      Customer SaveOrUpdate(Customer customer);
      void Delete(Customer customer);
   }

   public class CustomerViewModel : ViewModelBase
   {
      readonly ICustomerRepository repository;
      readonly Customer customer;

      public CustomerViewModel(Customer customer, ICustomerRepository repository)
      {
         this.customer = customer;
         this.repository = repsository;
      }

      public string Name
      {
         get { return customer.Name; }
         set
         {
            customer.Name = value;
            RaisePropertyChanged("Name");
         }
      }

      public void Save()
      {
         repository.SaveOrUpdate(customer);
      }
   }
}
```

## Creating Fakes for the System-Under-Test

{% img right /images/blog/2012-04-13-visual-studio-11-fakes-part-1/add-fakes-assembly.png 300 500 %}

Creating a stub for the `ICustomerRepository` interface is quite easy. You
simply right click on the reference in our test project and choose **Add Fakes
Assembly**.

When you do this, a few things happen behind the scenes:

1. A file named <target assembly>.fakes is created in the Fakes folder within
   your project and some stuff is added to your project build file. This file
   controls how your fakes are generated. More on this later.
2. The target assembly is scanned and fakes types (both Stubs and Shims) are
   created for the types found.
   * These types will be named `StubXXX` and `ShimXXX` based on the type they
     target
   * They are put in a namespace under that of the source type. So for our
     example above, the stub called `StubICustomerRepository` will be in the
     `FakesDemo.Fakes` namespace.
3. These fake types are added to a new assembly created in a sub-folder called
   "FakeAssemblies". While a reference is created to this assembly, it is not
   added to your project and does not need to be added to version control
   because it will be regenerated as-needed.
4. For each public method, property and event on the interface, the Stub will
   contain a delegate property that you can use to provide an implementation. To
   avoid naming conflicts, the property names include parameter type
   information. So for our `ICustomerRepository` interface, we would have a stub
   with the following class signature:

``` csharp Pseudocode for StubICustomerRepository
namespace FakesDemo.Fakes
{
   public class StubICustomerRepository
   {
      public delegate GetByIdInt32 { get; set; }         // ICustomerRepository.GetById
      public delegate GetAll { get; set; }               // ICustomerRepository.GetAll
      public delegate SaveOrUpdateCustomer { get; set; } // ICustomerRepository.SaveOrUpdate
      public delegate DeleteCustomer { get; set; }       // ICustomerRepository.Delete
   }
}
```

At this point you are ready to use your Stubs in a real test.

## Writing Your First Test

As I discussed in a previous article, another new feature we introduced in VS11
is support for using 3rd party unit testing frameworks. For these examples, I
will leverage that by using the xUnit.net framework created by Jim Newkirk and
Brad Wilson (available at [xunit.codeplex.com](http://xunit.codeplex.com)).

For our first test, we simply want to confirm that when `Save()` is called on
the View Model, `SaveOrUpdate()` method is called on the repository. Writing
this test is quite simple with Fakes.

``` csharp Testing CustomerViewModel.Save()
using xunit;

public class CustomerViewModelTests
{
   [Fact]
   public void SaveShouldUpdateTheRepository()
   {
      // Arrange
      var savedCustomer = default(Customer); // null
      var repository = StubICustomerRepository {
         SaveOrUpdateCustomer = customer => savedCustomer = customer;
      };
      var actualCustomer = new Customer { Id=1, Name="Sample Customer" };
      var viewModel = new CustomerViewModel( actualCustomer, repository );

      // Act
      viewModel.Save();

      // Assert
      Assert.IsNotNull(savedCustomer);
      Assert.Equal(1, savedCustomer.Id);
      Assert.Equal("Sample Customer", customer.Name);
   }
}
```

Lets take a close look at what this test does:

1. Line 9 - Create a variable to stash the actual value passed to the repository
2. Lines 10-12 - Create a new Stub repository
3. Line 13 - Create a customer object to pass to the view model
4. Line 14 - Create the view model we will test
5. Line 17 - Call the `Save()` method on the view model
6. Lines 20-22 - Verify that the customer object is equivalent to the one we
   gave the view model

We use a closure to extract the parameter from the SaveOrUpdate() method for
testing. This is a common pattern when working with Stubs in tests like this.
