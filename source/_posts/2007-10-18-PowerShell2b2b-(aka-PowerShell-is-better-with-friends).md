---
layout: post
title: "PowerShell++ (aka PowerShell is better with friends)"
comments: false
date: 2007-10-18 09:10:00
updated: 2008-07-05 00:23:33
categories:
 - Technology
tags:
 - powershell
subtext-id: 076a9e56-daef-4d62-a3cb-17b22e8d0955
alias: /blog/PowerShell2b2b-(aka-PowerShell-is-better-with-friends).aspx
---


Yes, my love affair with [Windows PowerShell](http://www.microsoft.com/windowsserver2003/technologies/management/powershell/default.mspx) continues. I've rediscovered a couple of things that make the PowerShell experience even better. 

The most recent one for me is [PowerTab](http://thepowershellguy.com/blogs/posh/pages/powertab.aspx). PowerTab takes the extensible Tab-completion feature of PowerShell to rediculous extremes. Imagine Intelli-crack for everything... functions, cmdlets, paths, .NET types and methods, parameters, etc. Truly amazing work. (Here's a video to whet your appetite: [PowerTab 0.93 and BDD 2007 teaser](http://thepowershellguy.com/blogs/posh/archive/2007/06/05/powertab-0-93-and-bdd-2007-teaser.aspx)) 

Another one isn't really about PowerShell per se, as much as it is about redisovering some gems from my past. I've always been a [VIM](http://www.vim.org/) guy (as opposed to an Emacs guy). In fact, I'm the maintainer of the [VIM syntax files for PowerShell](http://www.vim.org/scripts/script.php?script_id=1327). But there are lots of other gems in the Unix world that make PowerShell even better. 

There are a number of projects on CodePlex and others that are attempting to recreate all the old Unix utils as PowerShell cmdlets, and in some cases they make sense. For example, when you use the unix 'tail' command, it returns you a big ol' string. For PowerShell you would probably prefer to have it return an array of strings to save you a step in your&nbsp_place_holder; command pipeline. 

But there are things that aren't really about returning objects to you. Things that are more about manipulating files and such. For example, suppose you want to do a global search and replace in a file. Sure you can do this with a few lines of PowerShell script. You could even create a custom function of cmdlet to generalize it for you. 

Or you could just use 'sed', the old Unix stream editor. It is [simple](http://www.student.northpark.edu/pemente/sed/sed1line.txt), [amazingly powerful](http://sed.sourceforge.net/grabbag/tutorials/), and works every time. There are a surprising number of useful gems (like 'less' for example) from the Unix world that have been ported over to Win32 and they all work wonderfully with PowerShell. There are two projects on Source Forge that I keep an eye on for these kinds of things: 

  * GnuWin32 - [http://gnuwin32.sourceforge.net/packages.html](http://gnuwin32.sourceforge.net/packages.html)&nbsp_place_holder;(has almost everything)
  * UnxUtils - [http://unxutils.sourceforge.net/](http://unxutils.sourceforge.net/)&nbsp_place_holder;(not updated in a long time)

The final tidbit is the #PowerShell IRC channel on [FreeNode.net](http://freenode.net/faq.shtml). Yes... I use IRC.&nbsp_place_holder;IRC is still the best open and freely available distributed chat system out there. Again, like so many of the old Unix things, it is simple, powerful and works every time. There are lots of very intertesting channels on FreeNode, most of which are about technology and not the newest bad reality TV show. If you're interested in giving IRC a try, check out the [Silverex X-Chat client](http://silverex.org/news/) and look for me on Freenode as PProvost. 

So all you PowerShell junkies... don't forget your roots. There are still gems to be mined from the olden days. 

Technorati Tags: [PowerShell](http://technorati.com/tags/PowerShell), [Gnu](http://technorati.com/tags/Gnu), [Unix](http://technorati.com/tags/Unix), [IRC](http://technorati.com/tags/IRC)
