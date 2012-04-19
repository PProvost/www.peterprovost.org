---
layout: post
title: "Thoughts on FIT and DSLs"
comments: false
date: 2006-06-26 09:00:00
updated: 2007-04-18 11:26:00
categories:
 - Technology
subtext-id: d27aa08a-3079-4dfc-a257-f09bf80fe63b
alias: /blog/post/Thoughts-on-FIT-and-DSLs.aspx
---


This topic came up a few times this week at Tech Ed, so I decided to share my thinking on this topic.

The key thing to understand about FIT is that it is an attitude about separating the content of an acceptance test from the engine (and code) that runs it. The purpose is, of course, to better enable the customer to create tests that the developers can work against. The wiki tables (or Excel worksheets├óΓé¼┬ª I don├óΓé¼Γäót care) in FIT-like systems&nbsp_place_holder;are basically just simple programs written in an easy to understand domain specific language. Most business people use spreadsheets as their primary communcation language├óΓé¼"possibly even more than their native speaking language! ![](http://www.peterprovost.org/Files/smile1.gif)

Ward Cunningham (inventor of Wiki and FIT) and I have talked about this a few times. The biggest problem with many FIT implementations is that FIT was created to provide a simple way to provide input for heavily data driven tests. The DSL in this case is custom tailored for providing something like accounting or financial data to an engine that can test the inputs and outputs. This kind of acceptance testing is very powerful and valuable when the system you are testing is an accounting application, but what about when you are testing something else?

To my mind, the problem is in assuming that wiki tables are appropriate for describing the customer acceptance requirements for all problems. It seems much more likely that different classes of problems will have their own DSLs associated with them. And wiki tables may not be the best way for the customer to communicate that.

So what is the best way for your customer to communicate? That all depends. That is the real challenge for the team to figure out. And it is worth figuring out. Learn your customer├óΓé¼Γäós language and figure out how to turn that into a DSL that you can execute so you can get real automated acceptance tests written by the customer. This is the real holy grail of agile software development. Can we find it?
