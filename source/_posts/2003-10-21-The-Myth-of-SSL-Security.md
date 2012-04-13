---
layout: post
title: "The Myth of SSL Security"
comments: false
date: 2003-10-21 14:26:00
updated: 2004-05-01 16:40:00
categories:
 - Technology
subtext-id: e84834d5-9fcb-4a44-a7e9-0ebba74e5081
alias: /blog/The-Myth-of-SSL-Security.aspx
---


I was having a discussion with a colleague the other day, and they made ite very clear that we **had** to have SSL on this portal server that we were about to roll out.

"Why?" I asked.

"Because it needs to be secure," he replied.

At that point my mouth started flapping on about why I think SSL is a bunch of crap. Needless to say, I got ignored. (It turns out that the real answer wasn't that it needed to be secure, but that the clients who will be using it need the illusion that it is secure.)

And then this morning I find [this article](http://www.mail-archive.com/cryptography%40metzdowd.com/msg01276.html) mentioned on [BoingBoing.net](http://boingboing.net/). In it Ian Grigg reviews the documented threat model of SSL as described in _[SSL & TLS](http://www.iang.org/ssl/rescorla_1.html)_ by Eric Rescorla. The original threat model for SSL was that the end points (the server and client machines) are secure but the circuit between them is insecure. Ian asserts that this is backwards, the boxes are insecure and the circuit is fine.

I agree.

I won't go into a lot of detail here as Ian has done a wonderful job himself, but everyone who recommends technology to other people should read this.

Don't assume that because you have a little padlock on your browser's status bar that you are safe. Understand what is really going on.

UPDATE 2004-05-01: It is interesting how time changes your view of things. While I still think that the person I was talking to was high, I don't blame it on SSL anymore. The problem is really one of understanding what it takes to analyze a system for vulnerabilities, mitigate the risks, etc. SSL is a technology... a tool for mitigating risks. If you haven't identified your risks before applying security technology, then you are just practicing another form of premature optimization.
