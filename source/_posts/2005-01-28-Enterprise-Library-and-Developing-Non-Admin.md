---
layout: post
title: "Enterprise Library and Developing Non-Admin"
comments: false
date: 2005-01-28 21:38:00
categories:
 - Technology
subtext-id: 839a3c9f-0eca-4fef-bd3a-6b631021385f
alias: /blog/post/Enterprise-Library-and-Developing-Non-Admin.aspx
---


I just noticed that my friend Robert Hurlbut posted [the following comments](http://weblogs.asp.net/rhurlbut/archive/2005/01/28/362945.aspx) about running non-admin and using Enterprise Library:

> Security Note: If you are running and developing as a non-administrator (as you should be), you should install this to another folder other than the default location under Program Files. Otherwise, when you try to fire up any of the projects with your non-administrator account, you will get an error saying files couldn't be written to that location (C:\Program Files\ is a restricted area for regular users). My solution was to use MakeMeAdmin and put the files under its own separate location. This gave me owner right to the folder as well as making sure I am not writing to a protected area.

Robert is absolutely right. If you intend to build the solution where it is installed, and if you are a non-admin developers, then you need to deal with the fact the Program Files is not a place that you will be allowed to compile. My recommendation is right in line with Robert: install it to another location (I use C:\Development) and set more appropriate permissions on that folder.

But one thing that Robert didn't catch yet is that you will find that a few of the unit tests will fail if you are running non-admin. There really isn't anything we could do about this, since we have tests that do things like creating event sources and other restricted activities. So if you decide you want to run all your unit tests, then make sure you are running as an admin when you run NUnit. (If, like me, you use TestDriven.NET, then you need to launch VS as an admin. As Robert points out, [MakeMeAdmin](http://blogs.msdn.com/aaron_margosis/archive/2004/07/24/193721.aspx) is great for this.)

Personally, I wish we had isolated those unit tests into either their own assemblies or wrapped them in #if ADMIN..#endif blocks. But we didn't think of it, and so it didn't happen.
