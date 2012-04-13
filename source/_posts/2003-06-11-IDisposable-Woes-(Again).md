---
layout: post
title: "IDisposable Woes (Again)"
comments: false
date: 2003-06-11 15:39:00
categories:
 - Technology
subtext-id: 9b94b77f-b9e4-4ea8-acde-c6b193231d8a
alias: /blog/IDisposable-Woes-(Again).aspx
---


There has to be a better way to deal with this. The biggest downside to using managed code is that you get out of the habit of paying attention to cleanup. In COM days, we all got used to calling AddRef, QueryInterface and Release when we using objects. But now we are in managed land and we don't do that anymore.

Unless, of course you are using an IDisposable object. Then you have to just "know" that you need to call Dispose().

I've [written about this before](http://www.peterprovost.org/2003/05/30.html#a382), but I can't believe more people are hollering about this. I understand the need for the interface, but I want better tool support. Ideally, I want something like a compiler warning if the Dispose call is not detected. I know this won't always be perfect, but at least warn me. If I can't have a compiler warning, maybe an Addin to VS.NET that scans my code looking for suspects.

Is no one else beating their head against this time after time? (In case you can't tell, I got bit by this again!)
