---
layout: post
title: "Visual Studio 2012 Fakes - Part 3 - Observing Stub Behavior"
date: 2012-08-23 15:04
comments: true
published: false
categories: 
- Code
- Visual Studio
tags:
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
can be very useful when unit testing certain kinds of classes, but also that
they can cause problems if overused because rather than pinning down the
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

When we were creating VS Fakes, we knew these situations would come up. We also
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

While we're not using the closure anymore, the asserts are pretty ugly, so we
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

Of course what we'd really like is something that uses C# expressions to make this
strongly typed and even easier to read.

``` csharp
Verify.MethodCalled( sink => sink.LogMessage );
```

This isn't all that hard to achieve, but it will force us to dig into Linq expressions
and lambdas, which is out of scope for this post.

## Getting rid of the ugly asserts using Lambda Expressions

There are a few things we can do to clean up those asserts. They have a very common structure,
making them a good candidate for some refactoring.

*Note: In the assert/verify statements above, what I was really checking was that there was at least
one call to the method we wanted. It was a very naive implementation, but it sufficed to show
how this stuff works. I'll stick with that simplification for now, focusing instead on the
refactoring. In a later post, I'll provide a much more complete implementation.*

Ideally, we'd like to have a nice simple method like this:

``` csharp
sink1.VerifyMethodCall(s => s.LogMessage("Hello there!"))
```

I chose to use lambda expressions here to make sure that we get syntactic
verification of the method calls. Many early mocking frameworks used strings
here, but now that we have expressions, I think they will make a better
experience.

It turns out we actually can create this API using an **extension method**. To
do this we need to create a static class to hold the extension, and then when
we create the static method, we use the `this` keyword to tell the compiler that
this method should be mixed in to the actual class. The type for the first parameter
tells it what type to mix into, so first we have to figure that out.

If we look at the definition of any of our generated stubs, we will see that for
interfaces (which we have here), they all derive from `StubBase<T>` where `T` is
the type of the interface. This is a perfect candidate for our extension method.

To get the syntax we want for the `VerifyMethodCall` method I said we wanted, we
have to define it like this:

``` csharp
public static void VerifyMethodCall<T>(this StubBase<T> stub, Expression<Action<T>> expression) where T : class
```

It is important to note that this method definition will work for methods, but
will not work for properties on the stub. We'd need to introduce a different
signature to make that work, but we'll leave that for later.

## Creating the verification extension library

The cool thing about this extension method is that we have everything we need.
The type `T` is the type of the interface, the parameter `stub` is the actual
stub instance, and the `expression` has everything the user provided in his
verification expression.

I'm going to do a very naive implementation here, that would need a bunch of
work to be made bullet-proof and general purpose, but it should show you 
enough to see how it works.

``` csharp Custom Verification Extension Method
public static class StubBaseExtensions
{
    // Assert.IsTrue(((StubObserver)sink.InstanceObserver).GetCalls().Any(call => call.StubbedMethod.Name == "LogMessage"));
    public static void VerifyMethodCall<T>(this StubBase<T> stub, Expression<Action<T>> expression) where T : class
    {
        // Check that we have a valid observer installed and get the calls
        var observer = stub.InstanceObserver as StubObserver;
        if (observer == null)
            throw new ArgumentException("No compatible InstanceObserver found on the stub. You must set the InstanceObserver property on the stub to an instance of StubObserver.", "stub");
        var calls = observer.GetCalls();

        // Take the expression apart
        var bodyExpression = expression.Body as MethodCallExpression;
        var expectedMethodInfo = bodyExpression.Method;
        // Massive assumption: Only constant expressions allowed
        var expectedArgs = bodyExpression.Arguments.Select(expr => ((ConstantExpression)expr).Value).ToArray();

        // Find all matching MethodInfo
        var matchingCalls = calls.Where(call => call.StubbedMethod == expectedMethodInfo);

        // Fail fast if we have no matches at all
        if (matchingCalls.Count() == 0)
            throw new Exception("No matching calls found");

        // If we have some matches, check if the arguments match
        foreach (var call in calls)
        {
            var actualArgs = call.GetArguments();
            for (int i = 0; i < expectedArgs.Length; i++)
            {
                if (Object.Equals(expectedArgs[i], actualArgs[i]) == false)
                    throw new Exception("No matching calls found with the expected arguments");
            }
        }
    }
}
```

With that extension method in hand, we can now re-write our two tests from above.

``` csharp
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
    // Assert.IsTrue(((StubObserver)sink.InstanceObserver).GetCalls().Any(call => call.StubbedMethod.Name == "LogMessage"));
    sink.VerifyMethodCall(s => s.LogMessage("Hello there!", "General", 1));
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
    sink1.VerifyMethodCall(s => s.LogMessage("Hello there!", "General", 1));
    sink1.VerifyMethodCall(s => s.LogMessage("Hello there!", "General", 1));
    sink1.VerifyMethodCall(s => s.LogMessage("Hello there!", "General", 1));
}

```

I think that is a lot easier to read and understand, and except for the 
property we have to set in the stub initialization, all of the observer
internals are totally hidden away.

## Conclusions

While the VS 2012 Fakes framework does not have a built-in verification framework, you can do
verification using existing language constructs like closures and lambdas. You also can leverage
the `IStubObserver` interface to create a more customized behavioral frameworks, potentially
going all the way to a full fluent API for "mockist" style behavioral verification.

If anything, the assert statements have gotten uglier, but we have now
eliminated all of the closures, and moves all of the verification logic to the
Assert section of the test. We're making headway.

## Next steps

There are clearly a lot of things we'd like to do with this to really
turn it into a general purpose verification library for Stubs.

1. The `VerifyMethodCall` implementation is hard-coded with a bunch of
   assumptions and doesn't really do any good error checking. 
2. It requires the user to provide all of the arguments. This worked for these
   particular tests, , but there are going to be times when we might want to
   allow a range, or even any value, as long as the call happens. 
3. It has no provisions for saying how many times the expected method should
   have been called. It would be nice to be able to say "at least N times", or
   "between N and M times".
4. Because of the shortcuts I took, it actually requires all of the expected
   method calls to have matching arguments.
5. We have no support for property getters or setters. We will certainly need
   these in a robust verification library.
6. It sure would be nice if we could get rid of the requirement to set the
   InstanceObserver property when creating the stub.

In a future post, I'll tackle most of these and (hopefully) be
much closer to something general purpose that anyone can use with their
Stubs-based tests.

[Part 1]: /blog/2012/04/25/visual-studio-11-fakes-part-2/
[Part 2]: /blog/2012/04/15/visual-studio-11-fakes-part-1/

