---
layout: post
title: "Content Validation in .NET 1.1"
comments: false
date: 2003-05-02 08:47:00
categories:
 - Technology
subtext-id: 4ce088f0-8a65-464c-8a3f-29fa9cacee95
alias: /blog/Content-Validation-in-NET-11.aspx
---


A very interesting thing... in the 1.1 Framework, ASP.NET pages apparently scan posted data for potentially dangerous content (e.g. html tags)

Consequently, the content management system that I wrote for my company's site (and for a few customers) stopped accepting content edits. I completely recognize why something like this was built into the framework, but I would love some detail about what is allowed and what isn't. I hate finding out by trial-and-error.

At least there is a page directive (among other things) that turns it off.
