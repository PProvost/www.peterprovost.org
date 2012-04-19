---
layout: post
title: "Unit Testing Tools in VS.NET 2005 Team System"
comments: false
date: 2004-06-13 15:03:00
categories:
 - Technology
subtext-id: 04f88537-0e00-48bd-a2c3-8d89e62b840f
alias: /blog/post/Unit-Testing-Tools-in-VSNET-2005-Team-System.aspx
---


Apparently when I posted [my petition](http://www.peterprovost.org/archive/2004/06/12/1379.aspx) last night, I wrongly assumed that everyone would know what I was talking about. But Sam commented...

> Uum, I extensively use unit testing in MS VS .NET with NUnit and the NUnit-Addin for VS.
> 
> Does work like charm, what more do you want??

To which I responded

> Sam missed my point entirely. If you've read anything I've written or ever heard me speak, you know I'm a huge fan of both NUnit and NUnitAddin.
> 
> But if MS is going to ship unit testing tools with Visual Studio, then it should be included in all versions. Not just the top tiers. Remove Comment 1399

And then Sam followed up with...

> Peter, yup, I totally don't understand the problem - are there editions of the IDE that don't work with the NUnit-Addin?
> 
> And I never seen anything like Unit-testing from MS, is there something I miss? Remove Comment 1408

So, since Sam was obviously neck deep in work during the Ted Ed blog blitz, let me remind him (and anyone else who still doesn't get it)...

At Tech Ed 2004, Microsoft annouced&nbsp_place_holder;a new set of Visual Studio 2005 versions called "Team System." These versions of Visual Studio will ship with all kinds of interesting new productivity tools that were formerly known by their codename "Burton". These include:

  * Unit Testing
  * Static Analysis
  * Work Item Tracking
  * Performance Analysis
  * Enterprise-level Source Control (not Source Safe)
  * Data warehousing
  * Full lifecycle/methodology integration
  * Etc.

It was made very clear by all of the Team System people that I spoke to that the Visual Studio SKUs would be like a Russian doll, where each version up the chain has everything from those versions below, plus more. This is how the Visual Studio product line works now, so it isn't really all that surprising that it will continue. 

So we can expect that the product family will look something like this:

  * Visual Studio 2005 Academic
  * Visual Studio 2005 Professional
  * Visual Studio 2005 Enterprise Developer
  * Visual Studio 2005 Enterprise Architect
  * Visual Studio 2005 Team System for Developers
  * Visual Studio 2005 Team System for Testers
  * Visual Studio 2005 Team System for Project Managers
  * Visual Studio 2005 Team System for Architects

But understand that according to what we were told at Tech Ed, these new features will only ship with the top four (Team System) versions of the product. I was told quite clearly that&nbsp_place_holder; they will not ship with the versions that most people use today (Enterprise Architect). They will not ship with the version that students use today (Academic). They may not be included in the version that comes with your MSDN Universal subscription -- although I think they relaize that doing that will have a significant impact on their adoption curve. So they may give us VS2K5TS for Architects in MSDN Universal, but still make us pay for the Foundation Server (the source control and central data warehouse stuff).

Hopefully that clarifies why I said what I said in [the original post](http://www.peterprovost.org/archive/2004/06/12/1379.aspx). Please link to it if you agree with it. Since the product release is still&nbsp_place_holder;probably a&nbsp_place_holder;year away, perhaps we can influence the powers that be. We'll see.
