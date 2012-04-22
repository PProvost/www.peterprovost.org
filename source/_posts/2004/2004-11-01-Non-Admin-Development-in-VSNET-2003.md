---
layout: post
title: "Non-Admin Development in VS.NET 2003"
comments: false
date: 2004-11-01 16:16:00
categories:
 - Technology
subtext-id: ea4b2ec7-978a-4794-a7d2-49a0391f7e9a
alias: /blog/post/Non-Admin-Development-in-VSNET-2003.aspx
---


Because all of you are good developers who don't run as administrator anymore, I'm sure that you have all read most of these articles before. But so that I have them documented here, I wanted to list the things I found useful when I made the switch.

It really isn't that hard. You should be doing it.

As a side note, I do all of my development in a Virtual PC environment. While that doesn't make it any easier per se, it does mean that on my development machine I'm rarely troubled with strange desktop applications that don't work. (Those problems are relegated to my host OS... where I also run non-admin.)

Here is the list of the ones I found the most useful.

[MakeMeAdmin](http://blogs.msdn.com/aaron_margosis/archive/2004/07/24/193721.aspx) - If you are running on a corporate domain, you really need this tool by Aaron Margosis.&nbsp_place_holder;If you are running XP on a workgroup, read [this post](http://blogs.msdn.com/aaron_margosis/archive/2004/06/17/158806.aspx) instead. If fact, go read all of of Aaron's non-admin post categories: [Non-Admin](http://blogs.msdn.com/aaron_margosis/category/5785.aspx) and [Non-Admin for Home Users](http://blogs.msdn.com/aaron_margosis/category/6592.aspx).

[PrivBar](http://blogs.msdn.com/aaron_margosis/archive/2004/07/24/195350.aspx) - Once you've made the switch, you really should be running PrivBar to help you know which explorer (and IE) windows you have open as admin. I was very happy to see this running on a number of presenter's machines at Win-Dev last week.

[Running VS.NET as non-Admin](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dv_vstechart/html/tchDevelopingSoftwareInVisualStudioNETWithNon-AdministrativePrivileges.asp) - This MSDN article is a must read; in particular the part about debugging ASP.NET applications. (And that bit about messing with the machine.config file has convinced me to repave using Server 2003 ASAP.)

[TestDriven.NET](http://www.testdriven.net/) - The most recent builds (RC6 and later I think) of TestDriven.NET (formerly known as NUnitAddin) support running as non-admin.

[How to Secure Your Developer Workstation](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnnetsec/html/HTWorkStat.asp) - Another must read from MSDN.

[Running As Non-Admin](http://www.dotnetdevs.com/articles/RunningAsNonAdmin.aspx) - Brad Wilson (aka [The .NET Guy](http://dotnetguy.techieswithcats.com/)) has an article that lists applications that work and don't work when running non-admin.
