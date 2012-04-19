---
layout: post
title: "SharePoint Portal Area Explorer v1.0.4"
comments: false
date: 2004-06-07 22:05:00
updated: 2004-10-01 14:14:00
categories:
 - Technology
subtext-id: 220cb698-c994-474d-bd1a-a8db51af4ec7
alias: /blog/post/SharePoint-Portal-Area-Explorer-v104.aspx
---


So today I wrote a quick little tool to help me document an existing SharePoint Portal 2003 installation.

It uses the SharePoint Portal Web Services API, specifically the AreaService. You give it the portal URL, username, password and login doman and it will download the portal's area structure.

[![SpsAreaExplorer Screenshot](/Files/sps_area_browser_2.gif)](http://www.peterprovost.org/Files/sps_area_browser_2.gif)

Once you have downloaded the portal structure, you can then save it in an XML file for future reference, or you can export an HTML report. It isn't much, but it does what I needed. Because of the way the SPS Web Services are structured, it ain't the fastest thing in the world, but it works for me.

You can [download version 1.0.4 here](http://www.peterprovost.org/Files/Setup_1_0_4.zip). If you find it useful, please drop me a line. If you would like the source, just ask.

UPDATE: For those of you looking for the source, I posted it in [this post](http://www.peterprovost.org/archive/2004/06/18/1516.aspx) on June 18, 2004.
