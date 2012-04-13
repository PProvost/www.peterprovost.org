---
layout: post
title: "ASP.NET Without Web Projects"
comments: false
date: 2003-09-22 13:14:00
updated: 2004-05-02 00:40:00
categories:
 - Technology
subtext-id: a1eb7a09-aaf4-4913-8fea-83e5977b1242
alias: /blog/ASPNET-Without-Web-Projects.aspx
---


I've written about this before, but it seems to have gotten a lot of attention on WinTechOffTopic last week. I prefer to NOT use ASP.NET Web Projects. I prefer to use Class Library projects instead.

Not always, of course, but on larger projects with many developers and a centralized build system? Absolutely. My big thing is that I hate that the Web Project always goes under wwwroot and that it requires IIS to build. Very annoying since it really is just a class library.

Apparently, I'm not the only one who feels this way. [Brad Wilson](http://dotnetguy.techieswithcats.com/), [Fritz Onion](http://staff.develop.com/onion/), [Craig Andera](http://staff.develop.com/candera/weblog2/) and many others chimed in with a similar preference.

In fact, Fritz has written [a little reference](http://staff.develop.com/onion/Samples/aspdotnet_without_web_projects.htm) on the steps you need to take to enable .ASPX pages in a Class Library project. Thanks Fritz.
