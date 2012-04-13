---
layout: post
title: "ASP.NET Templates"
comments: false
date: 2003-02-22 22:10:00
updated: 2004-05-03 21:33:00
categories:
 - Technology
subtext-id: 0de9bf00-01e4-4f2f-8efd-8d720f189040
alias: /blog/ASPNET-Templates.aspx
---


I just ran across a couple of threads on a few different blogs and online lists where people were asking about the best way to create page templates in ASP.NET.

Well, a few months back I wrote an [article for codeproject.com](http://www.codeproject.com/aspnet/page_templates.asp)&nbsp_place_holder;discussing a technique I was using at the time. It was pretty simple in that it (like the stuff at [wilsondotnet.com](http://wilsondotnet.com/)) had most of the template in code. This neccessitated a recompile when you wanted to change the template.

Needless to say, this technique wasn't used for long. I suppose it is time to write an article about how I am doing it these days. Basically I have completely stripped out the template into an external .XHTML file that contains special tags to define places where content should be filled in. You can have as many as you want and you populate them from a simple override method.

I'll post something here as soon as the article is ready.

PS. My article about test-driven development in .NET is almost done. You can read the draft [here](http://www.peterprovost.org/wiki/ow.asp?Unit%5FTesting%5FWith%5FNUnit).
