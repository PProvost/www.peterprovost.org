---
layout: post
title: "Enterprise Update Scan Tools"
comments: false
date: 2005-08-28 15:32:00
categories:
 - Technology
 - Opinions, Politics, Rants
subtext-id: 423d1176-2b7d-479e-a820-a6e9a92c37b8
alias: /blog/Enterprise-Update-Scan-Tools.aspx
---


<rant>

Here at Microsoft, the IT people frequently scan every computer connected to the corporate network, checking to see if it has all the required patches and whatnot. This is a good idea and not something I would ever say I was opposed to. But strangely, there are a few patches that [Microsoft Update](http://go.microsoft.com/fwlink/?LinkId=40747), [MBSA](http://www.microsoft.com/technet/security/tools/mbsahome.mspx), etc. can not detect. And if they can't detect them, it makes it rather difficult to know if you are fully patched.

And here is where my rant begins... you wouldn't believe how much time in the past 6 months I've spent on the phone with tech support after getting my port turned off. You see, I have a Virtual Server running in my office. I use it to host anything new and exciting that I'm unwilling to install on my laptop. In the run up to Whidbey Beta 2, I was taking fresh drops every couple of days and putting them in fresh new guest images. I've been doing similar things with Vista (formerly Longhorn), Avalon, Indigo, etc. And apparently my base image, which I made back in late '05, wasn't patched for [MS05-009](http://www.microsoft.com/technet/security/bulletin/MS05-009.mspx) (the PNG exploit).

So every time I brought a new image up, I either a) had to remember which download to get to fix the base image or b) wait for them to shut my port down.

(Yes, yes... you are all now wondering why I didn't just fix the base image, but there is a certain amount of laziness inertia to contend with here...)

Each time they shut my port down I have to spent 10-15 minutes I'm on the phone with corporate IT support. And each time, I ask, "Hey, how can I detect these things? I'm fully patched as far as I can tell. There has to be a way for me to know this without you guys shutting down my port."

But they always come back with, "Well, the only way is to check this EXE for its version, do a search for that DLL and check its version, look in this registry key, etc."

I thought Windows Update (and now Microsoft Update) were supposed to solve this for us... but apparently there is something about checking file versions that it can't do. ![](http://www.peterprovost.org/Files/smile12.gif)

Now for the worst part...&nbsp_place_holder;It turns out that there _are_ scan tools for all of these "undetectable" issues. They just aren't advertised much (and are apparently unknown by our own tech support people). So, if you want to be 100% sure that you don't have any of these issues, go and get the [Enterprise Update Scan Tools](http://support.microsoft.com/kb/894193)&nbsp_place_holder;from Microsoft Downloads and scan your machines. They aren't quite as easy to use as MBSA and Microsoft Update, but there aren't many of them&nbsp_place_holder;and you won't have to do them very often.

</rant>
