---
layout: post
title: "StartupController 1.0"
comments: false
date: 2005-07-29 23:23:00
categories:
 - Technology
subtext-id: ae9ed0a2-ec2d-481f-aab7-e636cc8c7c23
alias: /blog/StartupController-10.aspx
---


Lately I've been doing a number of demos and stuff using my laptop, which means I have to shutdown, undock, go somewhere, boot up, and then wait for all the apps in my Startup folder to load.

Nine times out of ten, I like having my system starup with Outlook, Omea Reader and a number of other apps already running. That way I can boot up, login, go get a coffee and when I get back, everything is ready to go.

But on those times when I'm about to give a demo or just need to boot up to check something really quick, it is really annoying waiting for all those apps to start. Some of them (notably Outlook and Omea) aren't the fastest thing to load. So last night I wrote StartupController. It runs after you login and lets you control which apps, if any, will be started. If you do nothing, they will start after a configurable interval. Here's a screenshot:

![StartupController_v1_0](http://www.peterprovost.org/Files/StartupController_v1_0.png)

It is a pretty simple little app written using .NET 2.0 Beta 2, so you should be able to compile it and use it without any difficulty.

_Usage_

  1. Create a new folder in your Startmenu called StartupController. You can do this easily from a Command prompt with something like this:  
C:\> mkdir %HOMEPATH%\Start Menu\Programs\StartupController
  2. Next, create a shortcut to StartupController.exe and put that in the Startup folder.
  3. Then drag any shortcuts that you want to have managed from the Startup folder into the new StartupController folder. Windows will still launch the ones in Startup when you login and StartupController will handle the ones it its folder.

If you find any bugs or have suggestions, please let me know.

Download [StartupController_v1.0](http://www.peterprovost.org/Files/StartupController_v1_0.zip) (20KB ZIP)
