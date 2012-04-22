---
layout: post
title: "Can't Serialize TimeSpan with XmlSerializer"
comments: false
date: 2003-05-21 10:07:00
categories:
 - Technology
subtext-id: bc89b21e-3179-4ee0-8746-7ddc249dd088
alias: /blog/post/Cant-Serialize-TimeSpan-with-XmlSerializer.aspx
---


This is just plain dumb. Apparently whoever was in charge of XmlSerializer didn't think we would ever want to serialize a TimeSpan. Way down in the guts of the CLR is a class called XmlCustomFormatter that is used to serialize primitive types to and from XML. It has member for DateTime but none for TimeSpan.

So I figured I would be able to provide my own formatter, but that doesn't seem to be an option. First of all XmlCustomFormatter is marked internal, so I can't derive from it. Secondly, there doesn't seem to be a way for me to pass a custom formatter to XmlSerializer.

Very annoying. Now I have to use DateTime when all I really need is the TimeOfDay part of it.
