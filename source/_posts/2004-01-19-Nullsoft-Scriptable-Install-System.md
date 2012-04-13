---
layout: post
title: "Nullsoft Scriptable Install System"
comments: false
date: 2004-01-19 08:37:00
updated: 2004-05-01 14:40:00
categories:
 - Technology
subtext-id: 2beb2af1-318c-4d24-ae90-0aa0bae5e0e9
alias: /blog/Nullsoft-Scriptable-Install-System.aspx
---


Matt Berther [writes](http://www.mattberther.com/2004/01/000376.html): 

> A few days ago, I stumbled across NSIS, which is a tool that allows you to create installers for Microsoft Windows. It's released under an open source license and is completely free to use. 
> 
> I really havent had that much time to work with it, but so far, I like what I see. If you do download this and check it out, make sure and get one of the editors for it. It definately makes things easier when you're getting started. 
> 
> I'm noticing that the install and uninstall runs so much faster than the Installshield or VS.NET msi files that I have been using. 
> 
> If you've used NSIS, Id love to hear what you think about it. 

I mentioned NSIS a few days/weeks ago in one of my Geek Notes columns. Because my customer was very size sensitive, the project that we shipped last week used NSIS for its installer. The VS.NET/MSI installer we created was almost 4MB while the NSIS installer was less than 520K. And like Matt, I find the NSIS installers are much faster. 

The downside is that these installers are not MSI based. In fact, the reason the VS.NET installers are so big is that they bundle two copies of the Windows Installer 2.0 (ANSI and Unicode) within the installer. If you switch the deployment project properties from "Windows Installer" bootstrapper to "No bootstrapper", you can alleviate this, but you also can only run the installer on machines that are already running Windows Installer 2.0. 

Also, if you are considering using NSIS for a project I would really suggest you look into [HM NSIS Edit](http://hmne.sourceforge.net/), a full-featured IDE for NSIS scripts. We used the Wizard to build the skeleton of our installer and it worked great. I added about 20 lines of script for registering DLLs and such and that was it. 

Now I just need to get Jamie Cansdale to write NSIS Addin for VS.NET so I can stay in my IDE. :) 
