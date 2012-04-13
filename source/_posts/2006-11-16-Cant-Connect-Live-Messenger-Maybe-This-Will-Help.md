---
layout: post
title: "Can't Connect Live Messenger? Maybe This Will Help"
comments: false
date: 2006-11-16 12:21:00
subtext-id: b5cdaa5d-afad-4fa6-a47e-1ddd071da02b
alias: /blog/Cant-Connect-Live-Messenger-Maybe-This-Will-Help.aspx
---


My sister pinged me on IM the other day and told me that she couldn't connect her new Windows Live Messenger to the main server. "How are you sending me this message?" I asked. "I'm using Windows Messenger--the one build into Windows XP."

It was interesting, because she could connect the one but not the other. We tried uninstalling and reinstalling. We tried rebooting. We tried lots of different things.

Then I found [this thread on the Microsoft Communities site](http://www.microsoft.com/communities/newsgroups/en-us/default.aspx?dg=microsoft.public.windows.live.messenger&tid=9da6c65e-0dbd-4648-9a66-6befa9404144&p=1) where [Jonathan Kay (Messenger MVP)](http://messenger.jonathankay.com/) points to a registry hack he wrote that helps most people. In case that file or site goes away some day, I'm duplicating the content of the .reg file here.

To use this, copy the following code into a file called "remove_msgrsettings.reg" and then double click the file to incorporate the change.

**IMPORTANT: **Messing around in your registry can break your computer. If you don't know what this file does, consider whether you want to use it or whether you might be better off contacting Microsoft Support.
    
    Windows Registry Editor Version 5.00 
    
    [-HKEY_CURRENT_USER\Software\Microsoft\MSNMessenger]

Your mileage may vary... from what I can tell, this registry change doesn't fix everyone's issues.
