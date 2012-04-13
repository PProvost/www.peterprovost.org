---
layout: post
title: "OpenPGP.NET - Part 3 - Refactoring"
comments: false
date: 2003-09-19 20:16:00
updated: 2004-05-02 09:32:00
categories:
 - Technology
subtext-id: a0a1a008-4321-4e05-beb0-32c5f05d4007
alias: /blog/OpenPGPNET---Part-3---Refactoring.aspx
---


Next up on my list was to implement Literal Data Packet (I know I said Literal Message but I can't do messages until I have packets done).

So as not to bore you all I'll just say that I did exactly what I did last time, but this time I followed the [RFC spec](http://www.ietf.org/rfc/rfc2440.txt) for Literal Data Packet instead of User ID Packet.

Everything worked out just fine. But, as I'm sure you expect, I ended up with a lot of duplication in my code for the ParsePacket methods.

In fact the only significant difference between the two implementations was where and how the content from the packet body gets stored. This only makes sense, of course, because there is a common packet header structure here. But since I'm following TDD here, and since I also am a strong believer in the [DRY principle](http://c2.com/cgi/wiki?DryPrinciple) (Don't Repeat Yourself), I waited until I had working tested code before refactoring out the duplication.

Now I also am an experienced developer who has been around the block before. I also happen to have a spec in front of me that I know isn't changing. So I can take a wee look into the future to see what I will need.

I decided that it would be useful to have a class called PacketReader that knows about the structure of a generic packet and how to read it from a Stream. So I dropped back into TDD mode and wrote a test class called PacketReaderTests. By working my way through the TDD [green light, yellow light, red light](http://community.borland.com/article/0,1410,29648,00.html) routine I was able to get a simple class working that understood how to read the header of a stream and how to translate the body using UTF-8 encoding.

Next I removed all of that code from my UserIdPacket and LiteralDataPacket classes and ran all of the tests again. Green bar! Woo hoo... refactoring complete.

PS. I know I went fast through this but I figured another detailed discussion of TDD was unneccessary.
