---
layout: post
title: "I Love Refactoring"
comments: false
date: 2003-05-21 20:58:00
categories:
 - Technology
subtext-id: 7e10eea8-6568-44ac-8324-628882bd833a
alias: /blog/I-Love-Refactoring.aspx
---


I found this [in a post](http://aspnetweblog.com/posts/7373.aspx) on [ScottW's ASP.NET Weblog](http://aspnetweblog.com/) today:

> _Speaking of refactoring, for a while now I have been reading Martin Fowler's **Refactoring** (great book btw). I was visiting some links listed on Martin's site, when I came accross Josh Kerievsky's e-book: **Refactoring to Patterns**. I have only had a couple of minutes to skim through it, but it looks very promising (especially if you don't have Martin's book) _

Martin's [Refactoring](http://www.amazon.com/exec/obidos/ASIN/0201485672/peterprovosto-20) is one book that is ALWAYS out on my desk. It gets opened at least once a week. People love to talk about how patterns have saved software development, but for me it was refactoring.

If you already know about [Martin Fowler's Refactoring](http://www.amazon.com/exec/obidos/ASIN/0201485672/peterprovosto-20) book (and [its accompanying website](http://www.refactoring.com)), then you also should download and review the e-book Scott mentions in his post: [Refactoring to Patterns](http://industriallogic.com/papers/rtp017.pdf). It isn't complete, so don't expect it to be the kind of bible that Refactoring is. But it is an excellent bridge between the [GoF Patterns book](http://www.amazon.com/exec/obidos/ASIN/0201633612/peterprovosto-20) and Refactoring.

This is my favorite quote from Refactoring to Patterns:

> _When you make your code more flexible or sophisticated than it needs to be, you over-engineer it. Some do this because they believe they know their system?s future requirements. They reason that it?s best to make a design more flexible or sophisticated today, so it can accommodate the needs of tomorrow. That sounds reasonable, if you happen to be a psychic._
> 
> _But if your predictions are wrong, you waste precious time and money. It?s not uncommon to spend days or weeks fine-tuning an overly flexible or unnecessarily sophisticated software design?--leaving you with less time to add new behavior or remove defects from a system._

This is a classic violation of the XP YAGNI principle... You Ain't Gonna Need It. I wonder if anyone has considered something like CMM for patterns adoption. It might go something like this:

  1. You discover patterns. You don't really see what all the hype is about. 
  2. You read the GoF book and actually use a pattern in a program. 
  3. You learn and understand what patterns are really all about. You know all of the GoF patterns and try to use them whenever possible. You violate YAGNI every day you code. 
  4. After building one last excessively complicated program, you realize that patterns are another useful tool, but they are not the end-all-be-all of software development.
