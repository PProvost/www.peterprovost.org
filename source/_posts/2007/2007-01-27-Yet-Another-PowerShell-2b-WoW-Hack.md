---
layout: post
title: "Yet Another PowerShell + WoW Hack"
comments: false
date: 2007-01-27 17:37:00
updated: 2008-07-06 10:52:24
categories:
 - Technology
tags:
 - powershell
 - warcraft
subtext-id: 29438e56-5fcd-470e-bfd1-6c9d53ddd6b4
alias: /blog/post/Yet-Another-PowerShell-2b-WoW-Hack.aspx
---


Today I was cleaning out my World of Warcraft SavedVariables folder, which is where WoW addons keep state between sessions. Over time I have installed and uninstalled a number of addons and figured I should clean up a bit. 

First I decided to hunt down all files that were for an addon I don't have any more: 
    
    
    function strip-extension ([string] $filename) 
    {
    [system.io.path]::getfilenamewithoutextension($filename)
    } 
    $addonsDir = 'C:\World of Warcraft\Interface\Addons' 
    $savedVars = 'C:\World of Warcraft\WTF\Account\<MyAccountName>\
    SavedVariables' 
    ls $savedVars\*.lua | ? { (test-path (join-path -path $addonsDir 
    -childPath (strip-extension($_.Name)))) -eq $false } | rm
    

Then I realized that I had forgotten to delete the .bak files that may have been created by upgrades, so I created this little command clean those up: 
    
    
    ls *.bak | ? { (test-path (strip-extension $_.Name)) -eq $false } | rm 
    

Have I mentioned how much I love PowerShell? 

(Note: I artificially wrapped some of those lines to make them show up nicely in the blog.) 
