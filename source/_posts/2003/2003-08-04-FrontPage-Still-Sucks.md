---
layout: post
title: "FrontPage Still Sucks"
comments: false
date: 2003-08-04 21:40:00
categories:
 - Technology
subtext-id: 297364ea-b5d1-45bf-b56b-2a33e58ee164
alias: /blog/post/FrontPage-Still-Sucks.aspx
---


I already hear you asking, "Why are you using FrontPage?"

Well, honestly, because SharePoint Portal Server 2003 likes it. Seriously, there are things that you can only do in FP2003. Don't ask me why. I think it is stupid, but its true.

Now I will say, FP2003 is better than any version I've ever tried before. It doesn't seem to rearrange your formatting. It doesn't seem to remove your scripts (with one exception noted below). The design mode is pretty good. And it has intellisense for HTML tags. Not bad.

What pissed me off today more than once is that it likes to clean up <%@ Register %> tags when it thinks you don't need them. I said, "When it **thinks** you don't need them." It thinks wrong. 

I see how the developers of FP2003 made this mistake, but since the product is shipping in a few weeks, I'm going to guess that it won't be fixed. It took me a while to figure out why this was happening, but I think I've finally figured it out. I think FP2003 scans the body of your page looking to see if the registered prefix is used anywhere. If it isn't, it removes the register directive. Otherwise it leaves it alone.

The problem is that it only scans the contents of the <body> tag. In the page I was working on today, I was using it in the <head> section of the page. Every time I used FP2003 to ass a webpart to the page it would remove the register.

Aargh!
