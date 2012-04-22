---
layout: post
title: "Follow-up to CrossThreadTestRunner Comments"
comments: false
date: 2004-11-04 08:29:00
updated: 2008-07-06 14:18:36
categories:
 - Agile Software Development
 - Technology
tags:
 - tdd
 - agile development
subtext-id: 4b4af19a-7785-476b-ad24-6f74a772e2ff
alias: /blog/post/Follow-up-to-CrossThreadTestRunner-Comments.aspx
---


[Jamie Cansdale](http://weblogs.asp.net/nunitaddin) has posed a number of interesting questions about my [CrossThreadTestRunner class](/archive/2004/11/03/2051.aspx) and the [example code](/archive/2004/11/03/2052.aspx#FeedBack). Rather than address them as follow-up comments, I've decided to answer them in a follow up here. 

Jamie wrote: 

> You mentioned in your post that you can't make any promises about it working on any other runtimes. Can you be sure you'll never want to port these tests to .NET 2.0 or Mono? If you do it would be nice to have confidence that at least your tests will work. 

Can I be sure that it will work in Mono or Whidbey? No I can't. I wrote **the simplest thing that could possibly work** to solve my problem. I don't need to compile on either Whidbey or Mono, so I didn't address them. 

However, if I did need to support those other frameworks, the code is well factored so it would be very easy to do. (My guess is that .NET Remoting uses that private field in Whidbey just like it does in .NET 1.1. In fact, I would guess that a similar method is used in Mono. One quick test, or a bit of Reflector work,&nbsp_place_holder;would confirm it.) 

Jamie wrote: 

> Try using the following code instead. I think you'll get the effect you're looking for.   
  
class CrossThreadTestRunnerException : Exception   
{   
public CrossThreadTestRunnerException(Exception e) : base(null, e) {}   
public override string ToString() { return this.InnerException.ToString(); }   
}   
  
Then just...   
  
throw new CrossThreadTestRunnerException(e); 

While that is an interesting idea, the problem is that it screws up NUnit's Assertion reporting. So if I make that change to the code from [the previous example](/archive/2004/11/03/2052.aspx#FeedBack), I will get the following output from NUnit-Console: 

> NUnit version 2.1.4  
Copyright (C) 2002-2003 James W. Newkirk, Michael C. Two, Alexei A. Vorontsov, Charlie Poole.  
Copyright (C) 2000-2003 Philip Craig.  
All Rights Reserved. 
> 
> .F  
Tests run: 1, Failures: 1, Not run: 0, Time: 0.04015 seconds 
> 
> Failures:  
1) NUnitHelpers.MultiThreadedTests.Test1 : NUnitHelpers.CrossThreadTestRunnerException : Exception of type NUnitHelpers.CrossThreadTestRunnerException was thrown.  
&nbsp_place_holder; ----> NUnit.Framework.AssertionException : This should fail the test, right?  
&nbsp_place_holder;&nbsp_place_holder; at NUnitHelpers.CrossThreadTestRunner.ThrowExceptionPreservingStack(Exception exception) in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\crossthreadtestrunner.cs:line 35  
&nbsp_place_holder;&nbsp_place_holder; at NUnitHelpers.CrossThreadTestRunner.Run() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\crossthreadtestrunner.cs:line 26  
&nbsp_place_holder;&nbsp_place_holder; at NUnitHelpers.MultiThreadedTests.Test1() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\multithreadedtests.cs:line 14  
--CrossThreadTestRunnerException  
&nbsp_place_holder;&nbsp_place_holder; at NUnitHelpers.MultiThreadedTests.Worker() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\multithreadedtests.cs:line 19  
&nbsp_place_holder;&nbsp_place_holder; at NUnitHelpers.CrossThreadTestRunner.MultiThreadedWorker() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\crossthreadtestrunner.cs:line 42 

While this does work (in that it fails the test), it doesn't do what I wanted, which was to show the NUnit assertion failure. In other words, the message indicates an Exception was thrown instead of indicating that an Assertion failed. Sure, I could figure it out, but why should I have to? 

Jamie wrote: 

> It behaves quite differently though, because of the Join. How would you run multiple tests in parallel using this interface? What if you want to run your tests on a STA thread? 

Again, I reiterate that this was not my purpose. My purpose was to be able to run something on another thread from the main test and confirm that it behaves when run over there. I needed to confirm that it didn't mess up the state of the code running on this thread. If I had to run threads in parallel, I certainly would have ended up with a different approach. 

I want to give many thanks to Jamie for thinking hard and coming up with a number of interesting questions, but what I want to remind everyone is that as a TDD/Agile guy, I don't make "solve-all-the-world's-problems" frameworks unless that is actually the problem I'm trying to solve. I write exactly the code I need right here, right now and let the code tell me when it needs to evolve to be something else. At this point, for my problem, this code works. 
