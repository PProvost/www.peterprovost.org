---
layout: post
title: "Statically Typed Languages Dead?"
comments: false
date: 2003-05-04 20:53:00
categories:
 - Technology
subtext-id: e3715c93-36ef-4548-ac29-8e4e6eda97fe
alias: /blog/Statically-Typed-Languages-Dead.aspx
---


Uncle Bob proposes that we may not need statically typed languages in the world of Test-Driven Development (TDD).

> _For many years we've been using statically typed languages for the safety they offer. But now, as we all gradually adopt Test Driven Development, are we going to find that safety redundant? Will we therefore decide that the flexibility of dynamically typed languages is desirable? (From Robert C. Martin's Weblog)_

This is an interesting idea. Given my interest in TDD, I've had similar thoughts in the past. Here's the rub, if you aren't going to do TDD **really well**, then you probably **need** statically typed languages. Like it or not, lots of people (me included) take advantage of the compiler. We basically use the compiler as a test in and of itself. It tests whether or not the code is syntactically correct. In many languages, it tells you if the properties and methods you are calling exist and whether they are being called correctly.

If we removed this first-pass testing from the equation, I believe that most developers would have a hard time for a while. Even those who think they are doing TDD would find a number of bugs that keep cropping up over and over until they learn to write tests that perform the same simple checking that the compilers do.

When you are doing full-blown TDD, you should get 90+% coverage with your tests, but you will still have the places where your tested code interfaces with external modules. These are mostly just event pass-thrus and such, but you can still have problems.
