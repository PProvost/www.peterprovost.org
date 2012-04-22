---
layout: post
title: "Virtual Development"
comments: false
date: 2003-11-10 03:16:00
updated: 2004-05-01 16:15:00
categories:
 - Technology
subtext-id: a820c653-7743-4ba9-8830-68bbc57785ea
alias: /blog/post/Virtual-Development.aspx
---


While at the PDC, I was hanging out with Harry Pierson (aka [DevHawk](http://www.devhawk.net/)) and a few others when Harry says, "Check this out."

He pulls out his laptop and shows my that he has basically got nothing but Office 2004 and Virtual PC 2004 installed on his laptop. He does _all_ of his development in VPC sessions. His host operating system remains pristine and unchanging. No strange development tools, drivers, or anything else that can screw things up.

I tossed this idea around in my head for a while and mentioned it to a few colleagues. Most were receptive although many were skeptical. One was interested enough to help me plan and setup a series of VPC systems for development inside of our company. We decided to create a base OS install of Windows 2000 Server and Windows Server 2003. Then we would make copies of them and install a basic set of development tools (Office 2K3, VS.NET 2K3, etc.). Later when we want to create special builds for server tools (e.g. BizTalk, SharePoint Portal, etc.) we will just make copies of the development images and install from there. If we ever want to make builds with different development tools, we can just go back to the base├é image.

We got a 250 GB Firewire drive to hold all of the images. When a developer wants to use one of these images, they copy them off of the Firewire drive and onto their local machine. Then they create a differencing disk (a very cool new feature of VPC 2K4) that lets them install whatever they want without messing up the image they started with.

We got the base and development images ready by COB Friday and today I finally repaved my laptop. It has only a few tools other Office and VPC (mostly blogging and such). Now we get to see if this works. I'm very optimistic (granted, I do have 1GB RAM.)

I'll keep you posted.
