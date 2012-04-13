---
layout: post
title: "NUnit and Multithreaded Tests - CrossThreadTestRunner"
comments: false
date: 2004-11-03 15:46:00
updated: 2008-07-06 14:18:06
categories:
 - Agile Software Development
 - Technology
tags:
 - tdd
 - agile development
subtext-id: 0c0dc413-0ca8-4769-8f70-0940fcf83473
alias: /blog/NUnit-and-Multithreaded-Tests---CrossThreadTestRunner.aspx
---


[NUnit](http://www.nunit.org/) 2.1 doesn't deal well with multi-threaded code. By that I mean that if you have a test that spawns another thread and then that thread needs to Assert something, it won't work. If you are using NUnit-GUI or NUnit-Console, you will see the exception's message in the output window, but interestingly enough, your test will _PASS_! Unfortunately, [TestDriven.NET](http://www.testdriven.net/) (nee NUnitAddin) doesn't give you any output at all regarding the exception. The test just passes. 

(I've read that NUnit 2.2 has fixed this problem, but since we are using NUnit 2.1 on our project I ran into it headlong. Also, the 2.2 implementation apparently doesn't work when the exception isn't serializable.) 

I did a little bit of digging and&nbsp_place_holder;came up with an approach that works. Catch the exception on the other thread and pass it back to the main thread through a local member variable. I had it done and working as&nbsp_place_holder;couple of helper methods in my&nbsp_place_holder;test fixture, but I wasn't really happy with it. It seemed to me that I should be able to make it a little bit more reusable. 

So I grabbed [Brian Button](http://dotnetjunkies.com/weblog/oneagilecoder) this morning and we started refactoring. (Have I mentioned how much I love [Resharper](http://www.jetbrains.com/resharper/)?) A little extract method here, a little extract class there... a rename or two... and _viola_, I had the following class. 

Once little caveat: The code on lines 32-34 require you to have Reflection permissions (hence the demand attribute). While this isn't absolutely essential, it is nice because it means you will get a good stck trace in your failing test. If you don't like that, get rid of it. Oh and that "remoteStackTraceString" stuff works in ,NET 1.1... I can't make any promises about any other runtimes. YMMV. 

My next post will have a sample that shows how to use it. 

Enjoy! 

.csharpcode{ font-size: 10pt; color: black; font-family: Courier New , Courier, Monospace; background-color: #ffffff; /*white-space: pre;*/}.csharpcode pre { margin: 0px; }.rem { color: #008000; }.kwrd { color: #0000ff; }.str { color: #006080; }.op { color: #0000c0; }.preproc { color: #cc6633; }.asp { background-color: #ffff00; }.html { color: #800000; }.attr { color: #ff0000; }.alt { background-color: #f4f4f4; width: 100%; margin: 0px;}.lnum { color: #606060; } 
    
    
         1: using System;
    
    
    
         2: using System.Reflection;
    
    
    
         3: using System.Security.Permissions;
    
    
    
         4: using System.Threading;
    
    
    
         5: &nbsp_place_holder;
    
    
    
         6: namespace NUnitHelpers
    
    
    
         7: {
    
    
    
         8:     public class CrossThreadTestRunner
    
    
    
         9:     {
    
    
    
        10:         private ThreadStart userDelegate;
    
    
    
        11:         private Exception lastException;
    
    
    
        12: &nbsp_place_holder;
    
    
    
        13:         public CrossThreadTestRunner(ThreadStart userDelegate)
    
    
    
        14:         {
    
    
    
        15:             this.userDelegate = userDelegate;
    
    
    
        16:         }
    
    
    
        17: &nbsp_place_holder;
    
    
    
        18:         public void Run()
    
    
    
        19:         {
    
    
    
        20:             Thread t = new Thread(new ThreadStart(this.MultiThreadedWorker));
    
    
    
        21: &nbsp_place_holder;
    
    
    
        22:             t.Start();
    
    
    
        23:             t.Join();
    
    
    
        24: &nbsp_place_holder;
    
    
    
        25:             if (lastException != null)
    
    
    
        26:                 ThrowExceptionPreservingStack(lastException);
    
    
    
        27:         }
    
    
    
        28: &nbsp_place_holder;
    
    
    
        29:         [ReflectionPermission(SecurityAction.Demand)]
    
    
    
        30:         private void ThrowExceptionPreservingStack(Exception exception)
    
    
    
        31:         {
    
    
    
        32:             FieldInfo remoteStackTraceString = typeof (Exception).GetField("_remoteStackTraceString", 
    
    
    
        33:                 BindingFlags.Instance | BindingFlags.NonPublic);
    
    
    
        34:             remoteStackTraceString.SetValue(exception, exception.StackTrace + Environment.NewLine);
    
    
    
        35:             throw exception;
    
    
    
        36:         }
    
    
    
        37: &nbsp_place_holder;
    
    
    
        38:         private void MultiThreadedWorker()
    
    
    
        39:         {
    
    
    
        40:             try
    
    
    
        41:             {
    
    
    
        42:                 userDelegate.Invoke();
    
    
    
        43:             }
    
    
    
        44:             catch (Exception e)
    
    
    
        45:             {
    
    
    
        46:                 lastException = e;
    
    
    
        47:             }
    
    
    
        48:         }
    
    
    
        49:     }
    
    
    
        50: }
    
