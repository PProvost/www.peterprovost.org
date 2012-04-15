---
layout: post
title: "Using CrossThreadTestRunner"
comments: false
date: 2004-11-03 16:29:00
updated: 2008-07-06 14:13:40
categories:
 - Code
tags:
 - tdd
subtext-id: 985eb6f0-fc0f-42b9-a9b6-18d89ab1b547
alias: /blog/Using-CrossThreadTestRunner.aspx
---


So I showed you my little [CrossThreadTestRunner class](/archive/2004/11/03/2051.aspx), but I didn't show you how to use it. 

Suppose you wanted to run a test in another thread. You would probably write something like this: 

``` csharp
using System.Threading;
using NUnit.Framework;
namespace NUnitHelpers
{
   [TestFixture]
   public class MultiThreadedTests
   {
      [Test]
      public void Test1()
      {
         ThreadStart ts = new ThreadStart(this.Worker);
         Thread t = new Thread(ts);
         t.Start();
      }

      private void Worker()
      {
         Assert.Fail("This should fail the test, right?");
      }
   }
}
```
   
Now, as I said before, if you run this test in NUnit-Console, you will get this output: 

   NUnit version 2.1.4  
   Copyright (C) 2002-2003 James W. Newkirk, Michael C. Two, Alexei A. Vorontsov, Charlie Poole.  
   Copyright (C) 2000-2003 Philip Craig.  
   All Rights Reserved. 

   Unhandled Exception: NUnit.Framework.AssertionException: This should fail the test, right?  
   Tests run: 1, Failures: 0, Not run: 0, Time: 0.0200788 seconds 

As you can see, the exception does show up in the output, but you don't actually get a failing test. If your project had hundreds or thousands of tests in it (not an uncommon occurance), that little bit of text output could easily be missed. 

So, here is how you use CrossThreadTestRunner: 

``` csharp
using System.Threading;
using NUnit.Framework;

namespace NUnitHelpers
{
	[TestFixture]
	public class MultiThreadedTests
	{
		[Test]
		public void Test1()
		{
			ThreadStart ts = new ThreadStart(this.Worker);
			CrossThreadTestRunner runner = new CrossThreadTestRunner(ts);
			runner.Run();
		}

		private void Worker()
		{
			Assert.Fail("This should fail the test, right?");
		}
	}
}
```
   
And here is the new output from NUnit-Console: 

   NUnit version 2.1.4  
   Copyright (C) 2002-2003 James W. Newkirk, Michael C. Two, Alexei A. Vorontsov, Charlie Poole.  
   Copyright (C) 2000-2003 Philip Craig.  
   All Rights Reserved. 
    
    .F  
   Tests run: 1, Failures: 1, Not run: 0, Time: 0.0401576 seconds 
    
    Failures:  
   1) NUnitHelpers.MultiThreadedTests.Test1 : This should fail the test, right?  
    at NUnitHelpers.MultiThreadedTests.Worker() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\multithreadedtests.cs:line 19  
    at NUnitHelpers.CrossThreadTestRunner.MultiThreadedWorker() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\crossthread  
   testrunner.cs:line 41  
    at NUnitHelpers.CrossThreadTestRunner.ThrowExceptionPreservingStack(Exceptionexception) in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\crossthreadtestrunner.cs:line 34  
    at NUnitHelpers.CrossThreadTestRunner.Run() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\crossthreadtestrunner.cs:line 26  
    at NUnitHelpers.MultiThreadedTests.Test1() in c:\documents and settings\peterpr\my documents\visual studio projects\nunithelpers\multithreadedtests.cs:line 14 
   
Now we have a failing test like we wanted. 

Hopefully this will help out some other poor soul who needs to deal with multithreaded testing. Many thanks to [Brian](http://dotnetjunkies.com/weblog/oneagilecoder) and [Scott](http://weblogs.asp.net/scottdensmore) for helping me work this out. 
