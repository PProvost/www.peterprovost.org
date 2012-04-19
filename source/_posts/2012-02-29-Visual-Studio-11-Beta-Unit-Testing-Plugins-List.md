---
layout: post
title: "Visual Studio 11 Beta - Unit Testing Plugins List"
comments: true
date: 2012-02-29 15:20:10
updated: 2012-03-09 11:58:59
categories:
 - Technology
 - Agile Software Development
tags:
 - vs11
 - agile development
 - tdd
subtext-id: 6d18f777-4887-46bd-94be-8d7d212cf5cb
alias: /blog/post/Visual-Studio-11-Beta-Unit-Testing-Plugins-List.aspx
---


One of the things I'm really proud of in the new Visual Studio 11 developer experience is the investment we made in developer and unit testing. We first started talking about this back at the //BUILD/ conference, and since then have spent a lot of time working with community partners to get them ready for the Beta release today.

I'm very happy, therefore, to be able to highlight the frameworks & test runners that have shipped support for VS11 Beta. (More to come, see below.)

<!-- more -->

**_.NET_**

  * Visual Studio Managed Unit Testing Framework (aka MS-Test) 
    * Information: [http://aka.ms/mstest-dev11](http://aka.ms/mstest-dev11)
    * Built-in to VS11 
  * xUnit.net 
    * Information: [http://xunit.codeplex.com/](http://xunit.codeplex.com/)
    * Download: [http://aka.ms/xunit-vs11](http://aka.ms/xunit-vs11)
  * NUnit 
    * Information: [http://nunit.org/](http://nunit.org/)
    * Download: [http://aka.ms/nunit-vs11](http://aka.ms/nunit-vs11)
  * MbUnit 
    * Information: [https://github.com/Gallio/Gallio-VS2011-Integration](https://github.com/Gallio/Gallio-VS2011-Integration)
    * Download: [http://aka.ms/mbunit-vs11](http://aka.ms/mbunit-vs11) (GitHub download, not on VS Gallery yet) 
    * Notes: You must first install Gallio from [http://gallio.org/Downloads.aspx](http://gallio.org/Downloads.aspx) for this adapter to work

**_HTML/Javascript_**

  * Javascript - Chutzpah for QUnit & Jasmine 
    * Information: [http://chutzpah.codeplex.com/](http://chutzpah.codeplex.com/)
    * Download: [http://aka.ms/chutzpah-vs11](http://aka.ms/chutzpah-vs11)

**_C++_**

  * Visual Studio Native C++ Unit Testing Framework (aka MS-Test Native) 
    * Information: [http://aka.ms/mstest-native-vs11](http://aka.ms/mstest-native-vs11)
    * Built-in to VS11 

I will be maintaining this list as more come online, so please stay tuned. If you have one, or know of one, either in-development or released, please let me know.
