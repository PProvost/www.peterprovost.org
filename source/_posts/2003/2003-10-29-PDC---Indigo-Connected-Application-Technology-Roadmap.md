---
layout: post
title: "PDC - Indigo: Connected Application Technology Roadmap"
comments: false
date: 2003-10-29 19:27:00
updated: 2004-05-01 16:30:00
categories:
 - Technology
subtext-id: b5afdda2-ff7f-485b-b308-3b6e7e1a064c
alias: /blog/post/PDC---Indigo-Connected-Application-Technology-Roadmap.aspx
---


Joe Long, PUM for all the Indigo, COM+, MSMQ, and other connected technologies gave this talk I'm in a rush to get to my only Avalon session, so I'll be quick:

Here are the imporant parts that I got as for planning the next couple of years:

  * "Porting from one version of WSE to another or to Indigo will be a non-trivial exercise."
  * Build services using ASMX
  * Enhance your ASMX service with WSE if you need the WSE feature set and you can accept the support poilicy
  * Use object technology in a service's implementation
  * Use ES if you need ES rich feature set
  * You are communicating between components off the local machine and have you have perf issues
  * Use .NET Remoting if├é you need to integrate with an existing proprietary protocol
  * You are communicating with... (sorry the slide went away... I'll update this post when I can get the slide deck)
  * Use System.Messaging (MSMQ) only if you really need what it offers. It will NOT be migrated to Indigo. It will continue to be supported, but it WILL NOT BE INDIGO.
