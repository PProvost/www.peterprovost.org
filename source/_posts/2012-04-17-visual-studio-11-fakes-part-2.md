---
layout: post
title: "Visual Studio Fakes Part 2 - Shims"
date: 2012-04-16 17:31
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

## Visual Studio Fakes Series

* Visual Studio Fakes Part 1 - Stubs
* Visual Studio Fakes Part 2 - Shims
* Visual Studio Fakes Part 3 - Tweaking

## The Catch-22 of Refactoring to Enable Unit Testing

In Part 1, I reviewed Stubs, which are a simple way of creating concrete
implementations of interfaces and abstract classes for use in unit tests.

But sometimes it happens that you have to test a method where the dependencies
can't be simply injected via an interface. It might be that your code depends
on an external system like SharePoint, or simply that the code news up or uses
a concrete object inside the method, where you can't easily replace it.

The unit testing agilista have always said, "Refactor your code to make it more
testable," but therein lies the rub. I will again refer to the esteemed Martin
Fowler for a quote:

{% blockquote Martin Fowler http://martinfowler.com/refactoring/ %}

Refactoring is a disciplined technique for restructuring an existing body of
code, altering its internal structure without changing its external behavior.

{% endblockquote %}

How do you know if you are changing its external behavior? "Simple!" says the
Agilista, "You know you didn't change it as long as your unit tests still
pass." But wait... we don't have unit tests yet for this code (that's what
we're trying to fix), so I'm stuck... [Catch-22][1].

I have to quote [Joseph Heller's masterwork][2] just for fun:

{% blockquote Joseph Heller, Catch-22 p.56 ch. 5 %}

There was only one catch and that was Catch-22, which specified that a concern
for one's safety in the face of dangers that were real and immediate was the
process of a rational mind. Orr was crazy and could be grounded. All he had to
do was ask; and as soon as he did, he would no longer be crazy and would have
to fly more missions. Orr would be crazy to fly more missions and sane if he
didn't, but if he were sane he had to fly them. If he flew them he was crazy
and didn't have to; but if he didn't want to he was sane and had to. Yossarian
was moved very deeply by the absolute simplicity of this clause of Catch-22 and
let out a respectful whistle. (p. 56, ch. 5)

{% endblockquote %}

## Shim Your Way Out of the Paradox

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
         customer.LastUpdated = DateTime.Now;
         customer = repository.SaveOrUpdate(customer);
      }
   }
}
```

There is one minor change from our previous example. We are now setting the
`LastUpdated` property on the `Customer` object before passing it to the
repository. (I know this might not be the best way to do this, but go with
me...)

***How do we test that Save sets the correct value?***

You might start by writing a test like this. I'm using the same Stubs technique
I showed in the last article.

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
      var actualCustomer = new Customer { Id = 1, Name = "Sample Customer", LastUpdated=DateTime.MinValue };
      var viewModel = new CustomerViewModel(actualCustomer, repository);

      // Act
      var now = DateTime.Now;
      viewModel.Save()

      // Assert
      Assert.NotNull(savedCustomer);

      var delta = Math.Abs((savedCustomer.LastUpdated - now).TotalMilliseconds);
      const int accuracy = 10; // milliseconds
      Assert.True(delta <= accuracy, "LastUpdated was not appx equal to expected");
   }
}
```

There are, of course, a few issues with this code. How small can we make the
`accuracy` variable before the test starts to fail? How close is close enough?
What about when the `viewModel.Save()` code does extra work eating up some of
that time?

This example, while contrived, shows one of the kinds of thing that can be difficult
to test, but of course there are more.

Here's another example, from the same sample:

``` csharp
```




[1]: http://en.wikipedia.org/wiki/Catch-22_(logic)
[2]: http://www.amazon.com/gp/product/1451626657/ref=as_li_ss_tl?ie=UTF8&tag=peterprovosto-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=1451626657
[3]: http://msdn.microsoft.com/en-us/library/system.datetime.aspx
