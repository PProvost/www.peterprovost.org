---
layout: post
title: "Improve the Performance of Windows XP"
comments: false
date: 2003-08-06 20:26:00
categories:
 - Technology
subtext-id: eeb6e5cb-af0d-413c-b02b-5eeca399c59c
alias: /blog/post/Improve-the-Performance-of-Windows-XP.aspx
---


I read somewhere (don't remember where) about the DisablePagingExecutive registry setting. Wanting to know a little bit more about it, I found [this article](http://www.neoseeker.com/Articles/Hardware/Guides/winxptweak/3.html)&nbsp_place_holder;full of excellent tips for speeding up your Windows XP machine.

His description of what the DisablePagingExecutive does isn't quite right. This is from the Windows 2000 Resource Kit:

> DisablePagingExecutive   
HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management 
> 
> Data type Range Default value   
REG_DWORD&nbsp_place_holder; 0 | 1&nbsp_place_holder; 0&nbsp_place_holder;
> 
> Description  
Specifies whether user-mode and kernel-mode drivers and kernel-mode system code can be paged to disk when not in use.
> 
> Value Meaning   
0 Drivers and the kernel must remain in physical memory.   
1 Drivers and the kernel can be paged to disk as needed. 
> 
> Tip
> 
> Setting this value to 0 is useful when debugging drivers, because all of the code and data is always memory resident.

So what is really going on here is that the OS and drivers stay in RAM. I've got almost a Gig of RAM on this machine so I'm going to give it a try.
