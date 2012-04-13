---
layout: post
title: "WinKey is Pissing Me Off"
comments: false
date: 2004-11-24 08:33:00
categories:
 - Technology
subtext-id: 107fb498-dfbe-4cac-8cd5-6d4fabb0b7f6
alias: /blog/WinKey-is-Pissing-Me-Off.aspx
---


I've been hooked on [Copernic WinKey](http://www.copernic.com/winkey/) for a while. I use it to launch [Password Minder](http://www.pluralsight.com/tools.aspx), [BlogJet](http://www.blogjet.com/), Internet Explorer, etc. It has been a great tool.

But it does't work very well when you run non-admin. It _works_, in that it launches programs when you press the keys, but it doesn't let you pop up the keystroke editor. When you do, you get an "Error creating system registry entry" popup.

This morning I was finally annoyed enough to bring up [Sysinternals'](http://www.sysinternals.com/) [Regmon](http://www.sysinternals.com/ntw2k/source/regmon.shtml) to figure out what is going on.

It turns out that WinKey is using registry keys in HKEY_CLASSES_ROOT that are transient. It creates them during startup and then deletes them when it is done. So you can't adjust the permissions on a particular key&nbsp_place_holder;to make this program behave (other than opening up HKCR--which I'm not going to do). You can't manually create the missing keys because it will just delete them the next time it is launched.

That is rediculous! And it is pissing me off. That is _not_ what HKCR is for dammit.

Now I'm gonna have to look into writing a new one from scratch unless someone knows of another good free one.
