---
layout: post
title: "Replacing ExpectedException in NUnit 2.4"
comments: false
date: 2008-06-27 12:14:00
updated: 2008-07-05 00:00:07
categories:
 - Agile Software Development
tags:
 - tdd
subtext-id: 5ccbe978-c4e2-42ba-a502-d19fda8baffd
alias: /blog/post/Replacing-ExpectedException-in-NUnit-24.aspx
---


[Jim Newkirk](http://jamesnewkirk.typepad.com/posts/), [Brad Wilson](http://bradwilson.typepad.com/) and I have been in agreement about the evils of ExpectedException for a long time. When Jim and Brad wrote xUnit.net, in fact, they left it out and opted instead for a new Throws method that lets you be a lot more precise about what and when you are testing the exception. 

But NUnit 2.4.x doesn't have this feature (2.5 will). Fear not! Jim has written a nice little sample of the Throws method for NUnit 2.4.x that provides this same experience in his new post [Replacing ExpectedException in NUnit](http://jamesnewkirk.typepad.com/posts/2008/06/replacing-expec.html). 

If you are using NUnit today, I would really suggest you read the post and consider changing the way you test exceptions in your unit tests. 
