---
layout: post
title: "Unit Testing with MSTest, xUnit and NUnit in the VS11 Developer Preview"
comments: true
date: 2012-02-21 14:22:10
categories:
 - Technology
 - Agile Software Development
tags:
 - agile development
 - tdd
 - unit testing
 - vs11
subtext-id: f7a6427c-e93b-4360-9e06-76e3dccd2a9d
alias: /blog/post/Unit-Testing-with-MSTest-xUnit-and-NUnit-in-the-VS11-Developer-Preview.aspx
---

Back in September, at the [//build/windows conference](http://www.buildwindows.com/), we were very excited to get to show off our new unit testing experience for Visual Studio 11.

One of the things we heard over and over since we first shipped unit testing in VSTS was that customers wanted a) to be able to run whatever unit testing framework they want and b) it has to be fast an non-intrusive. Thus was born our new experience.

<!-- more -->

During //build/, Brad Wilson shipped a prototype [xUnit.net](http://xunit.codeplex.com/) plugin for the VS11 Developer Preview, and today Charlie Poole shipped an [NUnit](http://nunit.org/) plugin (also for the Developer Preview). This is very exciting! Now you can use VS Unit Testing (aka MS-Test), xUnit.net and NUnit all within Visual Studio and get the same integrated experience. We even added a new C++ unit test framework.

Links:

* xUnit.net - [http://xunit.codeplex.com/releases/view/77573](http://xunit.codeplex.com/releases/view/77573) (look for "Prototype runner for VS11 Developer Preview") 
* NUnit - [http://nunit.org/index.php?p=vsTestAdapter&r=2.6](http://nunit.org/index.php?p=vsTestAdapter&r=2.6)

So if you're running the VS11 Developer Preview, give them a try! We are working with a whole bunch of different groups inside and outside of Microsoft to give you the freedom to choose the framework you want.

Continue to watch the blogs and whatnot for more plugins as they become available. 
