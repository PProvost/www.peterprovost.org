---
layout: post
title: "Hyper-V Management Console on Vista x64"
comments: false
date: 2008-11-04 15:39:52
categories:
 - Technology
tags:
 - hyper-v
 - windows server
subtext-id: 13652ec5-2b75-4eab-8c40-38cce491a03b
alias: /blog/Hyper-V-Management-Console-on-Vista-x64.aspx
---


![logo-ms-ws08-v](/images/blog/WindowsLiveWriter/HyperVManagementConsoleonVistax64_DAD5/logo-ms-ws08-v_3.png) After a great time in Los Angeles last week for PDC2008, I returned to Redmond this week to re-deliver my talk "Architecture Without Big-Design-Up-Front" for the _patterns & practices _Summit this morning.

I've been doing my demos for this talk using the new Visual Studio 2010 CTP and have it running on by under-the-desk machine (more power than my laptop). But since the Summit is in a different building than my demo machine, I wanted to reach into it from my laptop using the Hyper-V Management Console from Windows Vista.

After getting my machine up to SP1 (one of my prereqs had failed) I was able to install it. But for some reason, I couldn't get it to connect. I could connect with Remote Desktop, but I couldn't connect with the Hyper-V Console.

After a bit of digging, I found a WONDEFUL set of posts by John Howard, a PM from the Hyper-V team. In there he shows you all the security and firewall connections you should check if you have issues connecting to the Hyper-V server.

  * [Part 1 - The Server-side Stuff](http://blogs.technet.com/jhoward/archive/2008/03/28/part-1-hyper-v-remote-management-you-do-not-have-the-requested-permission-to-complete-this-task-contact-the-administrator-of-the-authorization-policy-for-the-computer-computername.aspx)
  * [Part 2 - The Client-side Stuff](http://blogs.technet.com/jhoward/archive/2008/03/28/part-2-hyper-v-remote-management-you-do-not-have-the-requested-permission-to-complete-this-task-contact-the-administrator-of-the-authorization-policy-for-the-computer-computername.aspx)
  * [Part 3 - Server-side with Server Core](http://blogs.technet.com/jhoward/archive/2008/03/30/part-3-hyper-v-remote-management-you-do-not-have-the-requested-permission-to-complete-this-task-contact-the-administrator-of-the-authorization-policy-for-the-computer-computername.aspx)
  * [Part 4 - In a Domain-joined Environment](http://blogs.technet.com/jhoward/archive/2008/04/01/part-4-domain-joined-environment-hyper-v-remote-management-you-do-not-have-the-requested-permission-to-complete-this-task-contact-the-administrator-of-the-authorization-policy-for-the-computer-computername.aspx)
  * [Part 5 - Weirder Domain-joined Stuff](http://blogs.technet.com/jhoward/archive/2008/04/04/part-5-domain-client-to-workgroup-server-hyper-v-remote-management-you-do-not-have-the-requested-permission-to-complete-this-task-contact-the-administrator-of-the-authorization-policy-for-the-computer-computername.aspx)

It turns out that all of my settings from Part 1 were correct, but one setting in Part 2 was wrong (WHY??). I didn't need Parts 3-5, but I'm including them here for completeness.

Thanks John! You saved my ass. 

PS. Now that PDC is behind me, I'm planning a bunch of blog content to share all that great stuff with the rest of you. Stay tuned!
