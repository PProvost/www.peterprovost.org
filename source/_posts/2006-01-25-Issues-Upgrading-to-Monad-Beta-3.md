---
layout: post
title: "Issues Upgrading to Monad Beta 3"
comments: false
date: 2006-01-25 09:49:00
updated: 2008-07-06 19:37:01
categories:
 - Technology
tags:
 - powershell
subtext-id: bd54fcd6-3475-4ef9-b699-dddaac59498c
alias: /blog/Issues-Upgrading-to-Monad-Beta-3.aspx
---


Camey [commented](/archive/2006/01/11/10763.aspx#11053) on my post [Windows "Monad" Shell Beta 3 Now Available!](/archive/2006/01/11/10763.aspx): 

> So now I need to uninstall the earlier release of Monad, but I've already pulled .NET 2.0 Beta off my machine, so it won't uninstall. And the new release won't install over it... arggggg. Do I have to re-install .NET 2.0 Beta, uninstall previous Monad and then uninstall .NET 2.0 Beta, again? What's that gonna do to my current .NET 2.0 installation? 

I checked with some of the folks over on the Monad team and they agreed that while it isn't that pleasant, to uninstall Monad Beta 2, you have to have .NET 2.0 Beta 2 installed. It turns out that the Uninstaller needs it. So, if you have already uninstalled .NET Beta 2, you will not be able to uninstall Monad Beta 2. 

Oops. 

So, if you are in the same situation as Camey, and have already upgraded your .NET runtime, you need to go back to .NET Beta 2 in order to execute the Monad uninstaller. Here is the complete sequence. 

  1. Uninstall .NET&nbsp_place_holder;2.0 RTM
  2. Install .NET 2.0 Beta 2 (see below)
  3. Uninstall Monad beta 2
  4. Uninstall .NET 2.0 Beta 2
  5. Install .NET 2.0 RTM
  6. Install Monad beta 3 

Download Links: 

  * .NET 2.0 Beta 2 - [http://www.microsoft.com/downloads/details.aspx?FamilyID=7abd8c8f-287e-4c7e-9a4a-a4ecff40fc8e&DisplayLang=en](http://www.microsoft.com/downloads/details.aspx?FamilyID=7abd8c8f-287e-4c7e-9a4a-a4ecff40fc8e&DisplayLang=en)
  * .NET 2.0 RTM - [http://www.microsoft.com/downloads/details.aspx?familyid=0856EACB-4362-4B0D-8EDD-AAB15C5E04F5&displaylang=en](http://www.microsoft.com/downloads/details.aspx?familyid=0856EACB-4362-4B0D-8EDD-AAB15C5E04F5&displaylang=en)

Good luck! 
