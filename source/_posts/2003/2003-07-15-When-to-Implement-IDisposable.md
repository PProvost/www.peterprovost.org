---
layout: post
title: "When to Implement IDisposable"
comments: false
date: 2003-07-15 21:24:00
categories:
 - Technology
subtext-id: e046dd9f-dd88-4b43-b7a7-62caadde9546
alias: 
- /blog/post/When-to-Implement-IDisposable.aspx
- /archive/2003/07/15/617.aspx
---


One of the joys of programming in a GC environment is that you don't really have to worry about cleaning up. In C, we have to remember to call free() after calling malloc(). In C++ we had to remember to call delete after new. In COM you had to remember to Release() your objects. Even worse, you had to manage AddRef() calls when you passed them around. VB inherited this problem. (You had to use Set when assigning to get the underlying AddRef and then you had to remember to say Set myObj = Nothing to call Release.

In .NET we are free from all this, right? Well, not really. The problem lies with the IDisposable interface. I've [written before](http://www.peterprovost.org/2003/06/11.html#a409) about my dislike for IDisposable. I understand why it exists, but I just don't like it. I don't like it because you have to remember to call Dispose on any object that you use that implements it. This means that I have to just _know_ that an object needs to be disposed.

The other problem with IDisposable is knowing when to implement it. In [this post by Eric Gunnerson](http://blogs.gotdotnet.com/EricGu/permalink.aspx/98e1668e-fa17-4f0f-9960-7e3910b027e5) (VC# PM at MS), we get some insight as to when you should and shouldn't implement it. Eric discusses three scenarios of interest. When you have a class what wraps an unmanaged resource, Eric tells us that you should implement both a finalizer and IDisposable. This is the obvious one and the one that gets good converage in the docs.

A more interesting case is when your class has a field that implements IDisposable. For this one Eric tells us that you don't need to write a finalizer, but you may want to implement IDisposable so you can let the users of your class decide when your fields are disposed.

Eric's final scenario is a class where no fields implement IDisposable. In this case he tells us to do nothing. I agree.

This is all very useful information and everyone needs to file it away, but do you now see why I get so annoyed by this? Sure it isn't as bad as it was in COM, but it is still not perfect. I'd sure love to see some improvement here. I don't know how to do it. There are plenty of smart guys in MS Research who should be able to figure it out.
