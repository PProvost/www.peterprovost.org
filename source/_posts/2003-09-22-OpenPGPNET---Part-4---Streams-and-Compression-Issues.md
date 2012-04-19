---
layout: post
title: "OpenPGP.NET - Part 4 - Streams and Compression Issues"
comments: false
date: 2003-09-22 02:40:00
updated: 2004-05-02 09:30:00
categories:
 - Technology
subtext-id: 0b7dc558-5af4-4e84-a4bf-6bfdc5a83d12
alias: /blog/post/OpenPGPNET---Part-4---Streams-and-Compression-Issues.aspx
---


This is a short note about some thoughts I've been having all weekend.

I've been reading about how you can chain a series of [CryptoStream](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemsecuritycryptographycryptostreamclasstopic.asp) objects together to get sequential encryption or transformations. Very cool.

I've also been reading the code for the Cryptix OpenPGP implementation. This implementation seems to be heavily centered around the [Java Cryptographic Extensions](http://java.sun.com/products/jce/) (JCE) architecture so it doesn't fully apply here, but it does seem to use an approach that involves chaining streams and algorithms together.

So before I go much further I'm probably going to write a couple of spike solutions to play around with this idea.

Also, I'm researching my options for ZIP (RFC1951) and ZLIB (RFC1950) compression libraries. I've found the ICSharpCode ZIP implementation but I have two potential problems with it:

  1. I think it is a ZIP (RFC1951) implementation and not a ZLIB (RFC1950) implementation. AFAIK these two RFC's are almost identical... but I'm not sure. Anyone know if ICSharpCode's implementation will do both?
  2. ICSharpCode's library is GPL with some extensions. I've emailed the author to see if he will give me permission to reference his compiled DLL from my BSD (or whatever) licensed code. We'll see...

That's about all for now. I probably won't touch this until mid-week as I need to finish getting everything together for my talk on UIP.
