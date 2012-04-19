---
layout: post
title: "PowerShell Function: go"
comments: false
date: 2006-08-02 07:51:00
updated: 2008-07-06 10:50:11
categories:
 - Technology
tags:
 - powershell
subtext-id: 1911bd9e-59b6-48a8-a62c-f226f7c8b437
alias: /blog/post/PowerShell-Function-go.aspx
---


Yesterday&nbsp_place_holder;I was in a meeting with [Fernando Simonazzi](http://clariusconsulting.net/blogs/fds/) when he mentioned how much he has been falling in love with PowerShell. We talked for a bit about how cool the object pipeline is and then he said, you know what I've been thinking about writing is a "go" script that will jump to a set of named locations. 

What&nbsp_place_holder;a great idea. I couldn't leave well enough alone, this morning, so I wrote one and put it into my profile. Here it is: 

go.ps1: 

> 
>     	if( $GLOBAL:go_locations -eq $null ) {
>     	$GLOBAL:go_locations = @{}
>     	}
>     	function go( [string] $location ) {
>     	if( $go_locations.ContainsKey($location) ) {
>     	set-location $go_locations[$location]
>     	} else {
>     	write-output "The following locations are defined:"
>     	write-output $go_locations
>     	}
>     	}
>     	

To use it, you can simply put this at the bottom of your profile script: 

> 
>     	. ~/scripts/go.ps1
>     	$go_locations.Add("home", "~")
>     	$go_locations.Add("dl", "~\Desktop\Downloads")
>     	$go_locations.Add("dev", "C:\Development")
>     	$go_locations.Add("scripts", "~\scripts")
>     	

And now you can do this: 

> 
>     	PS1> go home
>     	

Eventually, I will merge this into the "cd" script that [Brad Wilson](http://www.agileprogrammer.com/dotnetguy) and I have been tweaking to really make directory navigation a breeze. 
