---
layout: post
title: "More Tricks w/ C# Generics"
comments: false
date: 2003-08-12 13:57:00
categories:
 - Technology
subtext-id: 7512f722-55d3-4c28-988b-47a4f1d97243
alias: /blog/post/More-Tricks-w-C-Generics.aspx
---


[Christian Nagel shows us](http://weblogs.asp.net/cnagel/posts/23721.aspx) another neat trick we can expect out of C# generics:

> The declaration
> 
> public delegate void EventHander<S, T>(S sender, T args) where T : EventArgs;
> 
> also shows a big difference to the template implementation of C++. With C# generics it is possible to define requirements of generic types, such as T needs&nbsp_place_holder;to be of type of&nbsp_place_holder;EventArgs (or derived from this class).&nbsp_place_holder;With C++ templates we just find out that a type doesn't fulfill the requirements when compiling the template using the specific type. Often the compiler error messages with many, many lines are not easy to read.

Very nice. I was an STL junkie I remember all the nasty errors produced by the compiler when you did something wrong. I really like the way that reads too.
