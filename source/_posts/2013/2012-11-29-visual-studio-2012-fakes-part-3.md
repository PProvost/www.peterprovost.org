---
layout: post
title: "Visual Studio 2012 Fakes - Part 3 - Observing Stub Behavior"
date: 2012-11-29 12:04
comments: true
categories: 
- Code
- Visual Studio
tags:
- visual studio
- unit testing
- fakes
- mocking
---

This year at both TechEd North America and TechEd Europe I gave a presentation
called "Testing Untestable Code with Visual Studio Fakes". So far VS Fakes has
been very well received by customers, and most people seemed to understand my
feelings about when (and when not)  to use Shims (see [Part 2][] for more on
this). But one thing that has consistently come up has been questions about
Behavioral Verification.

I talked about this briefly in [Part 1][] of this series, but let me rehash a
few of the important points:

* Stubs are dummy implementations of interfaces or abstract classes that you
  use while unit testing to provide concrete, predictable instances to fulfill
  the dependencies of your system under test.
* Mocks are Stubs that provide the ability to verify calls on the Stub,
  typically including things like the number of calls made, the arguments
  passed in, etc.

With Visual Studio Fakes, introduced in Visual Studio 2012 Ultimate, we are
providing the ability to generate fast running, easy to use Stubs, but they are
**not** Mocks.  They do not come with any kind of behavioral verification built
in. But as I showed at TechEd Europe, there are hooks available in the
framework that allow one to perform this kind of verification. This post will
show you how they work and how to use them to create your own Mocks.

<!-- More -->

## Why would you need to verify stub calls?

There is a long-running philosophical argument between the "mockists" and the
"classists" about whether mocking is good or bad. My personal take is that they
can be very useful when unit testing certain kinds of code, but also that
they can cause problems if overused, because rather than pinning down the
external behavior of a method, they pin the implementation. But rather than
dwell on that, lets look at some of the cases where they are valuable. 

Suppose you have a class who's responsibility is to coordinate calls to other
classes. These might be classes like message brokers, delegators, loggers, etc.
The whole purpose of this class is to make predictable, coordinated calls on
other objects. That is the external behavior we want to confirm.

Consider a system like this:

``` csharp System Under Test
// ILogSink will be implemented by the various targets to which
// log messages can be sent.
public interface ILogSink
{
   void LogMessage(string message, string categories, int priority);
}

// MessageLogger is a service class that will be used to log the
// messages sent by the application. Only the method signatures
// are shown, since in this case we really don't need to care
// about the implementation.
public class MessageLogger
{
   public void RegisterMessageSink(ILogSink messageSink);

   public void LogMessage(string message);
   public void LogMessage(string message, string categories);
   public void LogMessage(string message, string categories, int priority);
}
```

What we need to confirm is that the right calls are made into the registered
sinks, and that all the parameters are passed in correctly. When we use Stubs
to test a class like that, we will be providing fake versions of the `ILogSink`
so we should be able to have the fake version tell us how it was called.

## Behavioral verification using closures

I showed in my previous posts how you can combine lambda expressions and
closures to pass data out of a stub's method delegate. For this test, I
will do this again to verify that the sink is being called.

``` csharp Testing that the sink is called
[TestMethod]
public void VerifyOneSinkIsCalledCorrectly()
{
    // Arrange
    var sut = new MessageLogger();
    var wasCalled = false;
    var sink = new StubILogSink
    {
        LogMessageStringStringInt32 = (msg, cat, pri) => wasCalled = true
    };
    sut.RegisterMessageSink(sink);

    // Act
    sut.LogMessage("Hello there!");

    // Assert
    Assert.IsTrue(wasCalled);
}
```

This works, and isn't really too verbose. But as I start to test more things,
it can become a bit cluttered with complex setup code.

``` csharp Testing that multiple sinks are called
[TestMethod]
public void VerifyMultipleSinksCalledCorrectly()
{
    // Arrange
    var sut = new MessageLogger();
    var wasCalled1 = false;
    var wasCalled2 = false;
    var wasCalled3 = false;
    var sink1 = new StubILogSink
    {
        LogMessageStringStringInt32 = (msg, cat, pri) => wasCalled1 = true
    };
    var sink2 = new StubILogSink
    {
        LogMessageStringStringInt32 = (msg, cat, pri) => wasCalled2 = true
    };
    var sink3 = new StubILogSink
    {
        LogMessageStringStringInt32 = (msg, cat, pri) => wasCalled3 = true
    };
    sut.RegisterMessageSink(sink1);
    sut.RegisterMessageSink(sink2);
    sut.RegisterMessageSink(sink3);

    // Act
    sut.LogMessage("Hello there!");

    // Assert
    Assert.IsTrue(wasCalled1);
    Assert.IsTrue(wasCalled2);
    Assert.IsTrue(wasCalled3);
}
```

As I add more tests to verify the parameters, it can get out of hand pretty
quickly.  Closures are great when I'm checking only a few things, but the
more I want to track, the harder it gets.

What I really need is a better way to track these calls. 

## Introducing IInstanceObserver

When we were creating the Stubs framework, we knew these situations would come up. We also
knew that people can get very passionate about the syntax and form that their
mocking frameworks use. So we decided to introduce an extension point into the
generated Stubs that enables people to create any kind of mocking or
verification API.

Every Stub that Visual Studio generate has a property on it called
`InstanceObserver` that can take any object which implements the
`IStubObserver` interface.  When an observer is installed into a Stub, it will
be called every time a method or property on the Stub is accessed. This is what
you really need to do the kind of behavioral verification I need here.

The definition of the interface `IInstanceObserver` is pretty simple:

``` csharp IInstanceObserver interface
public interface IStubObserver
{
   void Enter(Type stubbedType, Delegate stubCall);
   void Enter(Type stubbedType, Delegate stubCall, object arg1);
   void Enter(Type stubbedType, Delegate stubCall, object arg1, object arg2);
   void Enter(Type stubbedType, Delegate stubCall, object arg1, object arg2, object arg3);
   void Enter(Type stubbedType, Delegate stubCall, params object[] args);
}
```

*The reason there are five overloads is an optimization based on the
observation that most methods in .NET have three or fewer arguments. The final
overload is used for those that exceed three. This is a common pattern in the
CLR and .NET BCL.*

The first parameter to each call is the type of the interface that was stubbed. 
The second parameter is a delegate that represents the call which was made on
the interface. The remaining parameters are the arguments provided to the call.

The delegate is properly typed so even if the interface or method is generic,
the `MethodInfo` provided in the `stubCall` delegate will have the types that
were actually used when the object was called.

## Creating a custom StubObserver

Using this interface, I can create a class that will record the calls
made to my stub.

``` csharp CustomObserver
public class CustomObserver : IStubObserver
{
    List<MethodInfo> calls = new List<MethodInfo>();

    public IEnumerable<MethodInfo> GetCalls()
    {
        return calls;
    }

    public void Enter(Type stubbedType, Delegate stubCall, params object[] args)
    {
        calls.Add(stubCall.Method);
    }

    public void Enter(Type stubbedType, Delegate stubCall, object arg1, object arg2, object arg3)
    {
        this.Enter(stubbedType, stubCall, new[] { arg1, arg2, arg3 });
    }

    public void Enter(Type stubbedType, Delegate stubCall, object arg1, object arg2)
    {
        this.Enter(stubbedType, stubCall, new[] { arg1, arg2 });
    }

    public void Enter(Type stubbedType, Delegate stubCall, object arg1)
    {
        this.Enter(stubbedType, stubCall, new[] { arg1 });
    }

    public void Enter(Type stubbedType, Delegate stubCall)
    {
        this.Enter(stubbedType, stubCall, new object[] { } );
    }
}
```

*Yes, I realize that this implementation spoils the whole point of the overloads
on IStubObserver, but we'll get rid of that later.*

Now we can rewrite two tests above without using closures. The observer
will do the tracking for us, and we can simply check what it saw after
we make our call to the system under test.

``` csharp Testing with the CustomObserver
[TestMethod]
public void VerifyOneSinkIsCalledCorrectly()
{
   // Arrange
   var sut = new MessageLogger();
   var sink = new StubILogSink { InstanceObserver = new CustomObserver() };
   sut.RegisterMessageSink(sink);

   // Act
   sut.LogMessage("Hello there!");

   // Assert
   Assert.IsTrue(((CustomObserver)sink.InstanceObserver).GetCalls().Any(mi => mi.Name.Contains("ILogSink.LogMessage")));
}

[TestMethod]
public void VerifyMultipleSinksCalledCorrectly()
{
   // Arrange
   var sut = new MessageLogger();
   var sink1 = new StubILogSink { InstanceObserver = new CustomObserver() };
   var sink2 = new StubILogSink { InstanceObserver = new CustomObserver() };
   var sink3 = new StubILogSink { InstanceObserver = new CustomObserver() };
   sut.RegisterMessageSink(sink1);
   sut.RegisterMessageSink(sink2);
   sut.RegisterMessageSink(sink3);

   // Act
   sut.LogMessage("Hello there!");

   // Assert
   Assert.IsTrue(((CustomObserver)sink1.InstanceObserver).GetCalls().Any(mi => mi.Name.Contains("ILogSink.LogMessage")));
   Assert.IsTrue(((CustomObserver)sink2.InstanceObserver).GetCalls().Any(mi => mi.Name.Contains("ILogSink.LogMessage")));
   Assert.IsTrue(((CustomObserver)sink3.InstanceObserver).GetCalls().Any(mi => mi.Name.Contains("ILogSink.LogMessage")));
}
```

While we're not using the closure anymore, those asserts are pretty ugly, so we
will want to look at fixing that. But before we do, I want to delete some code.

## Using the built-in StubObserver class

It turns out that VS2012 include an implementation of `IStubObserver` in the
framework that does everything my implementation above does, but it also
includes all the missing stuff like the arguments, etc. This class is called
`StubObserver` and is in the `Microsoft.QualityTools.Testing.Fakes.Stubs`
namespace.

If we swap out my `CustomObserver` for the built-in `StubObserver`, the
resulting test code is very similar, with just a few changes to handle how
`StubObserver` provides the method call data back to us.

``` csharp Testing with StubObserver
[TestMethod]
public void VerifyOneSinkIsCalledCorrectly()
{
    // Arrange
    var sut = new MessageLogger();
    var sink = new StubILogSink { InstanceObserver = new StubObserver() };
    sut.RegisterMessageSink(sink);

    // Act
    sut.LogMessage("Hello there!");

    // Assert
    Assert.IsTrue(((StubObserver)sink.InstanceObserver).GetCalls().Any(call => call.StubbedMethod.Name == "LogMessage"));
}

[TestMethod]
public void VerifyMultipleSinksCalledCorrectly()
{
    // Arrange
    var sut = new MessageLogger();
    var sink1 = new StubILogSink { InstanceObserver = new StubObserver() };
    var sink2 = new StubILogSink { InstanceObserver = new StubObserver() };
    var sink3 = new StubILogSink { InstanceObserver = new StubObserver() };
    sut.RegisterMessageSink(sink1);
    sut.RegisterMessageSink(sink2);
    sut.RegisterMessageSink(sink3);

    // Act
    sut.LogMessage("Hello there!");

    // Assert
    Assert.IsTrue(((StubObserver)sink1.InstanceObserver).GetCalls().Any(call => call.StubbedMethod.Name == "LogMessage"));
    Assert.IsTrue(((StubObserver)sink2.InstanceObserver).GetCalls().Any(call => call.StubbedMethod.Name == "LogMessage"));
    Assert.IsTrue(((StubObserver)sink3.InstanceObserver).GetCalls().Any(call => call.StubbedMethod.Name == "LogMessage"));
}
```

## Simplifying the Assertions

While that works, the Assert calls are certainly not friendly to the eye. What we'd really like is
something more like this:

``` csharp
Verify.MethodCalled( sink1, "LogMessage" );
```

It turns out that making this helper method isn't very hard.

``` csharp Verify Helper Class
public static class Verify
{
   public void MethodCalled<T>( IStub<T> stub, string methodName )
   {
      var observer = stub.InstanceObserver;
      if (observer == null)
         throw new ArgumentException("stub", "No InstanceObserver installed into the stub.");

      var wasCalled = observer.GetCalls().Any(call => call.StubbedMethod.Name == methodName);
      if (wasCalled == false)
         throw new VerificationException("Method {0} was expected, but was not called", methodName);
   }
}
```

That isn't too bad. Still not perfect because I really don't like the string for
the method name because it won't be refactoring resilient. Fixing that will take
us on a trek through the world of Linq expressions however, which I will cover in
a later post.

## Conclusions

While the VS 2012 Fakes framework does not have a built-in verification framework, you can do
verification using existing language constructs like closures and lambdas. You also can leverage
the `IStubObserver` interface to create a more customized behavioral frameworks, potentially
going all the way to a full fluent API for "mockist" style behavioral verification.

If anything, the assert statements have gotten uglier, but we have now
eliminated all of the closures, and moves all of the verification logic to the
Assert section of the test. We're making headway.

[Part 1]: /blog/2012/04/25/visual-studio-11-fakes-part-2/
[Part 2]: /blog/2012/04/15/visual-studio-11-fakes-part-1/

