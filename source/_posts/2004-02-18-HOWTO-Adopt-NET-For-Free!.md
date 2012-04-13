---
layout: post
title: "HOWTO: Adopt .NET For Free!"
comments: false
date: 2004-02-18 20:45:00
updated: 2004-05-01 14:10:00
categories:
 - Technology
subtext-id: 606b1161-b3d0-4ed2-9814-f2d8c51a8e2c
alias: /blog/HOWTO-Adopt-NET-For-Free!.aspx
---


I spent most of today at the Microsoft Community and Technology Leaders Roundtable. It was a good event. I sat with [Brad Wilson](http://dotnetguy.techieswithcats.com/), [Kathleen Dollard](http://www.apress.com/book/bookDisplay.html?bID=212), [Andy Smith](http://weblogs.asp.net/asmith/) and a number of other cool people. In addition to the local .NET geeks, there were a number of Java guys and during the discussion Scott Ryan, President of the [Denver BEA Users Group](http://www.denverbug.org/), asked why they can do Java development for free, but people can't do .NET development for free. 

I responded that of course you can do .NET development for free! 

We talked further because I wanted clarification. He wasn't just looking for the .NET SDK, but for the whole enterprise development platform. Apparently (and I'm trusting him on this) you can just download Web Sphere or BEA Weblogic and DB2 for development purposes. He said that the license is limited to development only and expires in a year, but it is available for people who want to test drive the technology. 

To which I responded again, you can do that in .NET too! Although I will admit the licenses aren't always quite so good. 

I promised him that I would post a list of links to the products I mentioned, so here goes: 

  * [Microsoft .NET SDK 1.1](http://www.microsoft.com/downloads/details.aspx?FamilyId=9B3A2CA6-3647-4070-9F41-A333C6B9181D&displaylang=en)├é - Provides everything developers need to write, build, test and deploy .NET 1.1 code. This is the bare minimum requirement to do .NET development for free.
  * [Microsoft SQL Server 2000 120-day Evaluation](http://www.microsoft.com/sql/evaluation/trial/default.asp) - Sure it isn't a 1-year license, but 120 days should be more than enough to get started. If you would rather not have the 120-day limitation, you can download and use [MSDE 2000 Release A](http://www.microsoft.com/sql/msde/downloads/download.asp) for free! Be aware though that it has a connection limit and is missing full-text indexing so it won't work for all production situations. Also, you may need an administration console for MSDE, since it doesn't ship with one (see below).
  * [Microsoft Windows Server 2003](http://www.microsoft.com/windowsserver2003/evaluation/trial/evalkit.mspx) - If you are using the full blown version of SQL Server, then you may need an operating system to install it on. (MSDE will install on almost any operating system that .NET will install on so you don't need this for MSDE.) This one is a 180-day evaluation version, but it should work for you to get started.

At this point you really do have the full enterprise environment "top to bottom". But what you are missing is some of the core developer tools that make your life easier. Here are a few to get you started. 

  * [Visual Studio .NET Trial Edition](http://msdn.microsoft.com/vstudio/productinfo/trial/default.aspx) - As far as I know, you can't download this, but you can order a copy of this 60-day trial version.
  * [SharpDevelop](http://www.icsharpcode.net/OpenSource/SD/) - Want a rich IDE but don't want to pay for VS.NET? Check out the open-source SharpDevelop IDE.
  * [Eclipse](http://www.eclipse.org/) - Most Java developers are familiar with the Eclipse IDE and now there are at least one [Eclipse Plugin for C#](http://www.improve-technologies.com/alpha/esharp/). I don't know if there are any for VB.NET, but I would be very surprised if Java developers are interested in VB.NET.
  * [Sql Buddy](http://sqlbuddy.sourceforge.net/) - If you choose to use MSDE and don't want to do your database management from the SQL prompt, you will need an administrative console. This one has gotten good reviews and looks fairly complete, although I will admit that I haven't used it. For a complete list of MSDE tools, check out [this excellent list](http://sastools.com/b2/post/79394219).
  * [NAnt](http://nant.sourceforge.net/) - If you need a good build engine, you don't need to look farther than this port/rewrite of the famous [Ant](http://ant.apache.org/) build tool. (Although I do know of one unnamed developer who used Ant with .NET and reports good results.)
  * [NUnit](http://www.nunit.org/) - Originally a straight port of [JUnit](http://www.junit.org/index.htm), this has evolved into a unit test harness like none other. It takes full advantage of .NET features that are unavailable in other platforms. Very recommended.
  * [CruiseControl.NET](http://www.continuousintegration.net) - If you are looking for a build server tool, ThoughtWorks has ported [CruiseControl](http://cruisecontrol.sourceforge.net/) to .NET. We use it and it works nicely.
  * [Log4Net](http://log4net.sourceforge.net/) - Yeah, yeah... another port of an excellent open-source Java product. If you need a logging framework (and you do), then don't look any further than this.
  * [FxCop](http://www.gotdotnet.com/team/fxcop/) - This tool, provided my Microsoft for free, is a code analysis tool that checks compiled .NET code for conformance to the Microsoft .NET Framework Design Guidelines. Don't like their rules? You can write your own.
  * [Nullsoft Scriptable Installer](http://nsis.sourceforge.net/home/) - You need to deploy your application, right? This toolkit makes the smallest installers I've ever seen. And it is free! If you decide to use it, I would suggest [HM NIS Edit](http://hmne.sourceforge.net/) as an IDE.
  * [.NET Reflector](http://www.aisto.com/roeder/dotnet/) - The coolest tool in my .NET toolbox, this will allow you to analyze and decompile any .NET assembly you want. A must have for figuring out what is going on inside the framework sometimes.

Enough? Have I convinced you that you can do .NET development for free? I decided not to bother telling you all about [vi](http://www.vim.org/) and [emacs](http://www.gnu.org/software/emacs/windows/ntemacs.html), 'cause who wants to go back to that, right? :) 

├é 

If you need an even more comprehensive list of tools for .NET, I would recommend [Sharp Toolbox](http://sharptoolbox.madgeek.com/). They have the most comprehensive list of tools you will find anywhere. 
