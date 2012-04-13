---
layout: post
title: "Undeletable Files in XP"
comments: false
date: 2003-04-16 20:49:00
categories:
 - Technology
subtext-id: 11a525e1-84f5-4776-9a7a-89c7f7e21580
alias: /blog/Undeletable-Files-in-XP.aspx
---


I've been annoyed by something for a week or so and tonight I finally fixed it. While I normally use Easy CD Creator to burn CDs, one day I used the Windows XP built-in capabilities. Two things happened... firstly the CD failed to burn and secondly I couldn't delete the temporary files. Consequently, every time I logged into my system, XP told me "You have files waiting to be burned to the CD-ROM." Whenever I tried to delete them, I was told the file was in use by another process. Bummer.

I finally got sick and tired of it enough to fight it. I ran a quick Google news search and turned up nothing. What next? Well, if you've ever been in need of weird little utilities for Windows, you've probably visited [http://www.sysinternals.com](http://www.sysinternals.com). This site has tons of useful little tools for things like this. For this task, I downloaded the Handle tool, which will tell you all open files on the system and which process is holding them open.

I ran Handle and found that the file in question was being held open by Windows Explorer. Understand that I've rebooted my system dozens of times since this started and apparently Explorer grabbed this file every time it came back up.

Now that I knew which process was holding the file open, I just had to kill it and delete the file. So I opened a command window and cd'ed to the "C:\Documents and Settings\MyLogin\Application Data\Microsoft\CD Burning\" folder. How did I know where to go? Handle told me.

Next I opened Task Manager and went to the Processes tab. I selected Explorer.exe and clicked the End Process button. The desktop disappears when Explorer shuts down, but my command window is still open. Running Handle again confirmed that the file could now be deleted. Now I just deleted the file using the DEL command. A quick logout+login and I'm back to normal.

I hate crap like this. I don't know if it is a bug in XP or what, but I would imagine that your average XP user would not figure this out.
