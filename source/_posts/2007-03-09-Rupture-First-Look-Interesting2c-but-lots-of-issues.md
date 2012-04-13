---
layout: post
title: "Rupture First Look: Interesting, but lots of issues..."
comments: false
date: 2007-03-09 20:05:00
subtext-id: f84a35f7-53ec-48da-919f-f4d447a2a2ef
alias: /blog/Rupture-First-Look-Interesting2c-but-lots-of-issues.aspx
---


Rupture is a new social network (guild management?) system by Shawn Fanning of Napster-fame. Nice website. Good concept. But at this point I'm not pleased.

Why? They need to hire a better .NET developer.

I run on Vista. I run w/ User Account Controls enabled. I am an administrator, but with UAC an app that doesn't indicate it needs elevated privileges doesn't get it and can't do all kinds of things like write to protected directories and registry keys.

As expected, the installer for the Rupture client prompted me to elevate privileges (yes, it uses a client to manage your data sync-up with the website). So far so good. And since the installer launched the app at its conclusion (bad #1) the app came up with full admin privileges. Well, I've gotten used to this kind of thing, so I immediately shut it down and restarted it.

BLAMMO!

App crashed at startup. Right there at the very beginning of the app they are doing something that requires elevation. I'm guessing they incorrectly opened the World of Warcraft registry key (which is located in HKLM--a protected area) with write permissions (bad #2), but without firing up regmon to see if I'm right, I can't really be sure. I might check that later, but for now I decided to try letting it come up as admin and see what it does.

Now, one of my favorite things about the way WoW is coded is that it is XCOPY deployable. As I've said before I like to repave my computer 5 or&nbsp_place_holder;6 times a year (don't ask) and reinstalling from DVD isn't going to happen. So I just back it up to my external hard drive and restore it. I also don't keep it in my C:\Program Files directory, because WoW also doesn't behave as a good non-admin app should and insists on writing to its install folder. I keep my WoW installed in C:\World of Warcraft and open up the permissions there to let the auto-updater take care of itself.

But since I don't install WoW from DVD, I don't get the registry keys I mentioned before. Unless I add them manually, I just don't have them at all. (Now, truth be told, I do often have it because I like to use addon updaters like WAU and my PowerShell script that use this key to find the addons folder, but today I didn't happen to have that key in place).

So... the Rupture client keeps claiming it can't find any of my characters. Even after I made sure the addon was installed, launched WoW, logged into one of my characters, etc., as described on the Rupture site. Still nothing. Why? Because it doesn't know where to look. Fine. You know what? There is no way in the settings for me to configure it (bad #3). Nothing. Grrr...

Fine. I'll add the key.

> [HKEY_LOCAL_MACHINE\SOFTWARE\Blizzard Entertainment\World of Warcraft]  
"InstallPath"="C:\\World of Warcraft"

Looks alright to me, eh? Fire up Rupture again (elevated of course). Still no character data!! Thankfully I accidentally discovered a "Show Logs" menu item on the systray icon and there I discovered why. Here's the log: 

> 0] <Plugin>: <Manager> Attempting to load game plugins...  
1] <Plugin>: <Manager> Plugin for <World of Warcraft> loaded.  
2] <Plugin>: <Manager> Loaded 1 plugins successfully.  
3] <Plugin>: <World of Warcraft> Analyzing files: Source[Plugins\World of Warcraft\Addon\] <> Dest[C:\World of WarcraftInterface\Addons\Rupture\]  
4] <Plugin>: <World of Warcraft> Comparing: [C:\World of WarcraftInterface\Addons\Rupture\Rupture.lua: XM+8lK66I2FZOlGSV35qCLEDYjc=] [Plugins\World of Warcraft\Addon\Rupture.lua: XM+8lK66I2FZOlGSV35qCLEDYjc=]  
5] <Plugin>: <World of Warcraft> Comparing: [C:\World of WarcraftInterface\Addons\Rupture\Rupture.toc: qqrZ5X+KXIEZEakyxUqkUB2/ufc=] [Plugins\World of Warcraft\Addon\Rupture.toc: qqrZ5X+KXIEZEakyxUqkUB2/ufc=]  
6] <Interface>: Rupture v1.0.2617.29345 successfully loaded.  
7] <Interface>: CLIENT WANTS TO START UP A NEW THREAD.. THREADCOUNT IS NOW 1  
8] <Interface>: WE ARE UNDER THE LIMIT.. STARTING NEXT THREAD...  
9] <Network>: Analysis complete: no outdated files detected.  
10] <Interface>: CLIENT WANTS TO START UP A NEW THREAD.. THREADCOUNT IS NOW 1  
11] <Interface>: WE ARE UNDER THE LIMIT.. STARTING NEXT THREAD...  
12] <Interface>: Thread finished.. now at queue count: 0  
13] <Interface>: Thread finished.. now at queue count: 0

Do you see it? Look at like #4. There is a path separator missing between the registry key value (yes I forgot to terminate the path with a backslash) and the "Interface\Addons" part. This tells me that they are doing string concatenation to create that path instead of the build in System.IO.Path.Combine() function in .NET (bad #4). Fine. I can fix that too by adding the trailing backslash to my registry key, but at this point if I weren't a geeky .NET WoW junkie I would have completely given up. 

Finally after all of that, I was able to get into the client. 

What I found seemed to be nothing more than a chat client. I didn't see any guild management stuff yet, but maybe that is coming. And I certainly noticed a perf hit on my computer, so I'm guessing they are still working through some issues there. 

At this point my conclusion has to be that it looks interesting but they have a ways to go before I would consider running this on my system day by day. And honestly, I don't need another chat system. I already have too many. 

I'll give it another month or so and try it again. Maybe Shawn or someone else will read this and fix some of this stuff. 
