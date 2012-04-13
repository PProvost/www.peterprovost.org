---
layout: post
title: "Enabling Non-Admin Shutdown on Windows Server 2003"
comments: false
date: 2004-11-04 14:33:00
updated: 2005-01-20 14:20:00
categories:
 - Technology
subtext-id: a7ac68a5-ca23-4257-bde1-a8e0c9066361
alias: /blog/Enabling-Non-Admin-Shutdown-on-Windows-Server-2003.aspx
---


I am in the middle of moving all of my development activities to Windows Server 2003 from Windows XP. The single biggest reason for this move is that in Windows Server 2003 you can [use IIS6 application pools to enable ASP.NET debugging as a non-admin](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dv_vstechart/html/tchDevelopingSoftwareInVisualStudioNETWithNon-AdministrativePrivileges.asp), while in Windows XP, you have to modify the machine.config file (something I would rather not do).

One thing that you will want to do if you decide to run non-admin on Windows Server 2003 is to enable it so that you (a local User) can shutdown the machine!

To do that, you need to first of all use MakeMeAdmin to get into Admin mode, then launch the Group Policy Editor (gpedit.msc). Drill down to **Computer Configuration/Windows Settings/Security Settings/Local Policies/User Rights Assignment**. On the right side, look for the **Shut down the system** policy and double click it. Add you local Users group to that list and you are all set.

One other thing that you may want to do is take a look at the article [How to convert your Windows Server 2003... to a Workstation](http://www.msfn.org/win2k3/). I personally don't do all of the things they suggest, but some of them are useful tips.

UPDATE 2005.01.20: Brian Button pointed out that my path was wrong and it has now been updated. Thanks.
