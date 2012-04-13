---
layout: post
title: ".NET Needs Better Interfaces"
comments: false
date: 2003-06-25 14:49:00
categories:
 - Technology
subtext-id: a630dc12-14e1-4bca-be42-725d62efe482
alias: /blog/NET-Needs-Better-Interfaces.aspx
---


In [this post](http://weblogs.asp.net/fbouma/story/9261.aspx), Frans Bouma continues his list of things he wants added to the VS.NET IDE and the .NET API.

My biggest complaint about the .NET API is that I don't think MS used interfaces enough. (And they seal classes that they shouldn't, but Frans [already convered that one](http://weblogs.asp.net/fbouma/story/9261.aspx).) If you have tried to do [TDD](http://www.peterprovost.org/wiki/ow.asp?Test%2DDriven%5FDevelopment%5FIn%5F%2ENET) with [Maverick.NET](http://mavnet.sourceforge.net/), for example, you very quicly run into a problem with HttpContext and the other HTTP Pipeline classes. Because there are no interfaces to be found, you can't mock them at all.

A similar problem exists in ADO.NET. Once again you can't do TDD very well with it. The root cause is that you can't really write code that is independent of your data provider. It is very close, but when you really get in there you will find that you can't create a DataAdapter without knowing whether you're doing SQL or OLEDB. ([Justin](http://www.pinetree-tech.com/weblog/) wrote Abstract ADO.NET to deal with this, but he shouldn't have had to.)

Another example: Sockets. I was trading email with someone last week and he was asking me how to create a mock Socket. In Java, Socket is an interface, so MockSocket has something to derive from. In .NET, Socket is a class. It is very difficult to mock without creating your own ISocket interface and then creating a lightweight wrapper that aggregates the .NET Socket class. Very annoying.
