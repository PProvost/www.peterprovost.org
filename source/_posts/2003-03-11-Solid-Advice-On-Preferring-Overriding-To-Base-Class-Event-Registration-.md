---
layout: post
title: "Solid Advice On Preferring Overriding To Base Class Event Registration "
comments: false
date: 2003-03-11 14:01:00
updated: 2004-05-05 14:36:00
categories:
 - Technology
subtext-id: a1704337-1e52-4bbf-b5f0-72a2dfbcbd6c
alias: /blog/Solid-Advice-On-Preferring-Overriding-To-Base-Class-Event-Registration-.aspx
---


> > _I can't remember the last time I've been handed source code for a Form- or UserControl-derived class that didn't include a handler for its own Load event. Why is this? Sadly, I know the reason... _[[Shawn A. Van Ness's Blog](http://dotnetweblogs.com/SAVanNess/posts/3646.aspx)]
> 
> _Some solid advice from Shawn. He explains the common WinForms scenario, but it really applies in any component inheritance scenario. For example with ASP.NET, it's mainly the `Control::Init` and `Control::Load` events that people end up doing this with.&nbsp_place_holder;I've tried to _[_explain it_](http://discuss.develop.com/archives/wa.exe?A2=ind0209D&L=DOTNET-WEB&P=R2168&1=ADVANCED-DOTNETDOTNET-CLRDOTNET-CXDOTNET-WEB&9=A&I=-3&K=1&X=74CD2060428A4C4B47&Y=dmarsh@mimeo.com&d=no+match;match;matches&z=4)_ on _[_DOTNET mailing lists_](http://discuss.develop.com/)_&nbsp_place_holder;on a couple of occasions, but I still see people doing it from time to time. As Shawn points out, it's not really a serious problem, but it's just not the best practice. With .NET, we're living in an OO world,&nbsp_place_holder;we should&nbsp_place_holder;take advantage of it and prefer method overriding in these scenarios._
> 
> _Oh... and on the flip side of the coin, whenever you're designing a component, make sure and follow _[_the recommended design guideline_](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconeventusageguidelines.asp)_ of defining a protected virtual `On` method that inheriting classes can override._
> 
> _[_[_Drew's Blog_](http://dotnetweblogs.com/dmarsh/)_]_

I can't agree more. I've always wondered why MS chose to implement so many samples this way. It just doesn't make sense. The observer/delegate&nbsp_place_holder;pattern is great for dealing with other objects, but why do it up the inheritance chain?
