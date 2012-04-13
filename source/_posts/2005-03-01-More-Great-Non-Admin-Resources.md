---
layout: post
title: "More Great Non-Admin Resources"
comments: false
date: 2005-03-01 19:23:00
categories:
 - Technology
subtext-id: 2e45d5f3-dc48-47cf-b53a-628ba693bf53
alias: /blog/More-Great-Non-Admin-Resources.aspx
---


I started adding these to the last Geek Notes and realized that they deserve a post all their own.

You should already know who [Aaron Margosis](http://blogs.msdn.com/aaron_margosis) is. If you don't, go read his blog. Read all of it.

Aaron is the guy who brought us [MakeMeAdmin](http://blogs.msdn.com/aaron_margosis/archive/2004/07/24/193721.aspx) and [PrivBar](http://blogs.msdn.com/aaron_margosis/archive/2004/07/24/195350.aspx), two tools I can't recommend highly enough for developers running non-admin (like we all should). He is a frequent contributor to the internal LUA mailing list and recently posted four great pieces to his blog.

  * [Remembering Calculator and Character Map Settings](http://blogs.msdn.com/aaron_margosis/archive/2005/02/09/370264.aspx) - The details of getting this done right. Three registry keys and a reboot. This hack is very cool because it takes advantage of Windows ability to do INI file redirection.
  * [Managing Power Options as a non-administrator](http://blogs.msdn.com/aaron_margosis/archive/2005/02/09/370263.aspx)&nbsp_place_holder;- If you run LUA on a laptop, you're familiar with this one. Until I learned this trick, I had to launch the power applet from an admin console window. But no longer.
  * [Ctrl-C doesn't work in RUNAS or MakeMeAdmin command shells](http://blogs.msdn.com/aaron_margosis/archive/2005/02/09/370266.aspx)&nbsp_place_holder;- Yep. It's annoying as hell, but it doesn't work. As Aaron says, "Use Ctrl-Break instead."
  * [Changing the system date, time and/or time zone](http://blogs.msdn.com/aaron_margosis/archive/2005/02/11/371474.aspx)&nbsp_place_holder;- Only Admins and Power Users can change the system time. Again, laptop LUA users are familiar with this one. You travel to a new city and can't change the time! Or, even more common, is people who double click on the time in the taskbar in order to get the "Windows Calendar Tool". ![](http://www.peterprovost.org/Files/smile3.gif)&nbsp_place_holder;Aaron shows you how to set&nbsp_place_holder; up your system to allow this.

One more thingΓÇª I'm working on an article about a new tool I'm releasing that is basically Aaron's MakeMeAdmin on steroids. Written in C#, it lets you create shortcuts and launch commands in addition to creating an admin console window.
