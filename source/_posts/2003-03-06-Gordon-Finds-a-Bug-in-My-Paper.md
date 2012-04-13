---
layout: post
title: "Gordon Finds a Bug in My Paper"
comments: false
date: 2003-03-06 07:35:00
updated: 2004-05-05 14:31:00
categories:
 - Technology
subtext-id: 892dba26-cec9-4091-8dff-8e371c9f53c4
alias: /blog/Gordon-Finds-a-Bug-in-My-Paper.aspx
---


Oops!

> [_Peter Provost_](http://www.peterprovost.org/)_ has a good _[_article_](http://www.peterprovost.org/wiki/ow.asp?Test%2DDriven%5FDevelopment%5FIn%5F%2ENET)_ on test driven development in .NET. This is probably the best NUnit-specific tutorial I've seen on how to do unit testing. One thing I noticed about Peter's BankAccount example is that since he's representing balances as a `double`, his tests may never pass - such is life with testing floating point numbers for equality. OTOH, with unit tests, you might find that out earlier than without them._
> 
> _[_[_Gordon Weakliem's Radio Weblog_](http://radio.weblogs.com/0106046/)_]_

Argh! I wrote the BankAccount classes "in the document" instead of actually writing and running the code. Stupid me!

Gordon brings up an excellent point though. Even if the first version of the BankAccountTests class didn't catch this problem, when the bug did appear, it would be easy to find, fix, and prevent from re-occuring by creating a new test to check for the zero problem. Of course, doubles can be made to work if you build in a tolerance, but with money every half-penny counts!

Gordon continues...

> _I recently had to add a method (message?) to a web service and I took a test driven approach, though somewhat modified. In my case, I defined the WSDL interface, generated my server code, and then stub it out enough to compile, and then built my tests. One thing that I took from the experience is that it requires a great deal of discipline to break old habits (not my strength), that writing good tests is hard, and that using a Mock Object strategy really adds a lot of development overhead. But then, so does fixing bugs._
> 
> _[_[_Gordon Weakliem's Radio Weblog_](http://radio.weblogs.com/0106046/)_]_

Congrats on joining the TDD team. If you keep at it for a little while, you'll never go back. And Gordon is absolutely right that fixing bugs **costs a lot more** time than writing tests.

I'm always surprised how hard it is convincing people that **TDD is a Good Thing**. Many people say, "But you write so much extra code that doesn't really matter," or "it is a waste of time to test that extensively."

I disagree with all of those sentiments, but about the only arguments I can give are anecdotal:

  1. Much better designed code. Code that is factored for easy testing is the most modular code you've ever seen. It always amazes me how few developers even know what the [Law of Demeter](http://c2.com/cgi/wiki?LawOfDemeter) is!

  2. Once you get the patterns worked out for doing it, coupled with a few tools and code-generators, you will find that you go just as fast as you did before.

  3. When a bug crops up you already have a test harness that you can use to find it, fix it and make sure it never comes back.

  4. You can't actually do refactoring without good unit tests.

Ok that's enough. I'm starting to rant.
