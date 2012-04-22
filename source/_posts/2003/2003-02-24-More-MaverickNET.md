---
layout: post
title: "More Maverick.NET"
comments: false
date: 2003-02-24 09:16:00
updated: 2004-05-03 21:36:00
categories:
 - Technology
subtext-id: adb4a993-f8b0-41b7-9f1d-237683c305f0
alias: /blog/post/More-MaverickNET.aspx
---


OK, so I'm still happily playing with [Maverick.NET](http://mavnet.sourceforge.net/). So far so good. I implementing some more complicate features and will continue to report back as I get more info.

One thing that I've found is that I can't create [NUnit](http://nunit.org/default.htm) tests for controllers that derive from the built-in controller base classes. Basically it doesn't follow the [Law of Demeter](http://c2.com/cgi/wiki?LawOfDemeter) so I can't pass in appropriate [Mock Objects](http://www.mockobjects.com/) to act as stubs for the HttpRequest etc. I may end up recreating the Maverick.Ctl classes to make them more unit test friendly. We'll see...
