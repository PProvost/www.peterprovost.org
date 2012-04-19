---
layout: post
title: "Dundas Charting for ASP.NET"
comments: false
date: 2003-07-31 21:27:00
categories:
 - Technology
subtext-id: bf050e80-90ef-4c63-9d06-bd7d4cb3ba87
alias: /blog/post/Dundas-Charting-for-ASPNET.aspx
---


I just finished a mini-project where we needed to do some graphing of network data. Before I joined the team, the developers had been fighting Crystal Reports to get what they wanted but it just couldn't be done. (The series data was too complicated to do without a crazy stored proc and the dba for the customer wouldn't let us create an sp's in his database.)

So we decided to build it by hand. I handrolled pie charts one before using the good stuff in System.Drawing, but this time is just seemed crazy. When I started looking for a graphing component, the [Dundas component](http://www.dundas.com/index.aspx?section=ChartHome&body=body.htm) for ASP.NET got good marks so I downloaded it and got to work.

This control is very nice. Easy to work with, but flexible enough to do almost anything. I have charts that have as many as 48 different series grouped together by color and it took it just fine. It even supports multiple charting areas (many graphs in the same chart). If you're looking for a charting/graphing component, I would recommend it. The eval is free and full featured so you don't have to buy it until you're convinced it will work for you. All ASP.NET controls should work that way. Nice job Dundas.
