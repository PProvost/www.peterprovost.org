---
layout: post
title: "DEV302: Visual Studio 2005 Enterprise Tools - Building Robust and Reliable Systems"
comments: false
date: 2004-05-27 15:44:00
updated: 2004-05-27 18:13:00
subtext-id: 1fddde8d-f2c9-4147-aecf-afd735531bd1
alias: /blog/DEV302-Visual-Studio-2005-Enterprise-Tools---Building-Robust-and-Reliable-Systems.aspx
---


This session, which basically covered the "A day in the life of a developer" concept was a pretty good overview of how all this Visual Studio 2005 Team System (VS2K5TS) stuff will impact those of us who actually write code for a living.

**Unit Testing and Test-Driven Development**

Jim Newkirk gave a very quick 10 minute demo of TDD using VS2K5TS. The support in the new tool is pretty darn good. One of the cooler things how the refactoring tools support TDD. Recall that when you are doing Test-Driven Development you often write a test before the method you are testing has even been written. One of these refactoring tools now shows you a SmartTag that lets you quickly insert a stub method into the class being tested. Very nice.

However, I do have a few complaints about the unit testing stuff I have seen:

  * To use the refactoring above, the target class has to already exist, which in pure TDD isn't the case at the very beginning 
  * I really have to ask why they changed the name of the attributes from those defined in the xUnit frameworks. I'm guessing it is just a matter of wanting to be different, but I really think they should reconsider. [TestFixture] and [Test] and [ExpectedException] are consistent across NUnit and csUnit, so why should this tool be different? 
  * I'm not all that enamored with the test runner UI. I can't seem to figure out how to run it from the keyboard, and there is a popup dialog that insist on asking me to select a test configuration every time. Annoying. 
  * I'm not at all happy that the Unit Testing stuff will be included in Test System but not in the lower down versions of the VS product stack, Unit Testing is far too important to say that only the top tier product can have it.

**Code Coverage**

Eric Lee opened this demo by polling the audience and discovering that everyone had heard of code coverage analysis but that no one uses it. If you're ever heard me talk about testing and stuff, you probably know that I am not a big fan of code coverage analysis. My feeling is that it tends to be treated as panacea to project managers who love to be able to say things like "our unit tests covered 92% of our code, so we know that the code is ready."

Or even worse, I have a fear that a manager might institute a policy that states, "All code must have unit tests that cover 100% of the code." If this is used in place of good code reviews, I feel certain that we will start to see developers who learn to get 100% coverage in a lazy an ineffective way. Management will feel good, but the code will be bad.

Notice that I am not saying that code coverage analysis is by itself bad. But I an concerned that it will be misused. I certainly intend to use it _as a developer_ to keep an eye on my unit testing coverage, but I know to never depend on it as a measure of unit testing quality.

**Code Analysis**

Eric gave a detailed explanation of that static code analysis is and laid a foundation for his demo. I really think this stuff is going to be useful, but once again I reserve judgment until I get a chance to play with the bits myself.

It looks and sounds like a tightly integrated version of FxCop. Like FxCop, it allows you to create custom rules, ships with a massive base set of rules, etc. Looks pretty good.

**Application Verifier**

Find problems as your application runs. The team specifically set out to address the problems of

  * "Works on my machine"

  * "It used to work"

  * Runtime issues

Some of the many things that it checks for include

  * Application compatibility issues

  * Defects

  * Security checks

  * Logo compliance

Also good stuff.

**Code Profiler**

The first part of this Eric showed was **Sampling**. This takes samples of the methods that are called in our application. It tallies up the totals and gives you a quick look at the method call counts. It gives you an easy way to quickly identify possible problem areas.

The second half of the code profiling system is **Instrumentation**. Eric suggested that we should move to this more intrusive way of profiling after using Sampling to get an idea of where we should look. It injects code into the running code to enable to collection of detailed timing probe data. This lets you determine, for example, that a specific line of code in a method is the main source of delay. (Eric confirmed that this is basically an integrated&nbsp_place_holder;combination of the existing add-on profiling tools that are on MSDN today.)

Eric also showed the reports and summary information that are created. I know this stuff is going to be very useful to all of us.

**Conclusions**

One thing I was to say though is that this is an early preview. I have been talking **a lot** with this team and they are very interested in what people think of all this stuff. So expect it to change between now and when it actually ships. And we all need to be sure to tell them a little about each of our religions so they don't leave anything out.
