---
layout: post
title: "Debugging Windows Services - How to debug the startup code"
comments: false
date: 2003-04-03 20:39:00
categories:
 - Technology
subtext-id: 273eb860-9583-4eb9-bd86-2a90ecbcae97
alias: /blog/post/Debugging-Windows-Services---How-to-debug-the-startup-code.aspx
---


Much thanks to [Wayne Allen](http://dotnetweblogs.com/Wallen), who posted a comment on [my debugging post](http://www.peterprovost.org/2003/04/03.html#a180). I can't believe I didn't think of his first suggestion myself. The second suggestion is more of what I was saying in [my response to Patrick's comment](http://www.peterprovost.org/2003/04/03.html#a183).

> _I had a similar list with one addition, adding a Thread.Sleep(10000); in the OnStart method inside a #if DEBUG so I had time to attach the debugger. I think this is the only way to really debug startup code._
> 
> _Recently I've found a better way to deal with services, first I create a console project that has nothing but a little startup and shoutdown code. Then I create a "library" project that has the real meat of the service. Once I have everything to my liking I create a windows service project and installer/deployment project&nbsp_place_holder;in the same solution as the console and library projects. The console project remains the startup project for the solution, but the installer uses the primary output from the service project._
> 
> _The benefits are that debugging during development is trivial, it forces you to seperate the real functionality from the "host", the final transition to a service is trivial._

As I said before, pulling all of that code out of the service not only makes good sense from a modular code standpoint, but it makes testing so much easier--whether you're doing [TDD](http://www.bespoketechnologies.com/Resources/Test-Driven%20Development%20in%20.NET.pdf) or not.
