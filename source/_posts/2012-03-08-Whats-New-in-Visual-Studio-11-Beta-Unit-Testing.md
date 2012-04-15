---
layout: post
title: "What's New in Visual Studio 11 Beta Unit Testing"
comments: true
date: 2012-03-08 00:10:00
updated: 2012-03-08 10:22:43
categories:
 - Technology
tags:
 - vs11
 - unit testing
 - tdd
 - agile development
subtext-id: 84cc694c-4a9e-4987-9c77-22384c0cb5a2
alias: /blog/Whats-New-in-Visual-Studio-11-Beta-Unit-Testing.aspx
---


For those of you who haven't been following the changes to unit testing that we
first previewed back at the //BUILD/ conference, and for those you who did but
want to know what has changed, this post is going to take you through the whole
thing. We have made a lot of changes to testing in Visual Studio. These changes
are pretty drastic in some cases, but were driven by years of customer feedback
and a clarification of our focus and vision. 

<!-- more -->

## Customer Feedback

Ever since we first shipped unit testing back in Visual Studio Team System we've
been given praise and criticism for what it was. It was too slow. Some called it
a bad copy of NUnit. Many said we should have just shipped NUnit. There was no
support for C++ or Javascript or anything else. As time went on, even though we
did a lot of work to bring the performance to parity with other frameworks, the
label "too slow" still stuck and more and more people went back to using other
test frameworks like NUnit or xUnit.net. But then they had no integrated
experience and had to use third party VS plugins to run their tests in the IDE.
Additionally, our test framework (colloquially known as MS-Test) was not as fast
to evolve as other frameworks, due to the nature of our release cycle and of our
back-compat requirements. 

Another criticism we got from developers, and agile developers in particular,
was that our user experience felt like it was designed for testers and didn't
support a rapid test-code-test-code rhythm like that followed by agile
developers. Again, we made small steps to improve this over time (double click
to code in VS2010 was one step) but still people wanted more. It just didn't
feel like a tool for developers and agile folks. 

So for Visual Studio 11, we bit the bullet and committed to changing this, so
let's see what we did... 

## The Unit Test Explorer

[{% img right /images/blog/Windows-Live-Writer/903881aa7ac7/2800560E/image_thumb.png Unit Test Explorer %}](/images/blog/Windows-Live-Writer/903881aa7ac7/385BCDC7/image.png)In VS11, we have replaced the old Test View and Test Results windows with the Unit Test Explorer. This new user interface has a number of important elements that let developers quickly interact with their tests. 

**_Red Green Bar_**  
This seemingly simple feature has been one of the top asks from agile developers
since the beginning. Give me progress as the tests are run, changing the bar
from green to red as soon as any tests fail. Simple, and now there. 

**_Search_**  
Like most of the rest of VS11, we have integrated search. Search also supports
using tokens, like in Windows Explorer, to search for certain kinds of things.
So you might choose to add Result:"Failed" to your search string and we will
limit the results to only failed tests. In the Beta you can use the Result,
FilePath and FullName tokens to control your search results. 

**_Most Important Tests First_**  
Again it seems obvious when you look at it, but which tests do you care about
most after a run? The ones that failed. So we float those to the top of the
list, making it easy to see what you need to fix. 

**_Run Details_**  
All of the details of the run are in a pane at the bottom of the window. Quickly
see how many failed, how many passed, how long the run took, etc. Click on a
single test and see even more information about that test including error
message, source file, stack trace and links to more information. 

We are continuing to do a lot of work on this user experience, so please let us
know what you think. Some of the things we're looking at right now include
grouping options, more searching options and better access to specific test
result information. 

To read more about the Unit Test Explorer in VS11, please check out the [MSDN
Documentation][1].

[1]: http://msdn.microsoft.com/en-us/library/hh270865(v=vs.110).aspx

## Support For 3rd Party Frameworks

But even before tackling the UI issues, we knew we had to support 3rd party test
frameworks. To enable this, we created a new test _meta-runner_. This is a layer
that simply coordinates and controls the flow of data between the user interface
and the underlying test frameworks. The architecture of it looks something like
this. 

{% img center /images/blog/Windows-Live-Writer/903881aa7ac7/74C41CA4/image18.png Unit Test Platform Architecture %}

Using simple plugin adapters, third party test frameworks can plug into the test
platform layer and get the full experience of running inside of Visual Studio.
One of our design goals for this has been to make sure the test frameworks
didn't have to do an insane amount of work to get this integration and if you
look at the source for some of the [adapters that have already been
released](http://aka.ms/msdn-vs11-unit-test-plugins), you will see we succeeded. 

These adapters simply have to translate commands like "discover tests" and "run
tests" into their own corresponding actions, and then translate their own test
case and result data back into our data structures. Occasionally, they have to
implement another interface or two to tell us about a new kind of test source
(e.g. JavaScript files) but for languages that produce DLLs and EXEs, that step
can be skipped. 

The best part of all is that since these frameworks are all running the same
way, they all get the same experiences in the IDE including things like
Debugging support, Code Coverage and the new Fakes framework (more on that in a
minute). 

To learn about finding and installing plugins for third-party test frameworks,
see the [MSDN Documentation][2].

[2]: http://msdn.microsoft.com/en-us/library/hh598952(v=vs.110).aspx

## MS-Test Improvements

But we also haven't ignored the built-in Visual Studio Unit Testing framework
(aka MS-Test). This framework is not dead and we are going to continue to invest
in making it better. 

There were a couple of low hanging fruit that we tackled: 

* Performance and scale improvements - more tests faster is a good thing 
* Proper support for .NET 64-bit and multi-targeting 

Also, you can rest assured that your VS2010 Test Projects will continue to work
in VS11, and in fact, can go back and forth without issue. 

But we also added some new things! 

### Async Unit Test Support

If you've been exploring some of the new .NET 4.5 APIs and the new Windows 8
APIs, you probably have noticed a bunch of methods are using the new Task Async
Pattern (TAP) first introduced in the Task Parallel Library. 

One of the common things you will find yourself doing when coding with long
running methods that return Task or Task<T> is wanting to "await" on the result.
This is particularly true when unit testing, because you probably need the
result value to test against! 

In VS11 Beta, MS-Test now supports creating test methods that are marked **async
**and that can therefore use the **await **keyword inside the method body. Here
is an example: 
 
``` csharp Example Async Unit Test
[TestMethod]
public async Task MyAsyncTest()
{
   var result = await SomeLongRunningOperation();
   Assert.IsTrue( result );
}
```
  
(BTW, xUnit.net has also added support for async test method. Expect more to
follow suit soon.) 

### Native Unit Testing Support

One thing that has C/C++ people very excited about this release is that we now
have a true native unit testing framework in the box. No longer will you be
required to either use the dreaded "/clr" flag or fall back to 3rd party
frameworks for your C++ unit testing. 

Here's a quick example: 

``` cpp Example C++ Unit Test
#include "stdafx.h"
#include 
#include "..\MyProjectUnderTest\MyCodeUnderTest.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;

TEST_CLASS(TestClassName)
{
public:
   TEST_METHOD(TestMethodName)
   {
      // Run a function under test here.
      ASSERT::AreEqual(expectedValue, actualValue, L"message", LINE_INFO());
   }
}
```
  
More information on that VS11 native unit testing can be found in the [MSDN
Documentation](http://aka.ms/vs11-unit-testing-native-code). 

## The Visual Studio Fakes Framework

In VS11 we have included a new test isolation and stubbing framework for managed
.NET code that we call Visual Studio Fakes. 

One of the best things you can do to ensure your unit tests run fast, are
resilient and stable, and actually test what you want to test, is to isolate the
code you're testing from everything else. I sometimes describe this as "the
scientific method for code". Like the scientific method, we want to control the
variables at play and be sure the thing we're evaluating does what we think it
should do under controlled conditions. 

Visual Studio fakes lets you easily create tests that have this kind of
isolation. It provides two ways to do this: 

* **Stubs** are concrete implementations of interfaces and abstract classes that
  can be passed in to your system under test. It is important to note that our
  Stubs are _not_ mocks in the purist sense, because they do not provide a
  behavioral verification check. 
* **Shims** are run-time method interceptors. With Shims you can provide your
  own implementation for almost any method available to your code in .NET, and
  that includes types and methods from the .NET base class libraries. 

When you create Stubs and Shims you provide simple delegates or lambdas for the
methods implementations you care about, and we do the rest. Here's an example
Stub from the MSDN docs: 

``` csharp Example Fakes Test Showing Stub
[TestMethod]
public void GetValue() 
{
   // Arrange
   var stub = new StubIGenericMethod();
   stub.GetValueOf1 = () => 5;
   IGenericMethod target = stub;

   // Act, Assert
   Assert.AreEqual(5, target.GetValue());
}
```

Creating Fakes is as easy as right-clicking on one of your project references
and choosing **Add Fakes Assembly**. 

You can read more about Fakes in the [MSDN
Documentation](http://aka.ms/vs11-fakes), and I will be making a more detailed
post about it very soon. 

## Code Coverage Improvements

Have you tried to quickly get code coverage information inside Visual Studio
2010? I know I did, and I didn't like all of the configuration steps it
required. Apparently many of our customers felt the same way, so we made it a
lot easier. 

In the Unit Test Explorer, to get the Code Coverage for your solution, you now
simply click the Run... dropdown button and choose **Analyze Code Coverage**.
That's it. When the test run is complete, the Code Coverage window will open and
you can see the same results you have in VS 2010, including being able to turn
on in-editor coloring. 

But sometimes, especially when you are getting existing code bases under test,
you want to see exactly what one or two tests cover. That is now easy too. Just
select those tests in the Unit Test Explorer, right click on them and choose
Analyze Code Coverage. We will perform a code coverage test run with only those
tests and give you the results. Nice and simple. 

## Continuously Running Your Tests

One of the things I find myself doing when I am in the code-test-code-test loop,
is running my tests after every successful build. Since this is such a common
pattern, especially for people doing TDD or writing lots of unit tests, we
decided to just make it a feature. 

To enable this, open the **Unit Test** main menu, go to **Unit Test Settings**,
and select **Run Tests After Build**. We have recently added a toggle the button
in the Unit Test Explorer tool window, so in the next release it is easier to
toggle on and off.

When this option is enabled, we will run tests after each successful build. If
you had any failing tests in your last run, we will take the shortcut of running
those first. If they pass, we will then run all tests. Our goal here was to get
you feedback quickly and to keep you coding "in the green". 

## What is not there?

This is a big set of changes and consequently some things are not there in the
Beta. Some may come back, some will not, but these changes are setting us up to
do a lot of great things in the future, and we are confident that it was the
right decision. 

### Removed or deprecated in VS11

* **Test Lists** - Deprecated in VS11. If you have Test Lists from your VS2010
  test projects, they will still work, but VS11 does not have a way for you to
  create new ones. We have some very cool ideas of how to address this cut, and
  we think you will like what we have in mind. 
* **Private Accessors** - This feature was deprecated in the VS2010 product and
  has been removed in VS11. If you have test projects from VS2010 that include
  private accessors, they will still work in VS11, but the wizard for creating
  new ones no longer exists. 
* **Test Impact in the IDE** - Removed in VS11 (but still present in MTM and
  Team Build). The Test Impact feature was originally created for the Microsoft
  Test Manager (MTM) and Team Build experiences, and was added to VS2010 late in
  the cycle. And it shows. We had very consistent feedback that it was too slow
  and would often return incorrect results, so we removed it. We do still
  believe that the scenario of telling the developer which tests are important
  to run is a very important scenario, and we will continue to work to find good
  solutions here, but this feature simply was not the answer. 
* **Generate Unit Test Wizard** - In VS2010 you could right click on a method in
  your code and we would generate a unit test into your test project. This
  wizard was very tightly coupled to MS-Test and depended on features like
  Private Accessors to do its work, so it was cut. We are exploring alternatives
  here, but don't have any good solutions yet. 

### Not there yet, but we are working on it

* **Unit Test Startup Performance** - Right now we have a pretty ugly delay
  after you start a test run and we are aggressively working to make that go
  away. 
* **Grouping and sorting in the Unit Test Explorer** - We know that there are a
  lot of experience gaps in the user experience right now and this is a painful
  one. We are working to address this right now. 
* **Editor right-click to run** - Right now we have the "Run Tests" menu in the
  editor context menu, but it runs all of the tests in that file. We know people
  want to run a single test and not the whole file and will be working to put
  this back soon. 
* **Hard to see test details** - One thing we've heard is that sometimes people
  want a full-document view where they can see everything about a test: output
  messages, stack traces... everything. We are looking into a good solution
  here. 
* **Copy test results to clipboard** - In the Beta you can right click on any
  test and choose Copy, which will put that test's result information on the
  clipboard. We want to make a better experience than that that lets people
  select and copy from the details themselves. 
