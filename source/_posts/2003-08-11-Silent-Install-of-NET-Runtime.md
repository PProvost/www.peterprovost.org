---
layout: post
title: "Silent Install of .NET Runtime"
comments: false
date: 2003-08-11 18:43:00
categories:
 - Technology
subtext-id: 1f5cf3e8-94c6-488c-b327-1d3d2eabd70d
alias: /blog/Silent-Install-of-NET-Runtime.aspx
---


I had to find this for someone today, so I thought I'd post it here so it doesn't get lost:

dotnetfx.exe /q /c:"install.exe /q"  
  
What is happening here is the wrapper exe (dotnetfx.exe) is being called with two parameters. The first parameter tells it to run silently. The second tells it to run a specific command after extracting the contents. We then pass the silent flag to the "inner" installer.

Make sense? It doesn't matter, because it works. ;-)
