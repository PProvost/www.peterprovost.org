---
layout: post
title: "Powershell Sudo (sort of) for Vista UAC -- REDUX"
comments: false
date: 2007-02-25 19:08:00
updated: 2008-07-06 10:33:51
categories:
 - Technology
tags:
 - vista
 - powershell
 - uac
subtext-id: 197476b1-362a-4e04-b063-531026ef6243
alias: /blog/post/Powershell-Sudo-(sort-of)-for-Vista-UAC----REDUX.aspx
---


Okay, after the email from Wes this morning I spent some of the time on the plane today re-doing my UAC privilege elevation stuff... this time in pure Powershell script. 

As expected, it is quite simple: 
    
    
    function elevate {
    $file = $args[0]; $param = "";
    for($i=1;$i -lt $args.Length; $i++) { $param += $args[$i] + " "; }
    $psi = new-object "System.Diagnostics.ProcessStartInfo"
    $psi.FileName = $file; $psi.Arguments = $param; $psi.Verb = "runas";
    [System.Diagnostics.Process]::Start($psi)
    }
    

Now if only I could figure out how to have something like the Ruby "..." catch-all parameter, I could get rid of all that for-loop crap. 

**UPDATE 2007-02-26:** I just posted [a newer version of the elevate function](/archive/2007/02/26/22339.aspx) that doesn't have the for-loop. Use that one instead. 
