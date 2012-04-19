---
layout: post
title: "No More ASP.NET WebForms?"
comments: false
date: 2003-02-23 17:54:00
updated: 2004-05-03 21:36:00
categories:
 - Technology
subtext-id: c18a5820-63ae-402f-af47-e8e40c62c9cd
alias: /blog/post/No-More-ASPNET-WebForms.aspx
---


Well, they aren't gone from .NET, but they may be gone from my life. I've been leaning that way for quite a while now anyway. Ever since I started using [Page Templates](http://www.codeproject.com/aspnet/page_templates.asp), I haven't been using the Form Designer. I've stopped creating server controls, and tend to just deal with the HTML content like I would if I didn't have all that Web Forms stuff. I have a homegrown MVC-like framework that is working fairly well for me, although it still uses .ASPX pages.

Well, last night I discovered [Maverick.NET](http://mavnet.sourceforge.net/) and tonight I'm going to implement a [solution spike](http://c2.com/cgi/wiki?SpikeSolution) to test it out. Maverick is a complete MVC implementation for web applications. You can use .ASPX pages for your views if you want, but it also has built in support for XML/XSLT views. Sounds pretty good to me. By combining it with [NVelocity](http://nvelocity.sourceforge.net/), you can even use Apache Velocity&nbsp_place_holder;template views. 

If my spike goes well, I might leave WebForms behind completely. Maybe when ASP.NET 2.0 comes out I'll go back. I'll post back when I've decided how I feel. Hopefully I will be happier than I was with [Deklarit](http://www.deklarit.com). We'll see.
