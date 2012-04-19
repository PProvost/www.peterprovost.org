---
layout: post
title: "Using IHttpHandler to Add Error Handling to ASPX Pages"
comments: false
date: 2003-08-21 20:58:00
categories:
 - Technology
subtext-id: e4b7752a-02f4-4e5f-98be-0d2c78cc67b9
alias: /blog/post/Using-IHttpHandler-to-Add-Error-Handling-to-ASPX-Pages.aspx
---


I was just putting together a presentation on the ASP.NET Runtime/Pipeline for a customer when this [little tidbit popped up](http://staff.develop.com/candera/weblog2/permalink.aspx/60cb3dc2-fe67-4f88-9771-eeaebe507795)&nbsp_place_holder;on [Craig Andera's weblog](http://staff.develop.com/candera/weblog2/).

Basically Craig needed to add error handling to a whole&nbsp_place_holder;bunch of ASPX pages and he didn't want to mess up the code that was already there.

IHttpHandler to the rescue! Since IHttpHandler is what is really driving the whole ASPX process anyway, and since System.Web.UI.Page implements IHttpHandler, you can reimplement it yourself and provide a try..catch block to catch those pesky exceptions.

Read [Craig's post](http://staff.develop.com/candera/weblog2/permalink.aspx/60cb3dc2-fe67-4f88-9771-eeaebe507795) for a nice code sample.
