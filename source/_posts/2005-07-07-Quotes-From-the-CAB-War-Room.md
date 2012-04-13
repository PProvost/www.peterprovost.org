---
layout: post
title: "Quotes From the CAB War Room"
comments: false
date: 2005-07-07 16:02:00
categories:
 - Technology
subtext-id: 2f61839d-2c26-40cf-92b6-0f99f8197f38
alias: /blog/Quotes-From-the-CAB-War-Room.aspx
---


While working in the CAB war room (like the Delta Lounge[1] but bigger), there are a number of utterances that I seem to say all the timeΓÇª

"Use inheritance to be reused, not to reuse."

> This is a bad mis-quoting from [C++ Coding Standards: 101 Rules, Guidelines, and Best Practices](http://www.amazon.com/exec/obidos/redirect?path=ASIN/0321113586&link_code=as2&camp=1789&tag=peterprovosto-20&creative=9325). In it, Herb Sutter and Andrei Alexandrescu write, "Public inheritance is substitutability. Inherit, not reuse, but to be reused." It continually amazes me how often developers will derive from a base class to reuse its functionality when they don't actually mean for the new class to be substitutable for the other.
> 
> Additional reading: [The Liskov Substitution Principle](http://www.objectmentor.com/resources/articles/lsp.pdf)

"Nothing is better than deleting code and having your tests still pass."

> Assuming you have a nice test harness with good code coverage, nothing makes me happier than deleting code from the production system and leaving the unit tests working. After all, if the test doesn't need it to pass, you don't need it to be there.
> 
> Or, maybe you're missing a testΓÇª

&nbsp_place_holder;"That class? I deleted it. There weren't any tests, so I figured someone just forgot to delete it."

> &nbsp_place_holder;I did this a lot at the beginning of CAB, when I was still trying to "bend the team to my TDD will". ![](http://www.peterprovost.org/Files/smile2.gif)&nbsp_place_holder;In the end it had the desired result, and in fact, may have caused a bit of excess. But better that than no unit tests at all.

[1] Ron Jacobs did a couple of podcasts about The Delta Lounge [here](http://www.ronjacobs.com/podcast/pnplive28-MAR-2005.mp3) and [here](http://www.ronjacobs.com/podcast/pnplive30-MAR-2005.mp3).
