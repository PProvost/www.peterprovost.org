---
layout: post
title: "Another Agile Computer Repave Done"
comments: false
date: 2007-07-16 11:29:00
categories:
 - Agile Software Development
 - Technology
subtext-id: 2b04540e-c46d-472d-85f6-9e1aeeb32607
alias: /blog/Another-Agile-Computer-Repave-Done.aspx
---


**_Introduction_**

As many of you know, I repave/reformat my computer often. I always used to say that I did it every 6 months, but it seems that it gets more and more frequent as my tolerance goes down and I get better at the repave process. I now can have a full repave done and be back to functional in about 2.5 hours. I can start it, go to a meeting, come back for 15 mins, go to another meeting and when I get back I'm pretty much functional. 

Not everything that was installed will be installed, but actually that is the point. Since the 90s Freeware Software explosion, I have loved tinkering with new tools and things. Over time they accrete onto my system. Some I uninstall, some I don't. Some I keep using, some I forget about. Some uninstall cleanly, some don't. 

Almost all of them however, leave a fingerprint behind in the registry or the filesystem. And like many people who don't like fingerprints on their computer screens, I don't like fingerprints in my operating system.

A number of people have asked me how I do my repaves this efficiently. There are a few tips and tricks, but none of them are particularly new or surprising. It is essentially an application of agile techniques applied to a non-software problem:

  1. Stack rank your backlog and keep it prioritized as you&nbsp_place_holder;learn more and things change 
  2. Have clear release criteria so you know when you are done 
  3. Use good discipline and practices to enable you to respond positively to change

**_The Process_**

How these are specifically implemented in my system is as follows.

**Stack rank your backlog and keep it prioritized as you&nbsp_place_holder;learn more and things change**

For years, I have been keeping a "log" of the software I install on my system. Every time I install something, I open up the list and add it to the bottom. The list has two sections, "Done" and "Backlog" indicating what has been done and what I think I still need to do. It looks something like this:

> _Done_
> 
> [x] Windows Vista 32-bit IT Supported Image  
[x] eTrust Antivirus  
[x] Restore My Profile from Backup  
[x] Office 2007  
[x] Configure and run Microsoft Update  
[x] Configure Outlook and start First Sync w/ Exchange  
[x] Password Minder  
[x] ISA Firewall Client
> 
> _Backlog_
> 
> [ ] Windows Live Writer  
[ ] X-Chat2  
[ ] Live Meeting Console  
[ ] Vim  
[ ] Configure Consolas as a console font  
[ ] etc  
[ ] etc

Although this log is now a OneNote page, it was for a long time nothing more than a text file on my desktop. When I started a new repave, the first thing I would do is copy the old file over to the new empty desktop. I delete the old Backlog because since they were never done on my last build, it is very unlikely that I need them on this build. I then move the Done list down into the Backlog list and assume that the stack rank is correct since that was the order that I needed them last time.

As I install software or configure settings that I like, I move them up from the Backlog to the bottom of the Done list (or just add them to the Done list if I didn't have them on the last build).

**Have clear release criteria so you know when you are done**

This one is actually simple: stop when you don't need any more. Do more when you need more.

How this manifests itself is that there are two big "cut lines" that occur. The first cut line is about on par with what I show in the Done list above. At that point, I can do about 75-80% of my job as a manager. When I was doing more active development, my developer tools were immediately after this cut line and above a number of other things. The two major cutlines I had back then were "usable computer" (OS, email, office, etc.) and then "developer computer" (usable + dev tools). As a manager, new tools (mostly internal corporate tools) are in the second list and the developer tools have moved lower down the stack to be installed only when I need them.

**Use good discipline and practices to enable you to respond positively to change**

This is the part that people really want to know about when they ask me about this, but ultimately as with Agile Software Development, this is the part that enabled you to be agile not the part that makes you agile. (More on that in a later post.)

The specific practices I apply are fairly simple:

  * Everything in your Home - Keep everything that you care about keeping between build in your user profile "home" directory (C:\Users\Username on Vista). Don't put anything anywhere else that you need to keep between builds. 
  * Profile Backups - XCOPY backup your user profile directory to an external hard drive before reformatting your drive. (The XCOPY options you want are "/h /e /y /c".) You can use Robocopy if you prefer, but the command line switches are much more confusing. 
  * Single Development Directory - I keep all my "side project" source code in a Subversion repository in the sky. On my local system, I have a C:\Dev directory that I keep my working copies in, but I don't back this up other than making sure everything here is stored in a version control system somewhere. 
  * Program Files overlay on a backup drive - This is a trick Brad Wilson taught me. I keep a directory named "Program Files" on my external drive that has all of the XCOPY-able programs that I like to have on my system. This includes things like Password Minder, HotKeyPlus, PureText, etc. 
  * User bin directory in my Profile - This is another directory full of binaries, but these are in my profile (e.g. C:\Users\Username\bin) and are typically little command line tools like grep, awk, svn, etc. 
  * Helpful Setup Scripts - I have a few PowerShell scripts that I have created for setting %PATH%, %EDITOR%, %VISUAL% etc. and for setting up shortcuts to some of the XCOPY-able "Program Files".

**_Conclusion_**

I've been living my computing life this way for years now. The specific practices I've used have evolved over time, but the principles and intent have remained unchanged for&nbsp_place_holder;a very long time. It allows me to test-drive new software, configurations, tools, etc. and if I screw up my machine, I don't care. Repave it. 

It also helps acccount for registry and file system bloat. You know what I mean, even the most perfect uninstaller will leave stuff behind. Hopefully very little, but stuff nonetheless. A clean wipe helps get rid of that stuff.

So there you go... an agile approach to maintaining and managing your computer. People often don't believe me, but I can do my repave back to "usable work computer" in about 3 hours, which really helps me feel free to do it more often.

Enjoy!

Technorati Tags: [Agile](http://technorati.com/tags/Agile), [Technology](http://technorati.com/tags/Technology), [Windows Vista](http://technorati.com/tags/Windows%20Vista)
