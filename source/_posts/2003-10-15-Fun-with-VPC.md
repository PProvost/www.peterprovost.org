---
layout: post
title: "Fun with VPC"
comments: false
date: 2003-10-15 03:33:00
updated: 2004-10-23 12:25:00
categories:
 - Technology
subtext-id: 5292a3b7-0f17-4f2c-a947-396401f2f1db
alias: /blog/Fun-with-VPC.aspx
---


I've been a longtime fan of VMWare, but since my company gets VPC licenses with our MS Partner license, I'm moving away from it.

At first it was annoying because it was different, but I've found a few things that I really like about it:

  1. You can mount an ISO image as a CDROM drive in the guest OS from your host PC. Very convenient since almost everything on MSDN downloads is in ISO format 
  2. You can mount a **folder** from your host PC as a drive in your guest OS. I only just discovered this one and it is very cool. 
  3. The video driver's tolerance of window resizing is amazing

I've also run into a few problems. Some I've solved and some I haven't

  1. In VMWare, you could setup networking as "host only mode" and you didn't have to worry about it. It just worked. This is very nice for when you are building an AD controller in the virtual machine and don't want it messing up your "real" domain. I figured out how to [accomplish the same thing by using the loopback adapter](http://support.microsoft.com/default.aspx?scid=kb;en-us;825089) and static IPs. Not quite as elegant but it does work. 
  2. Each VPC can only have 1 NIC, so you can't simulate complicated server setups 
  3. I haven't tried it yet, but I can't find any docs about setting up clustering using VPC. Anyone?

All in all, I'm pretty happy. Apparently there is a new version in the works. Wonder what they'll add?
