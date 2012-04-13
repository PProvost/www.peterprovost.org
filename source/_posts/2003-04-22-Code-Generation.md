---
layout: post
title: "Code Generation"
comments: false
date: 2003-04-22 19:38:00
categories:
 - Technology
subtext-id: 8089d2fe-ddd6-40bd-87d0-e46b47d71958
alias: /blog/Code-Generation.aspx
---


OK, so I'm a bit late to this discussion...

After reading John Lam's posts ([here](http://www.iunknown.com/Weblog/Whenlessismore.html), [here ](http://www.iunknown.com/Weblog/Codegenerationobservation.html)and [here](http://www.iunknown.com/Weblog/Codegenerationcommentsfro.html)) about using Code Generation as a primary code development technique, I realized that I was heading this way already.

I remember&nbsp_place_holder;when Develop's [GenX ](http://www.develop.com/genx)came out. At the time I didn't really understand. But sometime in the last 10,000 lines of code, I got sick of writing the same code over and over again. Before you start hollering about class libraries and such, understand that I'm talking about the "other code". Class libraries are great and we all create them (especially if we strive for 4LF), but when you are creating Data Access Layers, typed collections, and other things like them, you need a better tool.

I've written custom languages that use simple YACC/LEX parsers to produce C++ code for me, and I even found some similar tools for .NET (although I can't seem to find them right now). I currently use Chris Sells collection class generator and a few other simple tools, but after reading John's article, I must say I'm very interested in [GSLgen](http://www.iunknown.com/Weblog/GSLgenupdated.html).

I'm also entranced with the idea of generating an entire application using abstractions and generated code. Wait... isn't that what C++ was back in the old days? Just an abstraction than produced C code?
