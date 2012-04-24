---
layout: post
title: "Visual Studio 11 Fakes Part 1 - Stubs"
date: 2012-04-15 20:51
comments: true
categories: 
 - Code
tags:
 - vs11
 - visual studio
 - unit testing
 - tdd
 - fakes
---

## Background

Over the years I've heard many customers ask us to ship a mocking framework in
Visual Studio. I was always a bit cautious about providing this for a few
different reasons.

First, I've always been hesitant to recommend "mocks" when unit testing,
preferring stubs in most cases. For anyone unsure of the difference between a
Mock and a Stub, I suggest you read Martin Fowler's excellent article 
[Mocks Aren't Stubs][1].

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

But despite the misgivings about competing with community driven projects,
there was continued feedback from customers asking for help from Visual Studio
in making fast-running, isolated unit tests. A part of this is because many
customers are unable to use open-source or third-party tools.  Another part is
simplicity: people would rather have what they need on-hand, in the box.

## Introducing Visual Studio 11 Fakes

In the end, it was decided that we would make an investment in this area for
Visual Studio 11. In VS11 Beta we included the first publicly available version
of the VS Fakes framework. Our goal with the Fakes framework is to enable
developers to quickly and easily isolate their unit tests from their
environment.

The Fakes framework is derived from the [Moles project][2] created by Microsoft
Research. While it isn't backwards compatible with Moles, the migration is
pretty straightforward.  For the Beta release our focus was on two kinds of
test fakes (aka test doubles) for .NET programming:

* **Stubs** are concrete implementations of interfaces and abstract classes that
  can be passed in to your system under test. The developer provides method
  implementations via .NET delegates or lambdas.

* **Shims** are run-time method interceptors. With Shims you can provide your
  own implementation for almost any method available to your code in .NET, and
  that includes types and methods from the .NET base class libraries.

The syntax for both Stubs and Shims is very similar. In this article, I will be
discussing Stubs, focusing on how and when to use them. 

## The System-Under-Test

For this article, we will assume the following system-under-test (aka SUT).
Please note that this is an abridged version and not a real-world
implementation. I will post a complete sample application at a later time.

``` csharp System Under Test
namespace FakesDemo.SystemUnderTest
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
      private Customer customer;
      private readonly ICustomerRepository repository;

      public CustomerViewModel(Customer customer, ICustomerRepository repository)
      {
         this.customer = customer;
         this.repository = repository;
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
         customer = repository.SaveOrUpdate(customer);
      }
   }
 }
```

## Creating Fakes for the System-Under-Test

{% img right /images/blog/2012-04-15-visual-studio-11-fakes-part-1/add-fakes-assembly.png %}

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
4. For each public member on the interface, the Stub will contain a delegate
   field that you can use to provide an implementation. To avoid naming
   conflicts, the property names include parameter type information. So for our
   `ICustomerRepository` interface, we would have a stub with the following
   class definition:

``` csharp StubICustomerRepository Class Definition
namespace FakesDemo.Fakes
{
   public class StubICustomerRepository
   {
      public Func<int, Customer> GetByIdInt32;              // ICustomerRepository.GetById
      public Func<IEnumerable<Customer> GetAll;             // ICustomerRepository.GetAll
      public Func<Customer,Customer> SaveOrUpdateCustomer;  // ICustomerRepository.SaveOrUpdate
      public Action<Customer> DeleteCustomer;               // ICustomerRepository.Delete
   }
}
```

Using our Stub repository is easy. You simply create one and assign delegates
or lambdas to the members you need to provide implementation for. As an
example, if we wanted to make the `GetAll()` method return a fixed set of
elements, we might do something like this (I'm using the C# object initializer
syntax here but you could also do it on multiple lines if you prefer):

``` csharp Implementing A Stub Member
var stub = new StubICustomerRepository
            {
               GetAll = () => new[]
                                 {
                                    new Customer {Id = 1, Name = "John", Email = "John@contoso.com"},
                                    new Customer {Id = 2, Name = "Peter", Email = "Peter@contoso.com"}
                                 }
            };
```

Now that we have a Stub for our repository interface, and we know how to provide its
member implementations, we are ready to use our Stub in a real test.

## Writing Your First Test Using Stubs

As I discussed in a previous article, another new feature we introduced in VS11
is support for using 3rd party unit testing frameworks. For these examples, I
will leverage that by using the xUnit.net framework created by Jim Newkirk and
Brad Wilson (available at [xunit.codeplex.com](http://xunit.codeplex.com)).

For our first test, we simply want to confirm that when `Save()` is called on
the View Model, `SaveOrUpdate()` method is called on the repository. Writing
this test is quite simple with Fakes.

``` csharp Testing CustomerViewModel.Save()
using FakesDemo.SystemUnderTest;
using FakesDemo.SystemUnderTest.Fakes;
using Xunit;

public class CustomerViewModelTests
{
   [Fact]
   public void SaveShouldUpdateTheRepository()
   {
      // Arrange
      var savedCustomer = default(Customer); // null
      var repository = new StubICustomerRepository
                        {
                           SaveOrUpdateCustomer = customer => savedCustomer = customer
                        };
      var actualCustomer = new Customer {Id = 1, Name = "Sample Customer"};
      var viewModel = new CustomerViewModel(actualCustomer, repository);

      // Act
      viewModel.Save();

      // Assert
      Assert.NotNull(savedCustomer);
      Assert.Equal(1, savedCustomer.Id);
      Assert.Equal("Sample Customer", savedCustomer.Name);
   }
}
```

Lets take a close look at what this test does:

1. Line 11 - Create a variable to stash the actual value passed to the repository
2. Lines 12-15 - Create a new Stub repository
3. Line 16 - Create a customer object to pass to the view model
4. Line 17 - Create the view model we will test
5. Line 20 - Call the `Save()` method on the view model
6. Lines 23-25 - Verify that the customer object is equivalent to the one we
   gave the view model

We use a closure to extract the parameter from the `SaveOrUpdate()` method for
testing. This is a common pattern when working with Stubs in tests like this.

Interestingly, this example highlights exactly the kind of scenario where we'd
really like to have behavioral verification. If we did have a `stub.Verify()`
method, my code would have been a lot shorter and more concise, but in VS11
Beta we only have simple stubs, so must use the closure technique I show here.

## Conclusion

In this first part of my deep dive into Fakes we explored the Stubs framework.
With Stubs you can easily create concrete dummy implementations of interfaces
and abstract classes to help you create better isolated, faster running unit
tests.

Hopefully this whet your appetite a bit for the new VS11 Fakes framework. In my
next post I will dig into Shims, showing how you can use them to test so-called
"untestable" code, and will also discuss when and where to use them (or not use
them).

If you have questions about Fakes, please start by taking a look at the 
[MSDN Documentation][3]. For bugs please file a report on [Connect][4]. For
suggestions and other feedback, please post something on [User Voice][5] or
mention me on Twitter or use the #vs11fakes hashtag.

[1]: http://martinfowler.com/articles/mocksArentStubs.html
[2]: http://research.microsoft.com/en-us/projects/moles/
[3]: http://aka.ms/vs11-fakes
[4]: http://connect.microsoft.com/VisualStudio
[5]: http://visualstudio.uservoice.com/
