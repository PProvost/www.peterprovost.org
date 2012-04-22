---
layout: post
title: "P&amp;P Composite Application Guidance for WPF"
comments: false
date: 2007-11-13 08:21:00
updated: 2008-07-06 19:23:00
categories:
 - Technology
tags:
 - wpf
 - cab
subtext-id: d687def9-a50b-4f4e-ae26-e6e8b7fd2bd1
alias: /blog/post/Pamp3bP-Composite-Application-Guidance-for-WPF.aspx
---


I completely forgot to blog this a couple of weeks ago, but Glenn Block, Product Manager for our UX/Client work, recently announced our plans for providing guidance (ala Composite UI App Block) for WPF applications. 

A few important things from Glenn's post for those familiar with CAB and our other assets in this space: 

> **What is WPF Composite Client?**
> 
> This is not a&nbsp_place_holder; new version of CAB . It is an entirely new&nbsp_place_holder; set of&nbsp_place_holder; libraries and guidance,&nbsp_place_holder; built from the ground&nbsp_place_holder; up, targeting development of new WPF Composite applications.&nbsp_place_holder; We'll be working with both the UIFX and WPF teams, the same people who build the platform. 
> 
> We are&nbsp_place_holder; not discarding everything that we did in the client space and starting from scratch. We've done a lot of work around patterns such as Modularity (composition), Services, Dependency injection, Event Brokering,&nbsp_place_holder; etc.&nbsp_place_holder; These concepts are&nbsp_place_holder; essential for&nbsp_place_holder; building Composite applications&nbsp_place_holder; and we will carry&nbsp_place_holder; them forward&nbsp_place_holder; into the new guidance.&nbsp_place_holder; However, you should expect their manifestations to be very different than what&nbsp_place_holder; you see today in CAB.&nbsp_place_holder; We're not changing the APIs for fun. We think there are&nbsp_place_holder; numerous compelling reasons&nbsp_place_holder; to do so: 
> 
>   1. **CAB was not built to support WPF.**&nbsp_place_holder; While you can get a n&nbsp_place_holder; application to work in WPF&nbsp_place_holder; using some flavor of CAB , you can't make use of WPF's full functionality. WPF is an inherently different paradigm than WinForms. For example,&nbsp_place_holder; RoutedEvents in WPF are entirely different than WinForm Events. Controls in WPF are look-less while in Win Forms controls have a specific look and feel, etc. 
>   2. **WPF does not offer the "Drag" and "Drop" Win Forms development experience.** CAB&nbsp_place_holder; development scenarios depend upon the rich tooling and productivity experience provided by Visual Studio.&nbsp_place_holder; The WPF developer experience is entirely different&nbsp_place_holder; and incompatible.&nbsp_place_holder; We feel that customers&nbsp_place_holder; will not succeed in mechanically migrating their existing WinForms applications to WPF&nbsp_place_holder; and should not try. There are no upgrade wizards&nbsp_place_holder; such as the VB6 to VB.NET migration tools.&nbsp_place_holder; The transition from WinForms to WPF requires substantial effort and most developers face a steep learning curve. For these&nbsp_place_holder; reasons, the new offering&nbsp_place_holder; will not focus on migration scenarios. 
>   3. **We've learned.** Over the years we've&nbsp_place_holder; received&nbsp_place_holder; great&nbsp_place_holder; feedback , positive and negative,&nbsp_place_holder; on&nbsp_place_holder; our CAB implementation.&nbsp_place_holder; We've heard&nbsp_place_holder; many times&nbsp_place_holder; that&nbsp_place_holder; it&nbsp_place_holder; is too heavy,&nbsp_place_holder; too complicated, too tightly coupled, too hard to grasp, etc.&nbsp_place_holder; Acropolis evaluators have provided new insights and suggested new approaches. We think the best way to address the concerns and tackle the new ideas -- perhaps the only way -- is with a clean break.&nbsp_place_holder;
>   4. **Win Forms is not dead.** I've actually had emails from customers saying that Win Forms was being retired this year . This myth must be dispelled. Win Forms&nbsp_place_holder; is very much alive and there are future investments in Win Forms yet to come. Win Forms is the recommended breadth solution for LOB application development for the foreseeable future. 

Read the rest of Glenn's post here: [http://blogs.msdn.com/gblock/archive/2007/10/26/wpf-composite-client-guidance-it-s-coming.aspx](http://blogs.msdn.com/gblock/archive/2007/10/26/wpf-composite-client-guidance-it-s-coming.aspx)

Technorati Tags: [P&P](http://technorati.com/tags/P&P/) , [CAB](http://technorati.com/tags/CAB/) , [WPF](http://technorati.com/tags/WPF/)
