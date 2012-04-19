---
layout: post
title: "New SharpReader and a Useful Debugging Trick"
comments: false
date: 2003-06-25 21:40:00
categories:
 - Technology
subtext-id: c16d1b25-c997-4ec5-8e12-3cb385ad12ea
alias: /blog/post/New-SharpReader-and-a-Useful-Debugging-Trick.aspx
---


Luke Hutteman has released [SharpReader 0.9.1.3](http://www.hutteman.com/weblog/2003/06/25-103.html). While fixing a bug related to running SharpReader on Win98 and ME, Luke [re-discovered a useful trick](http://www.hutteman.com/weblog/2003/06/25-102.html) for solving early launch crashes.

Here is the problem. Suppose you have a static member initializer, &nbsp_place_holder;like Luke did, and that this initialization is throwing an exception (like Luke's did). How can you even find this? Well... you do like Luke did. You create your own little application loader to load your application. Then you can trap exceptions and even trace into your code. Here is Luke's nice simple app loader:
    
    static void Main(string[] args)  
    {   
    &nbsp_place_holder;try   
    &nbsp_place_holder;{   
    &nbsp_place_holder;&nbsp_place_holder;string appName = args[0];   
    &nbsp_place_holder;&nbsp_place_holder;Assembly assembly = Assembly.LoadFrom(appName);&nbsp_place_holder;   
    &nbsp_place_holder;&nbsp_place_holder;assembly.EntryPoint.Invoke(null, null);&nbsp_place_holder;   
    &nbsp_place_holder;}  
    &nbsp_place_holder;catch (Exception e)   
    &nbsp_place_holder;{   
    &nbsp_place_holder;&nbsp_place_holder;Console.WriteLine(e);   
    &nbsp_place_holder;}  
    }  
    

This will help you find those crazy little startup errors. Of course, avoiding static initializers that aren't exception-safe is also a good idea.

Thanks Luke!
