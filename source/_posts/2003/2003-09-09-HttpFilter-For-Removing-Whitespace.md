---
layout: post
title: "HttpFilter For Removing Whitespace"
comments: false
date: 2003-09-09 03:06:00
updated: 2004-05-02 09:41:00
categories:
 - Technology
subtext-id: 475808fd-dd50-4683-927d-81cde769743e
alias: /blog/post/HttpFilter-For-Removing-Whitespace.aspx
---


Donny Mack [posted an interesting idea](http://dotnetjunkies.com/WebLog/donnymack/posts/1468.aspx). Add an HTTP Filter to strip out tabs and CRs. I wonder how much it will shrink the average page? I just might try it on a few of my sites.

One thing to keep in mind though, his algorithm is doing a naive replacement of whitespace and carriage returns. The problem is if you have Javascript that isn't semicolon delimited. Since it isn't required, many developers don't bother. So check your client-side script before using this.
