---
layout: post
title: "How to avoid creating real tasks when unit testing async"
date: 2012-04-23 21:39
updated: 2012-04-23 22:53
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

***UPDATE: Stephen Toub pointed out that in .NET 4.5 you don't need my
`CreatePseudoTask()` helper method. See the bottom of this post for
more information.***

If you've been coding in VS11 Beta with .NET 4.5 you may have started
experimenting with using async and await in your programs. You also probably
noticed a lot more of the APIs you consume are starting to expose asynchonous
methods using Task and Task&lt;T&gt;.

This technology let's use specify that operations are long running and should
be expected to not return quickly. You basically get to fire off async
processes without you having to manage the threads yourself.  Behind the
scenes, the necessary state machine code is created and, as they say, "it just
works".

*I would really recommend reading all the great posts by Stephen Toub and
others over on the [PFX Team blog][1]. And of course the MSDN Docs on 
the [Task Parallel Library][4] should be reviewed too.*

But did you know that in VS11 Beta you can now create async unit tests? Both
MS-Test and the newest version of xUnit.net now support the idea of a unit test
that is async, and can therefore use the await keyword to block on a call that
returns a Task.

<!-- more -->

One of the interesting things about this occurs when you use async with a faked
interface that contains an async method.  Consider the case where you have an
interface that returns `Task<string>` because it is expected that some or all
of the implementors could be long running. Your interface definition might look
like this:

``` csharp
public interface IDoStuff
{
   Task<string> LongRunningOperation();
}
```

When you are testing a class that consumes this interface, you will want to
provide a fake implementation of that method. So what is the best way to do
that?

(Note: I will use VS11 Fakes for this example but it really doesn't matter.)

You might write a test like this:

``` csharp
[TestMethod]
public async Task TestingWithRealRunningTasks()
{
   // Arrange
   var stub = new StubIDoStuff
      {
         LongRunningOperation = () => Task.Run( () => "Hello there" );
      };
   var sut = new SystemUnderTest(stub);

   // Act
   var result = await sut.DoSomething(); // This calls the interface stub

   // Assert
   Assert.AreEqual( "Interface said 'Hello there'", result );
}
```

Assuming `DoSomething()` produces the formatted string that is expected, this
test will work. But there's a bit that is unfortunate...

You actually did spin off a background thread when you called Task.Run().  You
can confirm this with some well-placed breakpoints and looking at the threads.

But did you need to do that in your fake object? Not really. It probably slowed
your test down by a bit and really isn't required.

The `System.Threading.Tasks` namespace includes a class you can use to help you
with these kinds of things: `TaskCompletionSource<T>` (see [MSDN Docs][3]). This very cool
class can be used for a lot of different things like making event-based async
live in a TAP world, etc.

Stephen Toub says a lot about TCS in his post [The Nature of TaskCompletionSource&lt;TResult&gt;][2]
but the part most relevant to us here is where he says:

{% blockquote %}

Unlike Tasks created by Task.Factory.StartNew, the Task handed out by
TaskCompletionSource&lt;TResult&gt; does not have any scheduled delegate associated
with it. Rather, TaskCompletionSource&lt;TResult&gt; provides methods that allow you
as the developer to control the lifetime and completion of the associated Task.
This includes SetResult, SetException, and SetCanceled, as well as TrySet
variants of each of those.  

{% endblockquote %}

It "does not have any schedule delegates associated with it." That sounds
perfect!

***UPDATE: This code is only required in the .NET 4.0 version of Task
Parallels. See below for an updated .NET 4.5 version of this test that
doesn't require my helper method.***

So what I'm going to do is use TCS to create a task that just contains the
concrete return value, acting as if the long running operation has happened,
and returning a Task that the consuming code can treat normally.

Rewriting that last test using a TCS it would look like this:

``` csharp
[TestMethod]
public async Task TestWithHandCodedTCS()
{
   // Arrange
   var stub = new StubIDoStuff
   {
      LongRunningOperation = () => {
         var tcs = new TaskCompletionSource<string>();
         tcs.SetResult("Hello there!");
         return tcs.Task;
      }
   };
   var sut = new SystemUnderTest(stub);

   // Act
   var result = await sut.DoSomething();

   // Assert
   Assert.AreEqual("Interface said 'Hello there!'", result);
}
```

Now I no longer have the background thread! But that chunk of code where I
create the TCS is annoying so I can refactor it out into a reusable helper
method:

``` csharp
internal class TaskHelpers
{
    public static Task<T> CreatePseudoTask<T>(T result)
    {
        TaskCompletionSource<T> tcs = new TaskCompletionSource<T>();
        tcs.SetResult(result);
        return tcs.Task;
    }
}
```

Now I can rewrite the test to this:

``` csharp
[TestMethod]
public async Task TestWithPseudoTask()
{
   // Arrange
   var stub = new StubIDoStuff
   {
       LongRunningOperation = () => TaskHelpers.CreatePseudoTask<string>("Hello there!")
   };
   var sut = new SystemUnderTest(stub);

   // Act
   var result = await sut.DoSomething();

   // Assert
   Assert.AreEqual("Interface said 'Hello there!'", result);
}
```

Nice and simple, and easy to read, without all the mess of creating real
scheduled background Task delegates.

What do you think? Useful? I've found it to help me a bit when writing tests
against async stuff.

-------------------------------------------------------------------------------

***UPDATE: Using Task.FromResult in .NET 4.5***

Apparently this patterns was common enough in the .NET 4.0 version of TPL that
the team decided to just "make it so" and bake it in so we don't need the
helper method anymore. And since it is baked in, it is probably optimized to
perform even better.

Here is the updated test using the new `Task.FromResult` method.

``` csharp
[TestMethod]
public async Task TestWithFromResultHelper()
{
   // Arrange
   var stub = new StubIDoStuff
   {
       LongRunningOperation = () => Task.FromResult("Hello there!")
   };
   var sut = new SystemUnderTest(stub);

   // Act
   var result = await sut.DoSomething();

   // Assert
   Assert.AreEqual("Interface said 'Hello there!'", result);
}
```

Enjoy!

[1]: http://blogs.msdn.com/b/pfxteam/
[2]: http://blogs.msdn.com/b/pfxteam/archive/2009/06/02/9685804.aspx
[3]: http://msdn.microsoft.com/en-us/library/dd449174.aspx
[4]: http://msdn.microsoft.com/en-us/library/dd460717(v=vs.110).aspx
