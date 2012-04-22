---
layout: post
title: "Even More Debugging Windows Services"
comments: false
date: 2003-04-03 19:02:00
categories:
 - Technology
subtext-id: a082d035-58bd-42ee-a9d3-c4ac8374d3e4
alias: /blog/post/Even-More-Debugging-Windows-Services.aspx
---


Patrick Winfield writes:

> _1. If you do this: _
> 
> _#if DEBUG bool _running = false; #else bool _running = true; #endif _
> 
> _Then you can start your service. Attach to the process with the debugger. Then pause and then un-pause your service. This way the meat of your code doesn't start to run until your ready to step thru with your debugger. _
> 
> _2. You can attach the debugger to the NUnit GUI after it has loaded your service. So if your writing test first then you can place your breakpoints then push the run button. _

Good to hear from you. Patrick is very right on both counts. Unfortunately in the case that caused [my original post](http://www.peterprovost.org/2003/04/03.html#a180), I was working with older code that didn't have any unit tests and I just had to debug one little problem.

When I do test-driven development with services (with almost everything in fact), I try not to put any code at all into the outward facing assembly. So for a windows service I don't like to put the real code in the EXE's assembly. I prefer to put it in a separate DLL class library which I can easily test using the techniques discussed in [my paper](http://www.bespoketechnologies.com/Resources/Test-Driven%20Development%20in%20.NET.pdf).

Thanks Pat! 
