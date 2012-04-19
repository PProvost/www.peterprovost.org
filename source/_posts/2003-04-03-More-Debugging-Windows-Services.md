---
layout: post
title: "More Debugging Windows Services"
comments: false
date: 2003-04-03 17:25:00
categories:
 - Technology
subtext-id: 85bb1347-8cf4-4a85-a96e-f9fa775de234
alias: /blog/post/More-Debugging-Windows-Services.aspx
---


In response to my post about [Debugging Windows Services](http://www.peterprovost.org/2003/04/03.html#a180), [Jason Bock](http://www.jasonbock.net/rss.xml)&nbsp_place_holder;offered the following solution:

> _Have you tried adding Debugger.Break() into your WinService code? Just a thought - if it works you should be able to stop right at the line of code where you want to start debugging. There may be some caveats with this (e.g. the time limits that are imposed on the onXXX() events) but if you haven't tried it it's worth a shot._

Actually, I have used that technique in the past, and you're right... for debugging code that isn't otherwise debuggable, this is a reasonable choice. I just don't really like putting debug logic into my code unless I have to.
