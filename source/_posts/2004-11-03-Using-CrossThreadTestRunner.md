---
layout: post
title: "Using CrossThreadTestRunner"
comments: false
date: 2004-11-03 16:29:00
updated: 2008-07-06 14:13:40
categories:
 - Technology
tags:
 - tdd
subtext-id: 985eb6f0-fc0f-42b9-a9b6-18d89ab1b547
alias: /blog/Using-CrossThreadTestRunner.aspx
---


So I showed you my little [CrossThreadTestRunner class](/archive/2004/11/03/2051.aspx), but I didn't show you how to use it. 

Suppose you wanted to run a test in another thread. You would probably write something like this: 

.csharpcode{ font-size: 10pt; color: black; font-family: Courier New , Courier, Monospace; background-color: #ffffff; /*white-space: pre;*/}.csharpcode pre { margin: 0px; }.rem { color: #008000; }.kwrd { color: #0000ff; }.str { color: #006080; }.op { color: #0000c0; }.preproc { color: #cc6633; }.asp { background-color: #ffff00; }.html { color: #800000; }.attr { color: #ff0000; }.alt { background-color: #f4f4f4; width: 100%; margin: 0px;}.lnum { color: #606060; } 
    
    
         1: using System.Threading;
    
    
    
         2: using NUnit.Framework;
    
    
    
         3: &nbsp_place_holder;
    
    
    
         4: namespace NUnitHelpers
    
    
    
         5: {
    
    
    
         6:     [TestFixture]
    
    
    
         7:     public class MultiThreadedTests
    
    
    
         8:     {
    
    
    
         9:         [Test]
    
    
    
        10:         public void Test1()
    
    
    
        11:         {
    
    
    
        12:             ThreadStart ts = new ThreadStart(this.Worker);
    
    
    
        13:             Thread t = new Thread(ts);
    
    
    
        14:             t.Start();
    
    
    
        15:         }
    
    
    
        16: &nbsp_place_holder;
    
    
    
        17:         private void Worker()
    
    
    
        18:         {
    
    
    
        19:             Assert.Fail("This should fail the test, right?");
    
    
    
        20:         }
    
    
    
        21:     }
    
    
    
        22: }
    

Now, as I said before, if you run this test in NUnit-Console, you will get this output: 

> NUnit version 2.1.4  
Copyright (C) 2002-2003 James W. Newkirk, Michael C. Two, Alexei A. Vorontsov, Charlie Poole.  
Copyright (C) 2000-2003 Philip Craig.  
All Rights Reserved. 
> 
> . 
> 
> Unhandled Exception: NUnit.Framework.AssertionException: This should fail the test, right?  
Tests run: 1, Failures: 0, Not run: 0, Time: 0.0200788 seconds 

As you can see, the exception does show up in the output, but you don't actually get a failing test. If your project had hundreds or thousands of tests in it (not an uncommon occurance), that little bit of text output could easily be missed. 

So, here is how you use CrossThreadTestRunner: 

.csharpcode{ font-size: 10pt; color: black; font-family: Courier New , Courier, Monospace; background-color: #ffffff; /*white-space: pre;*/}.csharpcode pre { margin: 0px; }.rem { color: #008000; }.kwrd { color: #0000ff; }.str { color: #006080; }.op { color: #0000c0; }.preproc { color: #cc6633; }.asp { background-color: #ffff00; }.html { color: #800000; }.attr { color: #ff0000; }.alt { background-color: #f4f4f4; width: 100%; margin: 0px;}.lnum { color: #606060; } 
    
    
         1: using System.Threading;
    
    
    
         2: using NUnit.Framework;
    
    
    
         3: &nbsp_place_holder;
    
    
    
         4: namespace NUnitHelpers
    
    
    
         5: {
    
    
    
         6:     [TestFixture]
    
    
    
         7:     public class MultiThreadedTests
    
    
    
         8:     {
    
    
    
         9:         [Test]
    
    
    
        10:         public void Test1()
    
    
    
        11:         {
    
    
    
        12:             ThreadStart ts = new ThreadStart(this.Worker);
    
    
    
        13:             CrossThreadTestRunner runner = new CrossThreadTestRunner(ts);
    
    
    
        14:             runner.Run();
    
    
    
        15:         }
    
    
    
        16: &nbsp_place_holder;
    
    
    
        17:         private void Worker()
    
    
    
        18:         {
    
    
    
        19:             Assert.Fail("This should fail the test, right?");
    
    
    
        20:         }
    
    
    
        21:     }
    
    
    
        22: }
    

And here is the new output from NUnit-Console: 

> NUnit version 2.1.4  
Copyright (C) 2002-2003 James W. Newkirk, Michael C. Two, Alexei A. Vorontsov, Charlie Poole.  
Copyright (C) 2000-2003 Philip Craig.  
All Rights Reserved. 
> 
> .F  
Tests run: 1, Failures: 1, Not run: 0, Time: 0.0401576 seconds 
> 
> Failures:  
1) NUnitHelpers.MultiThreadedTests.Test1 : This should fail the test, right?  
&nbsp_place_holder;&nbsp_place_holder; at NUnitHelpers.MultiThreadedTests.Worker() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\multithreadedtests.cs:line 19  
&nbsp_place_holder;&nbsp_place_holder; at NUnitHelpers.CrossThreadTestRunner.MultiThreadedWorker() in c:\documents a  
nd settings\peterpr\my documents\visual studio projects\nunithelpers\crossthread  
testrunner.cs:line 41  
&nbsp_place_holder;&nbsp_place_holder; at NUnitHelpers.CrossThreadTestRunner.ThrowExceptionPreservingStack(Exception&nbsp_place_holder;exception) in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\crossthreadtestrunner.cs:line 34  
&nbsp_place_holder;&nbsp_place_holder; at NUnitHelpers.CrossThreadTestRunner.Run() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\crossthreadtestrunner.cs:line 26  
&nbsp_place_holder;&nbsp_place_holder; at NUnitHelpers.MultiThreadedTests.Test1() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\multithreadedtests.cs:line 14 

Now we have a failing test like we wanted. 

Hopefully this will help out some other poor soul who needs to deal with multithreaded testing. Many thanks to [Brian](http://dotnetjunkies.com/weblog/oneagilecoder) and [Scott](http://weblogs.asp.net/scottdensmore) for helping me work this out. 
