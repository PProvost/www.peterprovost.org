---
layout: post
title: "Unit Testing Rules"
comments: false
date: 2005-09-18 17:48:00
updated: 2008-07-06 14:21:01
categories:
 - Agile Software Development
tags:
 - unit testing
 - tdd
 - agile development
subtext-id: 2836dfc4-11a8-4f03-bc43-ffaf2f4732f4
alias: /blog/Unit-Testing-Rules.aspx
---


I was just sent [this post by Michael
Feathers](http://www.artima.com/weblogs/viewpost.jsp?thread=126923) where he
asserts: 

> A test is not a unit test if: 
> 
>   * It talks to the database
>   * It communicates across the network 
>   * It touches the file system 
>   * It can't run at the same time as any of your other unit tests 
>   * You have to do special things to your environment (such as editing 
>     config files) to run it. 
> 
> Tests that do these things aren't bad. Often they are worth writing, and they
> can be written in a unit test harness. However, it is important to be able to
> separate them from true unit tests so that we can keep a set of tests that we
> can run fast whenever we make our changes. 

This is a very interesting set of rules and for the most part I agree with
Michael. When I do TDD I try to avoid these things as much as possible. But when
I find myself needing to break one of these "rules", I almost always end up
doing the same thing. 

I create a single minded little class that does that one thing. Then I test it
to ensure that it does it. Then I walk away from it. 

As an example, consider a business class that needs to pull some information
from an XML file on the file system. That is what the customer requirement was.
However, I would never even consider putting XML or file system logic in that
business component. Instead I'll write a class that talks to the file system and
returns some sort of domain model (not XML). I'm now free to test my business
component using a mock of this persistence loader, completely in isolation of
the file system. 

I think Michael does the same thing. He continues: 

> That might sound a little severe, but it is medicine for a common problem.
> Generally, unit tests are supposed to be small, they test a method or the
> interaction of a couple of methods. When you pull the database, sockets, or
> file system access into your unit tests, they aren't really about those
> methods any more; they are about the integration of your code with that other
> software. If you write code in a way which separates your logic from OS and
> vendor services, you not only get faster unit tests, you get a 'binary chop'
> that allows you to discover whether the problem is in your logic or in the
> things are you interfacing with. If all the unit tests pass but the other
> tests (the ones not using mocks) don't, you are far closer to isolating the
> problem. 
> 
> Frankly, we need both kinds of tests, but these "pure" unit tests are
> undervalued. 

I guess the only part I don't really like is that distinction between **_other
tests_** and **_pure_** unit tests (emphasis mine). I don't think it is safe to
ignore these **_other _**tests and I don't know what to call them other than
**_unit tests_**, so I'm hesitant to accept the part of Michael's post where he
says, "A test is not a unit test if..."

I would much rather say this: "A unit test should try to avoid..." and then
follow it with his five bullets. 

