---
layout: post
title: "Dell Inspiron Display Woes"
comments: false
date: 2004-05-12 11:54:00
categories:
 - Community
 - Technology
subtext-id: 555d0867-6671-4665-9386-33f96506e93e
alias: /blog/post/Dell-Inspiron-Display-Woes.aspx
---


I recently repaved my Dell Inspiron 8500 and in the process, downloaded and installed the newest video drivers. But I kept noticing some strange behavior:

  * When I would close the lid of the laptop, the screen would switch resolutions to 800x600 causing all the icons on my desktop to move
  * I couldn't seem to get it to show the main screen on the external video adapter (think presentations) without using something like UltraMon's mirroring capaility (which works but has issues with VPCs).

So I posted a query to [WinTechOffTopic](http://groups.yahoo.com/group/win_tech_off_topic/) and got the following reply from [Jon Kale](http://www.gritstoneandchips.com/Blog/):

> It's a known and acknowledged bug in the latest set of Dell/ATi drivers (rev a04) - it's been happening to my D600 as well. Sucks but...
> 
> &nbsp_place_holder;
> 
> To alleviate it you can...
> 
> &nbsp_place_holder;
> 
> a) set the computer to 'Standby' on lid close and uncheck the prompt for a password on resume from standby
> 
> &nbsp_place_holder;
> 
> b) uninstall the current video driver and install the earlier driver 7.80.4.1-030103a&nbsp_place_holder; rev. a02
> 
> &nbsp_place_holder;
> 
> c) don't shut the lid until after you've gone into standby/hibernate
> 
> &nbsp_place_holder;
> 
> Apparently it'll be fixed in a forthcoming revision of the driver set, but for the time being, those are the options

So I tried waiting, but I just couldn't stand it anymore. It was killing me. So I started backtracking through the drivers on the Dell site and believe it or not I had to go back TWO versions to address the issue. I am now running 7.80.4.1.1-030207a-7695c A01 and it seems to be working.

&nbsp_place_holder;

I have to give a presentation at Microsoft Denver in about an hour, so hopefully it won't give me any trouble.

&nbsp_place_holder;

BTW, if you are:

  * Denver
  * Have nothing to do this afternoon
  * Didn't attend the Web Security track at DevDays
  * Want to learn about Web Application security

Then come on over to my talk MSDN Session: "Building Secure ASP.NET Web Applications". It is at the [Microsoft Denver offices](http://www.microsoft.com/mscorp/info/usaoffices/denver.asp)&nbsp_place_holder;at 1:00pm today.
