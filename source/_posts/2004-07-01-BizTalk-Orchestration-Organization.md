---
layout: post
title: "BizTalk Orchestration Organization"
comments: false
date: 2004-07-01 15:56:00
subtext-id: 902e1d93-2f8c-4b5d-a3d9-02d5b4734296
alias: /blog/BizTalk-Orchestration-Organization.aspx
---


Boy, that sure is a mouthful, eh?

I've been talking with some BizTalk folks, and have uncovered three main ways that you can organize your larger BizTalk orchestrations:

  1. Large, monolithic orchestrations
  2. Chained organization
  3. Master-child organization

**Large Monolithic Orchestrations**

I don't think this is what the folks on the BizTalk product team would call them, but that is my name for them. This is the situation where you have a large business process that is entirely defined in one orchestration. If you've done the BizTalk tutorial, then you know the kind of orchestration I'm talking about. 

This bothers me for the same reason that great big classes or methods bother me in code. I prefer things to be highly cohesive, and big orchestrations, like big classes and methods, have a tendency to do lots of different things.

**Chained Orchestrations**

Chaining orchestrations seems to be a popular way to partition these things... at least among the people I've talked to. The idea here is to break the big process down into smaller components (which sounds good) and then chain them together (which doesn't sound so good).

So, the message comes into A&nbsp_place_holder;who then passes on to B who passes on to C etc. You can even imagine scenarios where you could have branches, but that starts to frighten me.

I've been told by some of the advocates of this system that it provides better performance than the master-child strategy (see below), but I have concerns about the coupling that happens here. Modifying the chain could be very difficult to do, because you might not know exactly where to put something.

I am thinking that in this scenario, I would want to have special orchestrations on the beginning and end that do nothing other than interface with the external world. Then I would use "Start Orchestration" at the end of each intermediate process to glue the chain together. Does this sound right? Sure seems brittle to me.

Additionally, I wonder how one would document this kind of organization. I would prefer to have my orchestrations self-document themselves like my code does. But in this scenario there is no central place to describe the flow of things. No master document...

**Master-Child Organization**

This is the organization strategy that feels right to me, but I've been told it performs terribly in the real world.

The idea here is to have a Master orchestration that is responsible for communicating with the external ports and then it delegates all further processing to a set of child orchestrations. These child orchestrations could be called either serially or in parallel, using either blocking (call)&nbsp_place_holder;or non-blocking (start) calls.

This just feels so right to me that I have to ask the world what kind of organizations you have used in your orchestrations. Is there another organization scheme that I have missed? Are there other pros or cons that need to be considered?

Please post comments here or use trackback if you would rather post them on your own blog.

Thanks!
