---
layout: post
title: "Unit Testing and BizTalk 2004"
comments: false
date: 2004-06-23 12:57:00
updated: 2004-06-23 13:22:00
categories:
 - Technology
subtext-id: 9b4dbda4-79b2-4b52-bd2a-01a12bdccdcb
alias: /blog/Unit-Testing-and-BizTalk-2004.aspx
---


Over the past few months I have seen a number of people talking about a desire to do Unit Testing in BizTalk 2004. But what I haven't seen is anyone claiming any success.

Since all of the BizTalk objects now compile down to .NET Assemblies, it seems to be that with a good framework we should be able to test them with something like NUnit. This framework may be a set of MockObjects, stubs or even a very customized version of NUnit itself.

Since&nbsp_place_holder;I am now on a BizTalk project, I'm going to start down this road and see where it leads. I'm hoping that it will be successful.

I'm hoping even more that someone will read this post and [send me an email](http://www.peterprovost.org/contact.aspx) back that says, "Wait! I've already done it. Here is the code!"

But until that happens, I have to proceed on my own.

While I'm at it, I also intent to explore how NAnt and Continuous Integration can be used with BTS04. Given all the nice command line tools, I'm optimistic. Again... if you've written some BTS tasks for NAnt, please [let me know](http://www.peterprovost.org/contact.aspx).

UPDATE: I found these&nbsp_place_holder;[two](http://www.traceofthought.net/PermaLink,guid,2e018262-cc86-4830-bdc6-871dfb1af51e.aspx) [posts](http://www.traceofthought.net/PermaLink,guid,df02e4ab-590c-409c-8de9-8f54776de595.aspx) by Scott Colestock about using NAnt with BTS. Thanks Scott! [subscribed]
