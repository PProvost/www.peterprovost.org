---
layout: post
title: "Dark Theme for Chatzilla"
comments: false
date: 2008-07-24 11:13:29
categories:
 - Technology
tags:
 - irc
 - chatzilla
subtext-id: fd699742-b65b-486c-8340-7d501c831eae
alias: /blog/post/Dark-Theme-for-Chatzilla.aspx
---


Over the years I've been an occasional IRC user. It is far from perfect, but IRC is much better than IM for maintaining that "in the room" experience when talking, collaborating, etc. My favorite IRC network is freenode.net. There are a lot of interesting technical channels there and seems to be less noise than on other networks.

Until recently I was an x-chat user, which was one of the better clients out there, but has since fallen into a state of confusion when the project coordinator decided to take the project and start charging for the Windows client. So I went looking for a new client and found [Chatzilla for Firefox](http://chatzilla.hacksrus.com/).

Not a bad client at first glance. The first thing I wanted to do was change the color scheme, but there didn't seem to be a UI for it. Then I realized that since it is a Firefox extension, it is probably written in XUL and would be styled using CSS. A few hours later, I had this scheme worked out, loosely based on [Brad Wilson's Dark Visual Studio scheme](http://www.agileprogrammer.com/dotnetguy/archive/2006/09/07/19030.aspx).

![DarkChatzilla](/images/blog/WindowsLiveWriter/DarkThemeforChatzilla_AAA4/DarkChatzilla_3.png)

If you want to give this scheme a try on Chatzilla, here' are the files:

[DarkChatzilla.zip](http://www.peterprovost.org/Files/DarkChatzilla.zip) (6.7k)

To use this, extract the zip somewhere on your drive (I put it in $home\Chatzilla). Then just drag the CSS file onto your Chatzilla window or browse to it from the Preferences window.
