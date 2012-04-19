---
layout: post
title: "SharePoint \"V2\""
comments: false
date: 2003-07-17 22:19:00
categories:
 - Technology
subtext-id: d8f3778e-3b24-4a11-8d1a-5bfb0754ba7f
alias: /blog/post/SharePoint-V2.aspx
---


Almost done with my first week at Interlink and I'm enjoying it. I think it is going to be a great place to call home.

Spent the last two days working with the SharePoint Portal Server "V2" beta. Very nice. I always liked what SPS 1.0 promised, but I was always disappointed when it came time to deliver. SPS2 seems to be much better. SPS2 is built on Windows SharePoint Services which is where all the heavy lifting is really happening.

A few nice things:

  1. The whole thing is easily templated and customized
  2. No more WebDAV for document repositories
  3. Web Parts can be written in .NET almost as easily as you create WebControls. Dashboards are gone. Very nice.
  4. Web Parts can be "connected" so that one gets input data from another. (Think customer data... one WebPart lets the user select a customer, another shows invoice history.)
  5. Uses SQL to store most (all?) of the data
  6. You can create your own ASPX pages that reach into the SharePoint object model to get data. Harry Pierson wrote a nice little system that generates RSS from any SharePoint list.

Bad things? I don't know how bad it is, but it will only run on Win2K3. No support for Windows 2000. Oh well, if that's all I can find then it must be a pretty&nbsp_place_holder;good beta. (You know, so far the entire Office 2003 beta has been pretty good.)
