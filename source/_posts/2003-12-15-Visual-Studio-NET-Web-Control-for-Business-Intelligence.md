---
layout: post
title: "Visual Studio .NET Web Control for Business Intelligence"
comments: false
date: 2003-12-15 10:34:00
updated: 2004-05-01 14:45:00
categories:
 - Technology
subtext-id: 0d70c0eb-9d53-4e60-b2b1-36043393c302
alias: /blog/Visual-Studio-NET-Web-Control-for-Business-Intelligence.aspx
---


Last week I attended the Business Intelligence Loadfest put on by Carl Dubler and Michael Acosta at the local MS distict office. Unfortunately, that was a blizzard day, so I did't stay till the end, but I did get most of the content.

One of the really cool things I saw was a .NET Web Control for OLAP. Basically a pivot table in plain ASP.NET. No Office requirement. No browser requirement (although I haven't tested it in Mozilla yet).

Once you've got the control connected to an OLAP catalog properly, you see this:

![](/weblog/content/binary/Layout1.gif)

How sweet is that?

Then you drag and drop your columns and data fields into the pivot table and click Update. Here is what you get:

![](/weblog/content/binary/PivotTable.gif)

Now that is nice. It even supports drill through and other great stuff.

How much? Believe it or not, it is [freely downloadable from Microsoft](http://www.microsoft.com/downloads/details.aspx?FamilyID=4599b793-b3c6-4ed5-acb3-820d0e832151&displaylang=en). Now you have no excuse to not do OLAP with your ASP.NET clients.

One other thing that I saw that you should look at is the new BI Portal 2.0, a WSS based environment for viewing and storing OLAP views and charts. This one does require that Office be installed, so it isn't a perfect fit for everyone. I can't seem to find a link for this, so it may not be published yet. I'll let you know if I find it.
