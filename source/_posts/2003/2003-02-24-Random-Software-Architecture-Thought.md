---
layout: post
title: "Random Software Architecture Thought"
comments: false
date: 2003-02-24 18:26:00
updated: 2004-05-03 21:38:00
categories:
 - Technology
subtext-id: 1e10d294-dcc7-45b6-82d4-b908d6317012
alias: /blog/post/Random-Software-Architecture-Thought.aspx
---


I found this posted at [News from the Forest](http://pinetree-tech.com/weblog/):

> __
> 
> _I've decided (and this is not an original thought) that I want what I call a DataSet Tier. This tier will be constructed of all my domain objects. Depending on the method called it will load up Domain Objects and create a DataSet for them. The tier will accept DataRows containing updated data. Or it will simple accept primary keys. Then I load the object and do whatever is needed. _
> 
> _Then everyone is happy. Web Tier gets to work with their DataSets. I get to work with my objects. _
> 
> __

This is an interesting idea, but I don't understand why he's doing it. The Web Tier works quite happily with "regular objects" and collections, so why do this? I like to use the [Typed Collection Generator](http://www.gotdotnet.com/Community/User/Samples/download.aspx?FileGuid=49eb6463-e5b4-45c9-b87a-33492e70e04c)&nbsp_place_holder;to produce collections of my objects and I regularly use them with the Web Tier. Since the DataBinder object uses reflection to work, you don't have to use DataSets.

Just my 2 cents. (Why did they take the cents symbol off the keyboard?)

&nbsp_place_holder;
