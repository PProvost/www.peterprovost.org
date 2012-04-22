---
layout: post
title: "Guidance Automation Extensions and Toolkit: June 2006 Release"
comments: false
date: 2006-07-04 11:36:00
updated: 2008-07-06 18:25:49
categories:
 - Technology
tags:
 - patterns & practices
 - software factories
 - gat
subtext-id: 16745be7-b9fd-4462-b073-a750bef27fef
alias: /blog/post/Guidance-Automation-Extensions-and-Toolkit-June-2006-Release.aspx
---


The patterns & practices team is please to announce the availability of the [June 2006 CTP of the Guidance Automation Extensions (GAX) and Guidance Automation Toolkit (GAT)](http://msdn.microsoft.com/vstudio/teamsystem/workshop/gat/)! As [reported previously](http://blogs.msdn.com/tomholl/archive/2006/06/07/GuidanceNavigator.aspx), this is a relatively minor update to the previous December 2005 CTP which includes some important bug fixes and usability improvements. 

**What are GAX and GAT anyway?**

GAX and GAT are really the foundation of Microsoft's Software Factories initative. Software Factories built on these technologies are collections of guidance that help architects and developers build specific types of applications with improved consistency, quality and productivity. This is achieved by integrating _automated guidance_ related to the factory's application scenario deeply into Visual Studio - for example, using templates, wizards, recipes and code generation, along with supporting patterns and architectural documentation. The patterns & practices team is currently working on several Software Factories, including the [Web Service Software Factory](http://practices.gotdotnet.com/svcfactory), [Smart Client Software Factory](http://practices.gotdotnet.com/scbat) and [Mobile Client Software Factory](http://www.gotdotnet.com/codegallery/codegallery.aspx?id=5bef2b5f-476a-488c-8d55-9d41666a36f3). 

The Guidance Automation Extensions (GAX) extend Visual Studio 2005 to provide the core runtime environment for the _guidance packages_ included in these factories. GAX allows you to install and enable a guidance package for a Visual Studio Solution, and it will add the appropriate templates, recipes and wizards to the development environment to make it easy for you to complete tasks, such as adding a service interface or business entity to your web service solution. The new version of GAX also includes a new window called the Guidance Navigator which makes it easy to discover the available guidance and read any related documentation. You must have GAX installed before you can use any guidance packages. 

The Guidance Automation Toolkit (GAT) provides a simple guidance package that lets you author new guidance packages or customize existing guidance packages. This is extremely important, since even though we are working hard to make our Software Factories as relevant as possible, each organization and project is different - so by customizing the&nbsp_place_holder;guidance packages you can ensure that they fully meet your requirements and comply with your architecture and environment. You do not need GAT installed to use a guidance package, but over time it's likely you'll want to customize something so it's definitely worth installing now. 

**Should I upgrade from the previous release?**

Yes - while this is a relatively minor update from the previous December 2005 CTP, it does contain some important fixes and enhancements as [outlined earlier by Wojtek](http://blogs.msdn.com/wojtek/archive/2006/06/06/619445.aspx). Even more importantly, the wave of p&p Software Factories that will be hitting the streets over the next few months will require the new release, so upgrading is definitely recommended. 

Unfortunately it is currently necessary to uninstall any guidance packages you already have installed (including GAT) before you can uninstall the old GAX. You can then install the new GAX and reinstall any guidance packages you want to use. Believe me we know this is a pain (we've gone through this process a lot in our projeccts) - so it's definitely something we'll work to improve in the future. 

**Will existing guidance packages still work with the June 2006 release?**

In general, yes - but there are a couple of tricks you'll need to know. 

First, there are some minor changes in the new version of the T4 text templating engine that we include in this release (it's the same version that's in the June 2006 release of [DSL Tools](http://msdn.microsoft.com/vstudio/DSLTools/)). Depending on how the templates were originally authored, it may be necessary to make minor changes to any included T4 templates so they can run on the new version. In general this just involves adding the declaration <#@ assembly name="System.dll" #> to the top of the file. 

The other thing to watch out for is that the version numbers for the GAX and GAT assemblies have changed. We install binding redirects with the new GAX to enable older guidance packages to redirect to the new versions - but this only works at runtime, not when compiling the source with Visual Studio. So if you open the source of an old&nbsp_place_holder;guidance package with the new GAT/GAX installed, you will need to update your assembly references. 

You can get more details on these issues in the Release Notes installed with GAX. 

**Why is this still a CTP? What's the future of this technology?**

Like the previous releases, this new release is still labeled a Community Technology Preview. This is because the deliverables are still unsupported, and we can't promise to maintain compatibility as we continue to evolve the technologies. Keep in mind that both GAX and GAT are only designed to run on development machines, not production servers, so even if something does blow up, it's not going to blow up your production systems.&nbsp_place_holder;That said, we've gone through the same quality gates with GAT and GAX as we do with any other p&p release, and we are confident we have a high quality release. Since all of our factories will depend on this technology, we need to be! 

We really are very excited by the potential of this technology and of Software Factories, and we are continuing to work on enhancing the infrastructure, authoring environment and the factories themselves. While we don't yet have a solid product plan that we can commit to, we are working to significantly enhance these deliverables and integrate them much more deeply into Visual Studio and Team System. The goal is that eventually most of the capabilities you see in GAX and GAT will be absorbed into Visual Studio. We're going to need your help to figure out what areas we should be focusing on, so expect to hear much more about this work on my blog and on the [Guidance Automation Toolkit Forum](http://forums.microsoft.com/msdn/showforum.aspx?forumid=78&siteid=1). 

[This posting is provided "AS IS" with no warranties, and confers no rights. ](http://www.microsoft.com/mscorp/legal/policy/online_disclaimer.asp)

_Editor's note: This post was copied verbatim from [Tom Hollander's announcement post](http://blogs.msdn.com/tomholl/archive/2006/06/24/645882.aspx). __Since the end of the 2006 fiscal year is upon us (actually past us by the time you read this), you can expect a smattering of announcements from patterns&nbsp_place_holder;& practices._
