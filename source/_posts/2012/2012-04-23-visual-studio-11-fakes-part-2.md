---
layout: post
title: "Visual Studio Fakes Part 2 - Shims"
date: 2012-04-23 00:03
published: false
comments: true
categories: 
- Code
tags:
- unit testing
- tdd
- visual studio
- vs11
---

## The Catch-22 of Refactoring to Enable Unit Testing

In [the first part][4] of my series on VS11 Fakes, I reviewed Stubs, which are
a simple way of creating concrete implementations of interfaces and abstract
classes for use in unit tests.

But sometimes it happens that you have to test a method where the dependencies
can't be simply injected via an interface. It might be that your code depends
on an external system like SharePoint, or simply that the code news up or uses
a concrete object inside the method, where you can't easily replace it.

The unit testing agilista have always said, "Refactor your code to make it more
testable," but therein lies the rub. I will again refer to the esteemed Martin
Fowler for a quote:

<!-- more -->

{% blockquote Martin Fowler http://martinfowler.com/refactoring/ %}

Refactoring is a disciplined technique for restructuring an existing body of
code, altering its internal structure without changing its external behavior.

{% endblockquote %}

How do you know if you are changing its external behavior? "Simple!" says the
Agilista, "You know you didn't change it as long as your unit tests still
pass." But wait... we don't have unit tests yet for this code (that's what
we're trying to fix), so I'm stuck... [Catch-22][1].

I have to quote [Joseph Heller's masterwork][2] just for fun:

{% blockquote Joseph Heller, Catch-22 Chapter 5 %}

There was only one catch and that was Catch-22, which specified that a concern
for one's safety in the face of dangers that were real and immediate was the
process of a rational mind. Orr was crazy and could be grounded. All he had to
do was ask; and as soon as he did, he would no longer be crazy and would have
to fly more missions. Orr would be crazy to fly more missions and sane if he
didn't, but if he were sane he had to fly them. If he flew them he was crazy
and didn't have to; but if he didn't want to he was sane and had to. Yossarian
was moved very deeply by the absolute simplicity of this clause of Catch-22 and
let out a respectful whistle.

{% endblockquote %}

He's crazy if he wants to go fight, but if he says he really didn't want to
fight then he isn't crazy and so needs to go fight. We have the same problem.
We can't test because it needs refactoring, but we can't refactor because we
don't have tests.

## Shim Your Way Out of the Paradox

### Example 1 - 

To see what this really looks like, let's look at some code (continued from the
example in Part 1).

``` csharp "Untestable" System Under Test Code
namespace FakesDemo.SystemUnderTest
{
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
         customer.LastUpdated = DateTime.Now;  // HOW DO WE TEST THIS?
         customer = repository.SaveOrUpdate(customer);
      }
   }
}
```

There is one minor change from our previous example. We are now setting the
`LastUpdated` property on the `Customer` object before passing it to the
repository. (I know this might not be the best way to do this, but go with
me...)

***How do we test that Save sets the correct value to LastUpdated?***

You might start by writing a test like this. This uses the same Stubs technique
I showed in the last article and tries hard to deal with the variable nature of
the `LastUpdated` property.

``` csharp A Not-so-good Test for LastUpdated
using FakesDemo.SystemUnderTest;
using FakesDemo.SystemUnderTest.Fakes;
using Xunit;
using System.Linq;

public class CustomerViewModelTests
{
   [Fact]
   public void SaveShouldSetTheCorrectLastUpdatedDate()
   {
      // Arrange
      var savedCustomer = default(Customer); // null
      var repository = new StubICustomerRepository
            {
               SaveOrUpdateCustomer = customer => savedCustomer = customer
            };
      var actualCustomer = new Customer 
            { 
               Id = 1, 
               Name = "Sample Customer", 
               LastUpdated=DateTime.MinValue 
            };
      var viewModel = new CustomerViewModel(actualCustomer, repository);

      // Act
      var now = DateTime.Now;
      viewModel.Save()

      // Assert
      Assert.NotNull(savedCustomer);

      // We will use a 10ms "window" to confirm that the date is "close enough"
      // to what we expect. Not ideal, but it should work... most of the time.
      var delta = Math.Abs((savedCustomer.LastUpdated - now).TotalMilliseconds);
      const int accuracy = 10; // milliseconds
      Assert.True(delta <= accuracy, "LastUpdated was not appx equal to expected");
   }
}
```

There are, of course, a few issues with this code, most notably the bit below
the comment explaining the 10ms window. How small can we make the `accuracy`
variable before the test starts to fail? How close is close enough?  What about
when the `viewModel.Save()` code does extra work eating up some of that time?

A better way to test this is to use a Shim to override `System.DateTime`, causing
it to always return a predictable value. That test would look something like this:

``` csharp A Better Test for LastUpdated
using FakesDemo.SystemUnderTest;
using FakesDemo.SystemUnderTest.Fakes;
using Xunit;
using System.Linq;

public class CustomerViewModelTests
{
   [Fact]
   public void SaveShouldSetTheCorrectLastUpdatedDate()
   {
      using (ShimsContext.Create())
      {
         // Arrange
         var savedCustomer = default(Customer); // null
         var repository = new StubICustomerRepository
               {
                  SaveOrUpdateCustomer = customer => savedCustomer = customer
               };

         // Make DateTime.Now always return midnight Jan 1, 2012
         ShimDateTime.NowGet = () => new DateTime(2012, 1, 1); 

         var actualCustomer = new Customer 
               {
                  Id = 1, 
                  Name = "Sample Customer", 
                  LastUpdated=DateTime.MinValue 
               };
         var viewModel = new CustomerViewModel(actualCustomer, repository);

         // Act
         viewModel.Save()

         // Assert
         Assert.NotNull(savedCustomer);
         Assert.True( new DateTime(2012, 1, 1), savedCustomer.LastUpdated );
      }
   }
}
```

On line 21 we use Shims to override the `Now` static property getter on the
DateTime object. This replacement is for all calls to `DateTime.Now` in the
AppDomain, which is why we are required to provide a scoping region for our
replacements with the `ShimsContext.Create()` block.

But now this test is no longer "flaky". It has no dependency on your system
clock, on the length of time that `Save()` or any other code takes to run. We
have controlled the environment and isolated this test from the external
dependency on `DateTime.Now`.

This example shows one issue that can make code difficult to test, but of
course there are more.

### Example 2 - The hidden object instance

Here's a different example showing another problem.

``` csharp 

// Code TBD

```

In this example, we have a method that is creating an instance of the
WPF `DispatchTimer` class. It uses the timer to track when 30 seconds
have elapsed and then it refreshes a property on the view model (presumably
this collection is bound in the XAML to a list on-screen).

How can we test this code? There are a few things we might like to test:

1. Does it refresh the list before starting the timer?
2. Does it refresh the list again only after 30 seconds have gone by?

Let's look at how we might use Shims to create that second test.

``` csharp

// Code TBD

```

In this example we use Shims ability to detour all future instances of an object
by using the special `AllInstances` property on the generated Shim object. Since
these methods are instance methods, our delegate has to include a parameter for
the "this" pointer. I like to use `@this` for that parameter to remind me what it
is, but I've seen other people use `that` or `instance` if you dislike the idea
of using a C# keyword in your code.

### Example 3 - Using Shims to wrap an existing instance

One more example will wrap up my introduction to Shims. In this example, we have
a method that takes a concrete instance of a particular object type as a 
parameter. But we want to override some of that object's behavior.

Here's the system under test:

``` csharp

// Code TBD

```

To test this using Shims, we will new up an instance of the object, and then
wrap it in a Shim, providing the overrides we care about.

``` csharp

// Code TBD

```

This is an approach you will probably use less frequently than the others, as
it is much easier to introduce a base class or an interface when you have this
situation.

## Resolving the Catch-22

The Catch-22 that I mentioned at the start of this article can be restated like this:

1. You can't test the code because it has internal dependencies that make it untestable
2. You need to refactor it to fix the dependency
3. Since you don't have any tests for this code, you aren't safe to refactor
4. See #1

Hopefully you can see that Shims help you get out of this dilemma. With Shims we can
rework that list to something like this:

1. You can't test the code using traditional techniques because it has dependencies
   that make it untestable.
2. Before you can refactor it, you need to create a test that asserts its current
   behavior.
3. You can use Shims to create this characterization test, enabling you to refactor
   safely.
4. Once you have it under test, you can safely refactor and make the dependency
   explicit and replaceable using traditional (e.g. interfaces and stubs) methods.
5. The characterization test should continue to pass after performing the refactoring.
6. Once the refactoring is complete, you can create new tests that do not use Shims
   (but may use Stubs) to test the code.
7. Then you can remove the Shims test.

It is a few more steps, but it lets you have a clear, intentional way to refactor
code that otherwise would have required "refactoring in the dark". The Catch-22 is
resolved and you can continue to improve the design and testability of your code.

I do recommend people go all the way with this approach and refactor the code
until the Shim-based test is no longer required. Every time you need to use
something like Shims to test something, it is telling you that you have a
design problem.  You probably have high-coupling and low cohesion in that
method.

Refactoring is the act of intentional design, and you should always take the
opportunity to make your design better. Shims can be used to get out of this
impasse, but if you don't think about the problem you will end up with a [Big
Ball of Mud][6] for your design.

## Conclusion

Visual Studio 11 includes the new Fakes library for creating isolated unit
tests.  It includes two kinds of Fakes: 

* **Stubs** for creating lightweight, fast running concrete classes for
  interfaces and abstract classes your system uses. I reviewed Stubs in [my
  last article][4].
* **Shims** for intercepting and detouring almost any .NET call. Shims are
  particularly useful for removing internal dependencies of methods, and for
  getting you out of the "testability Catch-22".

Hopefully you have found these two articles useful. For more information on Fakes
please take some time looking through the [MSDN Documentation][5].

[1]: http://en.wikipedia.org/wiki/Catch-22_(logic)
[2]: http://www.amazon.com/gp/product/1451626657/ref=as_li_ss_tl?ie=UTF8&tag=peterprovosto-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=1451626657
[3]: http://msdn.microsoft.com/en-us/library/system.datetime.aspx
[4]: /blog/2012/04/15/visual-studio-11-fakes-part-1/
[5]: http://aka.ms/vs11-fakes
[6]: http://www.laputan.org/mud/
