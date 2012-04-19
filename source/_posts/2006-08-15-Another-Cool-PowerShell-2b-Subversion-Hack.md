---
layout: post
title: "Another Cool PowerShell + Subversion Hack"
comments: false
date: 2006-08-15 19:22:00
updated: 2008-07-06 10:47:16
categories:
 - Technology
tags:
 - powershell
 - warcraft
 - subversion
subtext-id: 58b20db9-22af-467c-a84c-4e64c970f727
alias: /blog/post/Another-Cool-PowerShell-2b-Subversion-Hack.aspx
---


As I said before, I've been writing an Addon for World of Warcraft using the Ace2 libraries which are hosted on a subversion server. 

I was trying to track down a bug that I couldn't reproduce so I decided to completely refresh my entire Ace addon set from the svn server. 

So I needed to run through every directory in my Addons folder and if it was a subversion working copy then I wanted to delete it and re-checkout that folder from the subversion server. 

Again, this only took a single line of PowerShell script: 
    
    
    [75] ┬╗ ls | ? { svn st $_ 2> out-null; return ($lastexitcode -eq 0) } | % { 
    $xml = [xml] (svn info --xml $_ 2> out-null); $url = $xml.info.entry.url; 
    del -recu -force $_; svn checkout $url $_ }
    

I love PowerShell. It rocks! 
