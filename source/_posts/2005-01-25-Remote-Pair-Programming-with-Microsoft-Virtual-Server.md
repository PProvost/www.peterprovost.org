---
layout: post
title: "Remote Pair-Programming with Microsoft Virtual Server"
comments: false
date: 2005-01-25 22:25:00
categories:
 - Technology
subtext-id: 7c3c0dd4-20fb-49ef-b4e5-14fc85f153b0
alias: /blog/Remote-Pair-Programming-with-Microsoft-Virtual-Server.aspx
---


Today I found another excellent reason to use [Virtual Server 2005](http://www.microsoft.com/windowsserversystem/virtualserver/default.mspx)&nbsp_place_holder;for your development activites. I've been a convert of virtual development environments since I met Harry Pierson at PDC 2003 and [he showed me his setup](http://www.peterprovost.org/archive/2003/11/10/923.aspx). Since then I have never had a single development tool installed on my laptop. It has made for much more stable systems with the added bonus of being able to keep separate machines for separate projects (a must when you are in consulting, but also a plus when you aren't).

Since coming to Microsoft I've been using Virtual Server instead of VirtualPC. Why? Simple, I have a laptop AND a desktop machine. I leave the fat ol' desktop machine at work running Virtual Server instances and I use remote desktop to access themΓÇª from my desk or from home. Same environment. Same performance (as compared to my laptop which is good, but not that good).

But today I&nbsp_place_holder;needed to do some more remote pairing with [Brian Button](http://dotnetjunkies.com/WebLog/oneagilecoder/). We had [done this before](http://dotnetjunkies.com/WebLog/oneagilecoder/archive/2004/12/03/34886.aspx) using [Skype](http://www.skype.com/) and [RealVNC](http://www.realvnc.com/), but VNC wasn't behaving well. So we decided to try the VMRC client.

I didn't know about this tool until a couple of weeks ago when I was lucky enough to be on a cruise in Lake Washington on [Keith Pleas](http://weblogs.asp.net/kpleas/)' boat with a number of .NET luminary types. At one point, after describing my setup someone asked my why I wasn't using the Virtual Server client program.

"The one in the browser?" I asked.

"No. The standalone client program."

Hmmm. I didn't know what he was talking about so I wandered off and contemplated my navel somewhere. You learn something new every day, eh?

I later found it on the Virtual Server installation and copied it over to my laptop. I tried it that night from home over RAS and it worked ok. It had some usability issues that made it a second place compared to RDP for me, but it was adequate. But until today, I stuck with RDPΓÇª

Today, Brian and I wanted something that I knew RDP couldn't offer, but VNC could: two simultaneous users connected to the same login session. (Before anyone leaves a comment asking why I didn't use MSN Messenger Remote Application Sharing, I'll say this: You try it through firewalls, routers and the like. No go.)

I didn't know if VMRC would support what I wanted, so we tried it. VNC wasn't working worth a crap.

You know what? It was perfect. MUCH better than VNC was. Almost as good as RDP. Add in Skype (which was also giving us problems but we got it to work eventually) and we had a wonderful remote pairing solution.

So the old old way was NetMeeting. The less old way was Real VNC. The new way is VMRC.
