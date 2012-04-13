---
layout: post
title: "DHTML Editor in .NET Windows Forms App"
comments: false
date: 2003-03-20 10:46:00
categories:
 - Technology
subtext-id: f66a7560-5b1f-49fd-87fd-255b4e3d5b16
alias: /blog/DHTML-Editor-in-NET-Windows-Forms-App.aspx
---


I decided to start my own blogging system. I know, I know... why write a&nbsp_place_holder;new one? Because I want to. That's why.

Anyway, I started by looking at BlogX and decided to follow his design and have my blog tool be a Windows Forms app. So how do I get a HTML editor? I know how to do it in IE6 using the content-editable attribute, but how do I do it in a Windows Forms application? I looked into converting RTF to HTML but decided that was much more of a hassle that I wanted. So I looked in the BlogX code and saw him using the DHTML Editor for IE5 component.

I added it to my VS.NET toolbox by choosing "Customize Toolbox" and scrolling through the COM section. Once you've found it, you have a nice little HTML editor that you can drag onto your form. Sweet!

Once other thing I'm going to do with my blogger is combine it with Dare's news aggregator code so that it is all in one place. The ASP.NET side will use SOAP to communicate back to the Windows client, and will use XSLT to generate the weblog page. I'll post code when it is closer to working.
