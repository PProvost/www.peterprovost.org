---
layout: post
title: "Non-Admin Problems with The Regulator"
comments: false
date: 2005-03-02 13:59:00
updated: 2005-03-02 13:23:00
categories:
 - Technology
subtext-id: 0eddcba5-4bdb-4eb1-85c7-fd06681c1912
alias: /blog/post/Non-Admin-Problems-with-The-Regulator.aspx
---


Today I needed&nbsp_place_holder;to quickly check out a nasty regular expression for a&nbsp_place_holder;project I'm working on.&nbsp_place_holder;I've used [Roy Osherove's Regulator](http://regex.osherove.com/) before and always been impressed by it, so I went and grabbed the most recent version.

Installed as Administrator of course, but then I launched it as a non-admin (of course). I got this error dialog:

![Regulator_Error1](http://www.peterprovost.org/Files/Regulator_Error1.png)

Oops. I pressed OK and the app came up just fine. (Actually the error dialog was obscured by the "Always on top" splash screen, which made it kinda hard to click, but as a keyboard guy I figured it out.)

So I closed it. And got this errorΓÇª

![Regulator_Error2](http://www.peterprovost.org/Files/Regulator_Error2.png)

Now both of those errors are obvious LUA problems. Writing to a settings file in C:\Program Files is a no-no. Settings belong in your user profile (C:\Documents and Settings\Username) or in HKLM, not in the app install folder.

Interestingly there is another error in the app. When I run it LUA and try to maximize it, I get an "Object Reference Not Set" exception thrown by an overridden WinProc. I'm not sure what is going on in there, but it ain't good. For the record, when I run the app an as Administrator it works just fine.

Let this be a reminder to all of you to **at least test your app as non-admin**. Even better, unless you absolutely can't, **do all of your development as non-admin**.

UPDATE: Apparently [Roy knows about this already](http://weblogs.asp.net/rosherove/archive/2004/12/03/273979.aspx) and is working on a fix. Hurry up man! ![](http://www.peterprovost.org/Files/smile2.gif)

**Now playing:** [A Perfect Circle](http://phobos.apple.com/WebObjects/MZSearch.woa/wa/advancedSearchResults?artistTerm=A Perfect Circle) - [Blue (Remix)](http://phobos.apple.com/WebObjects/MZSearch.woa/wa/advancedSearchResults?songTerm=Blue (Remix)&artistTerm=A Perfect Circle)
