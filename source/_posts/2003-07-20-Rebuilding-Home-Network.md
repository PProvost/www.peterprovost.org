---
layout: post
title: "Rebuilding Home Network"
comments: false
date: 2003-07-20 00:15:00
categories:
 - Technology
subtext-id: 44ce699b-9cc6-4c7d-9382-1ee8e5562d4a
alias: /blog/post/Rebuilding-Home-Network.aspx
---


Haven't been posting much the last few days. Friday was Emily's 30th birthday. Had dinner at Solera (great food, AC not working) followed up by a party at Emily's sister's house.

Spent most of today rebuilding my home network and such. At my last few jobs, I was basically the sysadmin on top of my other duties, so it meant I could do things like 1) put my personal website(s) on a company server and 2) have my provost.org email forwarded to work. I don't think I can do #1 at all and I don't want to do #2.

So I decided to do some network redesign at home. Spent today building up a new machine to be my Domain Controller and Exchange server. Then my old desktop machine is going to become a combo RRAS/PPTP + SQL Server. One of the two will become the home for network shares like Users, Backups, etc.

&nbsp_place_holder;I still run floppyfw on a 486 with 16MB RAM as my firewall. If you have a 486 (or even a 386) and two spare NICs, you can have a pretty good firewall up in no time. The whole system boots off of a single write-protected floppy, so it is difficult for people to break in.

I also decided to bring up my wife's old Mac G3 tower. I'm thinking that maybe seeing it there every day will help me remember to buy a copy of OSX and install it. I think it has OS9 or earlier on there now and I never touch it, but I might actually use it if it were running the NetBSD-derived OSX. We'll see...
