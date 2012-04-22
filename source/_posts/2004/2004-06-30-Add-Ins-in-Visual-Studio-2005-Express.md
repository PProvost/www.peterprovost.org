---
layout: post
title: "Add-Ins in Visual Studio 2005 Express"
comments: false
date: 2004-06-30 13:28:00
updated: 2004-06-30 13:44:00
categories:
 - Technology
subtext-id: 7be69f08-39c6-4981-98a0-7998d0cc9953
alias: /blog/post/Add-Ins-in-Visual-Studio-2005-Express.aspx
---


**WARNING: This could fire up the whole unit testing debate again, but I have to share this. I can't help myself!**

[Jamie Cansdale](http://weblogs.asp.net/nunitaddin/) (author of [NUnit Add-in](http://sourceforge.net/projects/nunitaddin/)) just pointed out a message on the [VSNetAddin Yahoo Group](http://groups.yahoo.com/group/vsnetaddin/). The post was by [Craig Skibo](http://weblogs.asp.net/craigskibo) (who owns the extensibility stuff in VS) and since not everyone who reads my blog subscribes to that list, I will post it here for you to read.

In response to [this question](http://groups.yahoo.com/group/vsnetaddin/message/1919) by [Arild Fines](http://ankhsvn.com/blog/) (author of [AnkhSVN](http://ankhsvn.tigris.org/)):

> I have heard some rumors that the VS Express editions won't support addins - at all. Can someone with their ear a little closer to the ground than me confirm or deny this?

[Craig replied](http://groups.yahoo.com/group/vsnetaddin/message/1925):

> For Beta 1, we did no special work to enable or disable Add-ins - they are available because the Express editions derive from the core Visual Studio DLL. However, future releases of the Express editions may not support Add-ins,  
Macros, or VSIP packages. Each AppID (our internal terminology - VS, Express C#, Express Web, etc. is each an AppID) has the ability to turn extensibility features on or off, and the current plan of record is that the Express SKUs will  
turn this off. There are a couple reasons for this decision, some to control the download size, some are marketing related. The intent of an Express edition is to support hobbyists, and while I know many of you on this list can be  
considered hobbyist extensibility developers (some do it for a living, some to just make their jobs easier), the focus of the Express edition is on a certian set of scenarios that extensibility development does not support.

So. Given the earlier discussion about unit testing being included in all versions of Visual Studio, it sounds like this will actually prevent [Express](http://lab.msdn.microsoft.com/express/) users from taking advantage of things like NUnit Addin which fill the gap. So now we really are saying that the lower end developers (hobbyists, students, etc.) can't have good, integrated unit testing.

Bummer.
