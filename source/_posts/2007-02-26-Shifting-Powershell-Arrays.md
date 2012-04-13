---
layout: post
title: "Shifting Powershell Arrays"
comments: false
date: 2007-02-26 10:25:00
updated: 2008-07-06 10:45:52
categories:
 - Technology
tags:
 - powershell
subtext-id: 099416fc-2347-485d-b08a-db8947ff3860
alias: /blog/Shifting-Powershell-Arrays.aspx
---


In [one of my recent posts](/archive/2007/02/25/22315.aspx), I showed a newer version of my 'sudo for Powershell' that was all writted in Powershell and left an open question about how to collect the variable arguments at the end. 

[Wes Haggard](http://weblogs.asp.net/whaggard/) again comes through with the answer and points me to a post on the [Powershell Blog](http://blogs.msdn.com/powershell/) called [PowerShell Tip: How to "shift" arraysΓÇª](http://blogs.msdn.com/powershell/archive/2007/02/06/powershell-tip-how-to-shift-arrays.aspx)

Using that tip, Wes gave me back a much tighter version of the elevation function: 
    
    
    function elevate
    {
    $file, [string]$arguments = $args;
    $psi = new-object System.Diagnostics.ProcessStartInfo $file;
    $psi.Arguments = $arguments;
    $psi.Verb = "runas";
    [System.Diagnostics.Process]::Start($psi);
    }
    

Killer! Thanks again Wes! 
