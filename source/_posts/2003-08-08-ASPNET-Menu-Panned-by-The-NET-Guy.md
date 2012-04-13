---
layout: post
title: "ASP.NET Menu Panned by The .NET Guy"
comments: false
date: 2003-08-08 11:29:00
categories:
 - Technology
subtext-id: 21bda986-01cc-4c25-9cbf-5301abf99ee6
alias: /blog/ASPNET-Menu-Panned-by-The-NET-Guy.aspx
---


Brad Wilson (aka The .NET Guy) [writes](http://dotnetguy.techieswithcats.com/archives/003723.shtml):

> Peter Provost [posts about ASPnetMenu](http://www.peterprovost.org/weblog/permalink.aspx?guid=1aa3ced4-dc10-4075-81b6-5f4e579ce694), a product we purchased and are now in the process of replacing. The problem we had with this control was that the HTML output was quite copious, and even moderately large menus (with a few dozen items) would end up being many 10s of K of HTML. Part of the problem is that they used tables for layout; another part is simply inefficient HTML (each menu element has 4 or 5 events tagged off of it).
> 
> Since menus don't often change, it's best to get a system where your menu is entirely in JavaScript. Then you can emit the menu as a separate URL, with separate caching semantics from your menu-adorned pages. To that end, we think we're probably moving to AJMenu from [NavSurf](http://www.navsurf.com/). It's not .NET-based, but it should be easy to make a .NET wrapper that could dynamically generate the JavaScript as needed.

Honestly, I find that almost ALL .NET Web Controls produce too much HTML. Not to mention the ViewState bag. The fact that this one does doesn't surprise me at all. You should see the amount of&nbsp_place_holder;HTML and script produced by [RichTextBox](http://www.richtextbox.com/)!

Like I said in my original post however, I don't think popup menus belong on the web. Unless the visual look is almost exactly like a windows application, people get confused and don't know if they should click, rollover, or what. My 2 cents.
