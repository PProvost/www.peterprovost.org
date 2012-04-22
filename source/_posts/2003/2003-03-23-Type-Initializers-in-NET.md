---
layout: post
title: "Type Initializers in .NET"
comments: false
date: 2003-03-23 19:30:00
categories:
 - Technology
subtext-id: 8e9e35a2-17a9-4ab7-900a-d7ea2c6e7c91
alias: /blog/post/Type-Initializers-in-NET.aspx
---


I'm reading [Essential .NET Volume 1](http://www.amazon.com/exec/obidos/ASIN/0201734117/peterprovosto-20), [Don Box](http://www.gotdotnet.com/team/dbox/default.aspx)'s new book, and I just learned&nbsp_place_holder;about Type Initializers. Very cool. I actually ran into a situation where I needed this, but didn't know it existed.

The basic idea is that you can define a "constructor" for the static class. Essentially it is a method that gets called before any static members are accessed. What I needed it for was to create a static member who's value was calculated using a complicated (read: not-one-line) expression.

That is exactly what Type Initializers are for. Think of it as a static constructor and it'll all make sense (assuming you are a C++ guy like me). I don't know why I didn't try it... but I didn't.

Here is an example:
    
    public MyClass  
    {  
    &nbsp_place_holder; public static int&nbsp_place_holder;MyValue1 = 1;  
    &nbsp_place_holder; public static int MyValue2;  
      
    &nbsp_place_holder; static MyClass()  
    &nbsp_place_holder; {  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; MyValue2 = SomeComplicatedMethod();  
    &nbsp_place_holder; }  
    }

The most interesting thing to note is the order in which things happen. In this example, I have a static member (MyValue1) that is intialized with a value and another that gets set in the static constructor. Which one happens first? The answer (thanks again Don) is that MyValue1 will get set before the static constructor is called. Good to know.
