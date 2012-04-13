---
layout: post
title: "PDC - NUnitAddin"
comments: false
date: 2003-10-30 01:15:00
updated: 2004-05-01 16:29:00
categories:
 - Technology
subtext-id: f1b9fa96-aec7-40da-b32d-2fd9356275a0
alias: /blog/PDC---NUnitAddin.aspx
---


I was in an Avalon session when Jamie Cansdale IMed me asking if I'd like to get together to play with NUnitAddin. We'd talked about doing that a few days ago and I wasn't going to miss this opportunity so I bailed out and we went to find a table.

The other night Jamie had shown me his new version (not release yet) and also shown me a bunch of things that I hadn't seen before. Let me be honest, I hate the NUnitGui that ships with NUnit. The new version (2.1) is slower. And I hate having to jump out of the IDE to run my tests.

So we started out by running a simple set of NUnit tests. Cool. Then Jamie showed me how to debug them. Better. Then he showed me how to launch ANY method in ANY class (as long as it has a default constructor). Very cool.

Then he showed me "The Goods." We has added handlers that pickup special values that you can pass to the second parameter of Debug.WriteLine. There are a number of them and they do things like:

  * Dump an object as XML using XmlSerializer
  * Dump an object as XML using SoapFormatter
  * Dump the IDL for the call stack of an exception
  * Dump all the properties of an object graph
  * More...

To find these, call Debug.WriteLine( "", "_help" ) and you will get help.

Here's the best part... this all works with the current shipping version of NUnitAddin. The next version adds things like configuration sections to completely control the integration with the IDE, a tool panel that shows a tree of your NUnit tests, IDL dump in the editor window, and more.

Jamie is doing some absolutely amazing stuff here and he and I are going to write an article about all soon.

So we were doing all this and suddenly Scott Wiltamuth (Product Unit Manager for Visual C#) and Anders Hejlsberg (inventor of C#) show up and ask to see what we are so excited about. So I gave them a demo of all the stuff Jamie had just shown me (I probably should have let Jamie give the demo, but I made it VERY clear that I had nothing to do with this code, I just wanted to write about it).

Scott sat quietly through it all and seemed impressed. He asked some excellent questions at the end and then talked to Jamie more away from me (job? new product feature?).

Anyway, I knew NUnitAddin was cool, but I didn't realize how cool it was. Many thanks to Jamie for taking the time to show me all of it... oh and for giving me a copy of the next version... :)
