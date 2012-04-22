---
layout: post
title: "PDC - PreCon Session - .NET The Smart Client Perspective (Part 1)"
comments: false
date: 2003-10-26 17:53:00
updated: 2004-05-01 16:37:00
categories:
 - Technology
subtext-id: afd2f148-0f08-4410-af12-482615b3a49c
alias: /blog/post/PDC---PreCon-Session---NET-The-Smart-Client-Perspective-(Part-1).aspx
---

Couldn't sleep this morning. With the change in daylight savings time, and me
travelling one hour back, my brain thought it was 8:30AM when it was only
6:30AM. No biggie, I was able to connect to both my work and home email
accounts and make sure I was all caught up.

After a quick breakfast, I headed down to the lobby to catch the PDC shuttle.
Guess what? I just missed it. 15 minute wait...

Big ol' buss shows up and I get on with a few others who (I think) were
speaking Portugese. Not 100% sure, but I don't think it was Spanish. The bus
dropped us off and in I went. Checkin took about 5 minutes. They gave me tons
of crap... a backpack full of crap in fact. (I haven't really looked at it yet.
More on that later tonight.)

Walked about├é a mile inside the LA Convention Center before I found the room
for Chris Sells' PreCon session _.NET - The Smart Client Perspective_. On the
way there, I was surprised to see hundreds of tables with ethernet cables on
them (and switches under them). Very cool. I also saw a bunch of 8 foot tall
towers with 802.11b WAPs on them. Again cool.

Got settled in the PreCon room and spent 5 minutes or so getting my machine up
on the wireless network. (I had it disabled because of a BSOD that happens at
my office.) Right about then [Chris](http://www.sellsbrothers.com/) and
[Rocky](http://www.lhotka.net/) got started.

Chris is an excellent speaker and Rocky plays a good straight guy to Chris'
funny guy. They made tons of jokes about VB (Rocky is a VB guy and Chris is a
C++/C# guy). They started out with a quick introduction to WinForms. They
created a WinForm by hand (as opposed to using the Wizard). Then they explained
the "scary block of code" (the InitializeComponent method that allows the
VS.NET designer to work). Showed events, delegates, etc, etc, blah, blah, blah.
I learned some interesting VB-specific details that I was generally aware of,
but didn't really knowΓÇª specifically using the Handles keyword to hook an
event handler up to an event. Interesting, but I would have to say I'm not a
big fan. I like to have all of my event hookup code in one place so it is easy
for me to find. When you use Handles, you have to scan your code looking for
event handlers (unless you are a point-and-click person, in which case there is
probably some IDE feature to help you here).

Surprisingly, Chris actually said, "I like that stuff," in regards to the
Handles keyword. It is one of those things, like so many things in VB, that
seem like such a nice idea at first, but I really think that it will lead to a
nightmarish mess in projects of any decent size. My two centsΓÇª

That's enough for one post. More in a bit.
