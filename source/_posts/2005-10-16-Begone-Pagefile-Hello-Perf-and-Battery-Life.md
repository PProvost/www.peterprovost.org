---
layout: post
title: "Begone Pagefile: Hello Perf and Battery Life"
comments: false
date: 2005-10-16 13:25:00
categories:
 - Technology
subtext-id: 8a51c22b-7e78-40f1-9434-cae1adae8a34
alias: /blog/Begone-Pagefile-Hello-Perf-and-Battery-Life.aspx
---


Have you ever looked at your system's memory usage? I mean really looked at it? These days most geeks have systems that have at least 1GB RAM if not more and&nbsp_place_holder;this got me to wonderin'ΓÇª do I really need a pagefile if I have enough RAM?

I remembered hearing people talk about not needing one much past 768MB RAM, but I hadn't ever tried it. Until last week. I happened to get a memory upgrade for my laptop (up&nbsp_place_holder;to 2GB RAM) and thought, "What the hell? This is as good a time as any to try this."

So I told XP to run with "No paging file" (System Properties => Performance Options => Advanced => Virtual Memory) and shut down the system. I then added my new RAM and booted up. Right off the bat I noticed the performance difference. Everything seems snappier. Application startup times are better. Responsiveness is better.

On Thursday, after doing all this,&nbsp_place_holder;I said to [Brad](http://www.agileprogrammer.com/dotnetguy) and [Ed](http://blogs.msdn.com/edjez/), "Guys, I'm running without a pagefile and it is great." You know what they said back? "Duh! I run without one too." Okay, perhaps I'm last to this party, but I did a bit of digging and didn't seem to find many people talking about this. Why? I have no idea.

Now that I've been running for a few days this way, I wanted to share a few other interesting observations.

First of all, I've noticed that the system is quieter. I've been sick since Friday so I've been doing a lot of laying in bed watching TV with my laptop sitting on the table next to me. And I've noticed that the fans don't run as often as they used to. And the system seems cooler overall. Must be because the drives aren't so busy.

The other thing I've noticed is that I seem to be getting better battery life. Again, this is purely anecdotal, I don't have any hard numbers for you, but it sure seems like I'm getting 50% more life out of the battery than I used to get. Again, I'm guessing that it is because I'm not spending power spinning drives and fans as much as I used to.

Anyway, I just wanted to share this with you all. YMMV.

Also, for those of you who claim that it doesn't work with "heavy" apps, I've been happily running Outlook, Visual Studio 2005, Word, Excel and multiple instances of IE all at the same time and my memory usage never seems to max out.

Sweet!
