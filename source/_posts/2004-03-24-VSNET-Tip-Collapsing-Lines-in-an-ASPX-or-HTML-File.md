---
layout: post
title: "VS.NET Tip: Collapsing Lines in an ASPX or HTML File"
comments: false
date: 2004-03-24 09:08:00
updated: 2004-05-01 11:20:00
categories:
 - Technology
subtext-id: 5e9b507a-85a6-42ae-a36a-5c494ac44152
alias: /blog/post/VSNET-Tip-Collapsing-Lines-in-an-ASPX-or-HTML-File.aspx
---


One of the things I love about the C# editor in VS.NET is how it lets you collapse regions into a little plus sign. Then when I want it back I can just click to plus to see what's there. 

I'm currently working on a Windows SharePoint Services (WSS) Site Definition and I'm using VS.NET to edit the template ASPX files. What I really wanted was a way to collapse table and div tags down into plus signs so I could get the out of my way. 

Well, it turns out you can do it! 

Here's how: 

Select the text you want to collapse, and choose Outlining | Hide Selection from the Edit menu (or just use CTRL-M, CTRL-H). 

POW! The file now has a collapsed region. You can open and close that region by clicking the plug sign or using CTRL-M, CTRL-M. 

Very cool. 

BTW... so far this works in any text file you open in VS.NET. We'll see if that keeps up. 
