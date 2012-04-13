---
layout: post
title: "Harvesting Frameworks Instead of Building Them"
comments: false
date: 2003-05-25 19:30:00
categories:
 - Technology
subtext-id: da71e39d-6e7f-4b02-a185-42b5527cc131
alias: /blog/Harvesting-Frameworks-Instead-of-Building-Them.aspx
---


I love Martin's writing. Everything he says just rings true with me. In his post [FrameworkBuilding ](http://martinfowler.com/bliki/FrameworkBuilding.html)he says:

> The role of refactoring has a lot to do with how you build your frameworks. Many people have the notion of a [FoundationFramework](http://martinfowler.com/bliki/FoundationFramework.html). In this case you have to fix and publish your API as soon as possible, which means that refactoring is less useful due the limits I mentioned above.
> 
> But a [FoundationFramework](http://martinfowler.com/bliki/FoundationFramework.html) isn't necessarily the best way to go. I've seen a lot of failures in building frameworks that way. I think [HarvestedFramework](http://martinfowler.com/bliki/HarvestedFramework.html) is a much better way to go, and refactoring is _extremely_ useful when you are building a [HarvestedFramework](http://martinfowler.com/bliki/HarvestedFramework.html).

Then on his [HarvestedFramework](http://martinfowler.com/bliki/HarvestedFramework.html) page he explains further:

> To build a framework by harvesting, you start by not trying to build a framework, but by building an application. While you build the application you don't try to develop generic code, but you do work hard to build a well-factored and well designed application.
> 
> With one application built you then build another application which has at least some similar needs to the first one. While you do this you pay attention to any duplication between the second and first application. As you find duplication you factor out into a common area, this common area is the proto-framework.
> 
> As you develop further applications each one further refines the framework area of the code. During the first couple of applications you'd keep everything in a single code base. After a few rounds of this the framework should begin to stabilize and you can separate out the code bases.
> 
> While this sounds harder and less efficient than [FoundationFramework](http://martinfowler.com/bliki/FoundationFramework.html) it seems to work better in practice.

This is exactly the approach I take to building frameworks. I don't start out intending to build a framework, but as I've said before, I am a Refactoring junkie, so I often end up harvesting one if the possibility arises.
