---
layout: post
title: "BizTalk Visio Stencil SUCKS!"
comments: false
date: 2004-08-12 10:27:00
categories:
 - Technology
subtext-id: da2b2f66-1b1f-42fa-b765-42b71c1b31ff
alias: /blog/BizTalk-Visio-Stencil-SUCKS!.aspx
---


I am very very annoyed. I'm documenting some BizTalk stuff and so I went and downloaded the [BizTalk Server 2004 Orchestration Designer for Business Analysts](http://www.microsoft.com/downloads/details.aspx?FamilyID=C74D08BD-617E-43AC-B303-B6063B929BB3&displaylang=en) thinking that it would provide me with some nice BizTalk shapes to help.

After installing it, it added a new document type for BizTalk orchestrations.

So far so good.

So I opened it up and tried to work with it.

Not so good.

Here are my complaints:

  1. It completely removed a number of the Visio toolbars and menu items and then **_didn't put them back!_** Most specifically, it removed the Actions toolbar and menu items, which I like to use for things like aligning shapes and distributing shapes. It even pulled the Center Drawing command from the menus and toolbars. The commands actually exist, but it pulls the toolbars and menus. [WTFO](http://www.acronymfinder.com/af-query.asp?String=exact&Acronym=wtfo&Find=Find)? 
  2. It doesn't actually install a stencil file that you can use from other documents. It only lets you use the BTS shapes from within a BTS Orchestration Designer document template.
  3. It disables a lot of the right click menus, most notably the ones related to Protecting shapes. You can beat this by going to the shape sheet, but come on, that sucks

I suspect they did this because some of the tools that they disabled cause problems to the code generation and integration stuff in BizTalk/Visio. But what they effectively did was make Visio unusable for what I use it for... drawing pictures.

I tried reinstalling (not uninstalling and reinstalling, but using the "Reinstall" feature of the setup program) but that didn't help. I guess I'll have to try completely uninstalling, rebooting and reinstalling, but I don't have time for that today. Ugh.
