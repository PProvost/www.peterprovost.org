---
layout: post
title: "More on ScottGu's Posts"
comments: false
date: 2003-05-16 10:44:00
categories:
 - Technology
subtext-id: 62d73f37-e925-4666-b8eb-55fc9027aa49
alias: /blog/More-on-ScottGus-Posts.aspx
---


[Everyone seems blown away](http://www.stronglytyped.com/#200299065) by Scott's javascript focus trick, but no one seems to have noticed his comments on VB vs C# (in the Performance Talk slides). I've seen reviews where C# is shown to blow VB away, but after reading Scott's deck, it seems that this was likely due to badly written VB. VB still allows you do make untyped declarations like this:
    
    Dim counter  
    For counter = 0 to 7  
    &nbsp_place_holder; Response.Write counter  
    Next counter

This code will always perform worse than this:
    
    Dim counter as Integer  
    For counter = 0 to 7  
    &nbsp_place_holder; Response.Write counter  
    Next counter

Attention VB coders! Make sure you use the strict page declaration in your ASPX pages. This will keep you from writing code like that shown above.
    
    <%@ Page Language=?VB? Strict=?true? %>

Enjoy!
