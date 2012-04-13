---
layout: post
title: "Annoying TimeSpan"
comments: false
date: 2003-05-13 15:51:00
categories:
 - Technology
subtext-id: 6b9a75cf-9e7d-4963-97de-0da39736b186
alias: /blog/Annoying-TimeSpan.aspx
---


Why doesn't System.TimeSpan have a ToString() overload that takes formatting info?

I should not have to do this:
    
    DateTime dt = new DateTime(1, 1, 1, ts.Hours,   
        ts.Minutes, ts.Seconds );  
    string result =&nbsp_place_holder;dt.ToShortTimeString();

Dumb.
