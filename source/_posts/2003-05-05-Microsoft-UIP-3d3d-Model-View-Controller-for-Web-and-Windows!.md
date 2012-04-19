---
layout: post
title: "Microsoft UIP == Model View Controller for Web and Windows!"
comments: false
date: 2003-05-05 20:59:00
categories:
 - Technology
subtext-id: b2aba532-5c6d-4daa-8744-343ebaa97afe
alias: /blog/post/Microsoft-UIP-3d3d-Model-View-Controller-for-Web-and-Windows!.aspx
---


[Microsoft Application Blocks](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnbda/html/daab-rm.asp) is a .NET framework that provides classes for Data and Exception Management. These components that encapsulate common patterns and code into easy-to-use blocks. I use the Data blocks every day. You should too.&nbsp_place_holder;I don't use the Exception blocks much, because I tend to use [log4net ](http://sourceforge.net/projects/log4net)instead.

User Interface Process (UIP) is an MVC implementation that be included in the next release of Application Blocks, tentatively called BlueBricks. It is a very nice looking implementation. I have **not** seen the code, but from looking at [this PowerPoint deck](http://www.dotnetguru.org/articles/WebFormsAndStruts/uip/UIP_Overview.ppt), it seems to have combined a few features that I like from other MVC implementations. It looks like it uses an XML config file similar to the one employed by [Maverick.NET](http://mavnet.sourceforge.net/). It also seems to allow for a complete separation of Controller from View and Model, something that I advocate in all of our projects not only because it is a **Good Thing **but also because it makes [Test-Driven Development](http://www.peterprovost.org/wiki/ow.asp?Test%2DDriven%5FDevelopment%5FIn%5F%2ENET) so much easier.

I'm eagerly awaiting the release of BlueBricks sometime in June. Sure would like to get my hands on some beta bits. Anyone wanna help me out?
