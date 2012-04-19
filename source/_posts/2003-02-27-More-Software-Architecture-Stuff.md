---
layout: post
title: "More Software Architecture Stuff"
comments: false
date: 2003-02-27 19:24:00
updated: 2004-05-05 14:15:00
categories:
 - Technology
subtext-id: 88ddc7e7-7beb-46e7-bd57-a080a9560acc
alias: /blog/post/More-Software-Architecture-Stuff.aspx
---


In response to my post asking why he was using DataSets instead of collections of model objects, Justin responded:

> [_Why I want to pass DataSets to the web tier_](http://pinetree-tech.com/weblog/archives/2003/02/27.shtml#why_i_want_to_pass_datasets_to_the_web_tier)_. _
> 
> [_Peter_](http://www.peterprovost.org/2003/02/24.html#a37)_ asks why I want to do _[_this_](http://pinetree-tech.com/weblog/archives/2003/02/23.shtml#000218)_. _
> 
> _I've actually been asked that a few times. So here goes... _
> 
> _We (my current gig) just had a rule passed down that all grids be sortable by any column both ascending and descending. _
> 
> _ADO.NET has all these nice features for sorting (i.e. the DataView). So if I give data back as a DataTable, then the UI can decide how they want to sort independent of how I want to sort. Sure I could do this with custom implementations of IComparer. But my typical object has 6 columns that are shown on the screen. So, in the worst case (but most OO case), I would have twelve comparers (one for each column and order combination). I could go with a somewhat simpler approach and have one comparer per column and have it know whether or not it should be ascending or descending. And I could finally have one comparer per object where the UI passes in the sort direction and field to sort by. But this uber comparer for the object would be huge and have bunches of switches. I'm sure there are other ways to implement a comparer, but those are the 3 I came up with with a few minutes thought. _
> 
> _Of course, the idea of returning datasets might be moot once I finish my ObjectComparer (sort any object by one of it's fields using reflection). _
> 
> _[_[_News from the Forest_](http://pinetree-tech.com/weblog/)_]_

That is an excellent idea. Why didn't I think of that. Hopefully either Justin or I will publish one soon.
