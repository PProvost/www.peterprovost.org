---
layout: post
title: "VS.NET Design Mode"
comments: false
date: 2003-10-01 19:08:00
updated: 2004-05-01 17:24:00
categories:
 - Technology
subtext-id: 5149b9f6-7ad7-44dd-a896-23e9456755e1
alias: /blog/VSNET-Design-Mode.aspx
---


A while back, I wrote [an article for CodeProject](http://www.codeproject.com/aspnet/page_templates.asp?df=100&forumid=7329&select=626466&msg=626466) about creating a base class page for ASP.NET projects. One of the things that many people run into with this approach is getting it to work in design mode.

It looks like Scott Hanselman [ran into the same thing and figured out why](http://www.hanselman.com/blog/PermaLink.aspx?guid=9ff4c3b2-70ec-4b0f-95ed-5bd83b6c9a55). I'm not 100% sure his solution will work for all cases, but it is worth a try.
