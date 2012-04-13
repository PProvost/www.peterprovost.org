---
layout: post
title: "Unit Testing BizTalk 2004 Orchestrations"
comments: false
date: 2004-06-29 14:51:00
categories:
 - Technology
subtext-id: 01b9e187-c52c-472a-8073-de8ee47e875d
alias: /blog/Unit-Testing-BizTalk-2004-Orchestrations.aspx
---


After roughly 6 hours of using Reflector to look at the BizTalk 2004 assemblies, I have been completely unable to figure out how to even contruct a new instance of my very simple orchestration. The dependencies are insane. I think that if I could get one "new-ed" then I might be able to talk to its ports, but until I can actually try it, I can't be sure.

So I'm going to take a different approach. I firmly believe that we can't think of BizTalk as a developers tool until we can treat it like one and that includes important tasks like unit testing and verification.

I started thinking about the services that NUnit provides for us. Using NUnit we write classes in C# that test other classes written in C# (no VB bashing intended... I'm just a semicolons and curly braces kind of guy).

So why not test BizTalk Orchestrations the same way? With other BizTalk Orchestrations?

I figure this is at least worth a try. My thought is that I may be able to write an Orchestration that acts as a test running. I will pass stuff into it (maybe an XML document to tell it which tests to run). It then runs other "Test Orchestrations" that play the role of [Test] methods in traditional unit testing.

We can expect that such a framework would have the test runner and many Test Orchestrations for each real Orchestration.

The more I think about this, the more I think it will work. We'll see. I will report back as soon as I have an answer.
