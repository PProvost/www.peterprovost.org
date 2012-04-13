---
layout: post
title: "My newest interesting Powershell script"
comments: false
date: 2006-07-25 12:20:00
updated: 2008-07-06 10:51:27
categories:
 - Technology
tags:
 - powershell
 - warcraft
 - subversion
subtext-id: 041b873e-bb90-4fa1-a8bb-29ed25750580
alias: /blog/My-newest-interesting-Powershell-script.aspx
---


I've started running a bunch of [Ace Addons](http://www.wowace.com/) for [World of Warcraft](http://www.worldofwarcraft.com/) and I love the fact that they have them all up on their [Subversion](http://svn.tigris.org/) server. But it was getting annoying having to do "svn update" on each and every folder (using [TortoiseSVN](http://tortoisesvn.tigris.org/) wasn't any betterΓÇª I then had to right-click each oneΓÇª not better). 

But of course, being the [Powershell ](http://www.microsoft.com/powershell)junkie that I am, I had to automate this, so here's what I just ran. I know it can be simplified a bit, but this works for now: 

`PS >&nbsp_place_holder;gci | where { $_.GetType().FullName -eq "System.IO.DirectoryInfo" } | foreach { cd $_; svn update }`

Woo hoo! 

Update: I suppose I should have just tried using SVN for this first, eh? It turns out "svn update *" works just fine. 
