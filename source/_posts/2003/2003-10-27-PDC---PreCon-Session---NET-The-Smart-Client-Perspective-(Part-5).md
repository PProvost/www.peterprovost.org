---
layout: post
title: "PDC - PreCon Session - .NET The Smart Client Perspective (Part 5)"
comments: false
date: 2003-10-27 00:53:00
updated: 2004-05-01 16:33:00
categories:
 - Technology
subtext-id: 6b4ab30c-f6d4-4e86-81e8-2d46949c018d
alias: /blog/post/PDC-e28093-PreCon-Session---NET-The-Smart-Client-Perspective-(Part-5).aspx
---

Rocky finished up talking about remoting with a discussion of Enterprise
Services. The loudest message was unquestionably this:

You really only need Enterprise Services if you need any one of these:

  * Two-phase transactions (e.g. updating two databases, NOT updating two
    tables in one database)
  * Queued components
  * Object pooling (don't really need this unless you are using a database
    that doesn't have connection pooling)
  * Synchronization (who cares)
  * Loosely coupled events (delegates give you enough most of the time)

Most of the time (according to Rocky) you don't need these, so don't worry
about ES. Stay with Remoting or Web Services. I haven't needed ES yet myself,
so this resonates with me.

Then Chris came back up and gave us an intro to no-touch deployment. This is
the classic "Smart Client" stuff that Chris has been telling us about for a
while now. He started with a discussion of hosting WinForms controls in
IE5.01+.├é If you don't know already, it looks like this:

He showed how to hook up events, call methods, and set properties on hosted
controls.

On├é the side Chris mentioned an interesting point. While discussing how
security impacts zero-deployment scenarios he asked, "How does IE know if it is
Local Intanet or not?" I thought it would use the subnet masks for all of my
connected networks, but it doesn't. It turns out that it looks for a period in
the address. Yep, believe it or not that's how it decides. I tested it by
adding an entry to google's IP address to my hosts file. Crazy.

Back to the session, Chris talked about the steps required to give trust to a
.NET assembly (in order to make events work). In his made up scenario, his
grandma needed to give full control to an assembly he was hosting in a web
page, because it exposed an event to the browser's client script. As you know
if you've ever done this, it is NOT something a grandma could do. Not to
mention you're average corporate sysadmin.

Then Chris had Rocky create a Windows Forms app in C# (this was funny for many
reasons if you've been following along). Everyone actually applauded when he
got it to compile and run. :)

As expected, if you've read Chris' articles, he turned on web sharing for the
Debug folder, and hit it with a URL. Then came the big question, "What happens
when you change the application behind the URL?" Rocky did it. It works. Pretty
cool.

Then the next question, "What about security?" Rocky added a line to delete
Chris' boot.ini file. It failed. Again cool. (And expected. Nothing really new
here.)

After that there was some Q&A.; The most important one that I hadn't quite
thought about is that no-touch requires an internet connection to work. If you
want to work online/offline you should use something like th app updater block
and right a regular winforms app.

Off to the .NET Rocks session...

