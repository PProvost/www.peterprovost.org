---
layout: post
title: "Memory Leak When Using XSLT in .NET"
comments: false
date: 2003-05-19 13:07:00
categories:
 - Technology
subtext-id: 79df9acf-5f75-4735-8f73-3bb514afcee9
alias: /blog/Memory-Leak-When-Using-XSLT-in-NET.aspx
---


Thanks to Frans for [pointing this out](http://dotnetweblogs.com/fbouma/posts/7226.aspx). When you use an XSLT transform that has embedded JScript, the JScript gets compiled into IL behind the scenes. Apparently this IL will never be unloaded from memory and is not collected by GC.

This is not good. I use JScript or C# in many of my XSLT transforms and now I have to worry about it leaking? Wasn't GC supposed to save us from this?

Ugh!
