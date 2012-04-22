---
layout: post
title: "RAII and IDisposable and Thoughts About OO"
comments: false
date: 2004-12-05 10:46:00
categories:
 - Technology
subtext-id: 1f96a67f-1ddc-4360-ad18-d695105f3788
alias: /blog/post/RAII-and-IDisposable-and-Thoughts-About-OO.aspx
---


The other day, while [pair-programming](http://dotnetjunkies.com/WebLog/oneagilecoder/archive/2004/12/03/34886.aspx) on some nasty P/Invoke code with [Brian Button](http://dotnetjunkies.com/WebLog/oneagilecoder/) I mentioned to him that I saw an extract class refactoring in my code after writing something like this:

IntPtr handle;  
try  
{  
&nbsp_place_holder; &nbsp_place_holder; handle = SomeNastyWin32PInvokeCall();  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; // Do something with the handle  
}  
finally  
{  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; //&nbsp_place_holder;Release the handle  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; SomeOtherNastyPInvokeCall(handle)  
}

Brian, being the C++ guru that he is, said, "Of course. That is the RAII pattern from C++."

Duh! I knew that. RAII, which stands for Resource Acquisition&nbsp_place_holder;Is Initialization,&nbsp_place_holder;is a pattern that says:

> This C++ idiom relies on the life-cycle of objects: constructors called to initialize the object, and a destructor called when it goes away. Objects are usually created either automatically in a local scope, in which case they are destroyed when the scope is exited (via normal flow, return, or exception), or they can be created with "new" in which case they are destroyed by an explicit "delete". 
> 
> If the resource in question (a file, lock, window, etc.) is acquired (opened, locked, created) in a constructor, and released (closed, unlocked, disposed) in the destructor, then the use of the resource is tied to the lifetime of the object. Since object lifetimes are well-defined, so is the use of the resource
> 
> (Source: [http://c2.com/cgi/wiki?ResourceAcquisitionIsInitialization](http://c2.com/cgi/wiki?ResourceAcquisitionIsInitialization))

But of course, that is written in terms of a language that has deterministic finalization (C++). Since .NET does not, the only way to apply it is to use the [IDisposable pattern](http://msdn.com/library/en-us/cpgenref/html/cpconFinalizeDispose.asp).

This got me thinking. I am one of those people who prefers short single-minded classes with short single-minded methods. The ultimate, yet unachievable goal is to have one line methods. I saw [Jay Bazuzi](http://blogs.msdn.com/jaybaz_ms) post on the [Refactoring List](http://groups.yahoo.com/group/refactoring) last month:

> I absolutely agree that when you have to scroll, it makes things harder to understand.
> 
> Most people would agree with the statement "I like to keep my methods small".
> 
> What people disagree on is what "small" means.
> 
> I strive to make my methods one line long. If they need to be any longer, I need a strong justification.
> 
> I also strive to write object oriented software. For me that means that interactions of objects should be important, not interactions of methods.
> 
> Because understanding classes is key to OO, I try to keep all my classes small enough to be visible without scrolling.
> 
> (Source: [http://groups.yahoo.com/group/refactoring/message/6319](http://groups.yahoo.com/group/refactoring/message/6319))

So this "Introduce RAII Class" refactoring is a tool that we can use to create shorter, clearer code. In particular, in C# we get the using() statement which makes it really simple to see and understand what is going on. So if I applied the "Introduce RAII Class" refactoring to the code I wrote above, I might have this:

using( NastyPInvokeCodeHandler handler = new NastyPInvokeCodeHandler() )  
{  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; // Do something with handler  
}

Ah yes. That is much better. The interesting thing to me is how often I've had people give me grief about this. "The docs," they say, "tell you to use IDisposable for expensive resource allocation. Not for that." But honestly, I would say that the docs are flawed. The point of IDisposable is getting a semblance of deterministic finalization. The point of the C# using statement is to have a nice try finally block around IDisposable code. Take those two things together and we have RAII.

As I said to Brian, "You know what I really want is an automatic refactoring for Resharper that lets me select a try finally block and it will generate an IDisposable class for me."&nbsp_place_holder; As [Homer J. Simpson](http://www.snpp.com/guides/castlist.html#household) might say, "Mmmmm refactoring."

I think I'll post some real world examples of using this idea with P/Invoke in a few days.
