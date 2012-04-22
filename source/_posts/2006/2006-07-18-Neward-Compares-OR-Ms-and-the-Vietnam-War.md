---
layout: post
title: "Neward Compares O/R-Ms and the Vietnam War"
comments: false
date: 2006-07-18 06:45:00
updated: 2008-07-06 19:44:33
categories:
 - Technology
subtext-id: 95ece19b-9221-463d-951f-cd6ca5c57357
alias: /blog/post/Neward-Compares-OR-Ms-and-the-Vietnam-War.aspx
---


A few weeks ago Ted Neward posted his long awaited post titled "[The Vietnam of Computer Science](http://blogs.tedneward.com/2006/06/26/The+Vietnam+Of+Computer+Science.aspx)" where he compares the Object Relational Mapping quagmire with the American involvement in Vietnam: 

> Although it may seem trite to say it, Object/Relational Mapping is the Vietnam of Computer Science. It represents a quagmire which starts well, gets more complicated as time passes, and before long entraps its users in a commitment that has no clear demarcation point, no clear win conditions, and no clear exit strategy. 

I was there at Tech Ed 2004 when Ted said it, and honestly, I think he's right. This is a yucky space that just doesn't seem to go anywhere helpful. Lots of great new ideas, each plagued by either a new problem or a host of long forgotten ones. 

Ted carefully goes through the major problems that O/R Mappers run into including: 

  * The Object-Relational Impedence Mismatch
  * The Object-to-Table Mapping Problem
  * The Schema-Ownership Conflict
  * The Dual-Schema Problem
  * Entity Identity Issues
  * The Data Retrieval Mechansim Concern
  * The Partial-Object Problem and the Load-Time Paradox

One observation that he makes that particularly resonated with me is this: 

> While many DBAs will faint dead away at the thought, in an increasingly service-oriented world, which eschews the idea of direct data access but instead requires all access go through the service gateway thus encapsulating the storage mechanism away from prying eyes, it becomes entirely feasible to imagine developers storing data in a form that's much easier for them to use, rather than DBAs. 

(Before anyone freaks out about Ted using Vietnam as a reference here, please read [his follow-up](http://blogs.tedneward.com/2006/06/27/Thoughts+On+Vietnam+Commentary.aspx).) 
