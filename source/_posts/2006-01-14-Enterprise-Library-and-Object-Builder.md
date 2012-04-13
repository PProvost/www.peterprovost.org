---
layout: post
title: "Enterprise Library and Object Builder"
comments: false
date: 2006-01-14 14:52:00
updated: 2008-07-06 19:09:43
categories:
 - Technology
tags:
 - patterns & practices
 - entlib
 - objectbuilder
subtext-id: ba73c9ac-ee67-49db-915f-fa67075fcd6a
alias: /blog/Enterprise-Library-and-Object-Builder.aspx
---


While finally catching up on blogs I read, I ran across Brian Buttons recent post titled [Enterprise Library and Object Builder](http://www.agileprogrammer.com/oneagilecoder/archive/2006/01/03/10564.aspx). Whether you are using CAB, EntLib or Object Builder directly you should go read his post, as it is full of all kinds of nuggets. For example: 

> The way OB can tell whether or not to treat an instance of a singleton or not is through ObjectBuilder concepts called Locators and LifetimeContainers. LifetimeContainers, in OB-speak, manage the lifetime of named instances of objects. You can register an object and its name with a LifetimeContainer, and it will keep that object alive until such time as you dispose of the LifetimeContainer. And every LifetimeContainer is associated with a Locator. A Locator acts as a dictionary that maps instance names to objects, but it does it using WeakReferences -- this means that storing something in a Locator will not prevent that object from being GCed. Tot keep an object alive, you need to provide the LifetimeContainer as well, which is what keeps the references in use, preventing the object from being scavenging out of existence. 

Good stuff. 
