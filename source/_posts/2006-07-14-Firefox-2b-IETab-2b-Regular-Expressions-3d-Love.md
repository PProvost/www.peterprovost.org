---
layout: post
title: "Firefox + IETab + Regular Expressions = Love"
comments: false
date: 2006-07-14 07:44:00
updated: 2006-07-14 07:45:00
categories:
 - Technology
subtext-id: 5bbf34ee-52fe-424d-845f-d5076768693f
alias: /blog/post/Firefox-2b-IETab-2b-Regular-Expressions-3d-Love.aspx
---


I like [Firefox](http://www.mozilla.com/firefox/'). I've always liked it. It does what I want when I want it to. It is simple. It persists its settings, extensions and search providers in my profile so when I backup my profile onto a new machine, it all comes for free. This is good.

ButΓÇª Firefox doesn't automagically pass Active Directory credentials to Intranet sites. Which sucks when you spend a lot of time browsing the Intranet, like I do here at Microsoft.

Enter [IETab](http://ietab.mozdev.org/), a very cool Firefox extension that lets you present any Firefox tab inside of an Internet Explorer tab. Works like a charm. But, you have to remember to add every Intranet site's URL to the list of sites that are automatically opened in a tab.

Or do you?

For the last year I've been doing just that. Finding an intranet site that doesn't work and then adding it to the list. One after another. But the Microsoft Intranet grows almost as crazily as the Internet, so I just can't keep up. I always wanted a checkbox that said, "Open Intranet sites with IETab" but there is no such option.

Then today I discovered that you can use Regular Expressions in the URL field and my eyes got big. After a bit of fiddling I created this one filter URL to get what I always wanted: 

> `http://[^.]+/`

It probably isn't perfect, and it probably will evolve over time, but after some initial testing it is getting my exactly what I want.
