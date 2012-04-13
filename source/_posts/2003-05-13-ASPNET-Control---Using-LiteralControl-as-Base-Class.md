---
layout: post
title: "ASP.NET Control - Using LiteralControl as Base Class"
comments: false
date: 2003-05-13 12:08:00
categories:
 - Technology
subtext-id: 1f1f434f-342f-4f36-ba99-b2858bdfff4f
alias: /blog/ASPNET-Control---Using-LiteralControl-as-Base-Class.aspx
---


I was just playing around with [Lutz Roeder's Reflector](http://www.aisto.com/roeder/dotnet/)&nbsp_place_holder;and decided to take quick look at the code in Microsoft CRM. I was just having a quick look around, mind you, not "reengineering the product". Anyway, I noticed an interesting trend...

It appears that all of their ASP.NET "custom controls" derive from LiteralControl instead of from one of the other Control classes. I've done it that way myself, but I wondering if anyone has written anything about which way is "better".

BTW, if you haven't heard of [Reflector](http://www.aisto.com/roeder/dotnet/), go get it NOW!
