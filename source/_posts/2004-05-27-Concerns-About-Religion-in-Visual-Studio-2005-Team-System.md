---
layout: post
title: "Concerns About Religion in Visual Studio 2005 Team System"
comments: false
date: 2004-05-27 17:00:00
categories:
 - Technology
subtext-id: 208ecf88-a83b-4d15-98f4-b5f66bb4e787
alias: /blog/Concerns-About-Religion-in-Visual-Studio-2005-Team-System.aspx
---


I am really starting to feel better about what VS2K5TS is bringing to the table, but I still have some concerns. My biggest concern is around "religious intrusion".

Every development organization has a completely different way of doing development. Many of the decisions that are made are&nbsp_place_holder;what I call "religious decisions". By that I mean that there is really no verifiable way to say that this methodology is better than that one, or that TDD is always better than writing tests after the code. I am concerned that these tools will end up with a specific religion that makes assumptions about how we work.

I know that we are being told that all of this stuff is extensible and can be replaced with other 3rd party tools, but sometimes the religion can get tied up in the extensibility model.&nbsp_place_holder;&nbsp_place_holder;This is actually my biggest concern. If the extensibility model is clean and unpolluted by religion, then the community will be able to extend in ways that provide the kind of infrastructure that we need. If the model is not left unencumbered by religion, however, we will find that extending the platform will be next to impossible.

When you have religion you often don't realize the impact it has on the decisions you make. Because it is one of those things where you are actually baffled when you find someone who believes differently...

> _"You do WHAT?" the consultant asked his client..._

As we have seen in the real world, religion is a major cause of conflict between different groups of people. The RUP vs. Agile war is an obvious example in the software development community. It is one of those things where there is no objective "right answer". People are firmly convinced that their belief is the "one true way", but in fact it is subjective opinion.

To illustrate how religion can influence the design of an extensibility mode, consider the current Visual Studio source control API (SCC). The design of this interface makes the assumption that you will be using a lock-edit-commit model for managing your code instead of an edit-merge-commit model. This has a significant impact on the semantics of source control management. For example, it assumes that a file will have its read-only bit set. When you work in something like [Subversion](http://subversion.tigris.org/) or CVS, you don't use operating system file attributes to indicate the state of the file. Rather SVN and CVS use a hidden folder called .svn or .cvs. This and a number of other little things have made it very difficult to implement CVS or SVN Add-Ins for Visual Studio without going completely around the SCC and doing all the work by hand (as [AnkhSVN](http://ankhsvn.tigris.org/) did).

Unless the VS2K5TS team is very careful, the source code issue is just one place of many where this religious intrusion could occur. The integration of methodology and process into the IDE is another obvious place. The testing and reporting frameworks could also be susceptible.

Hopefully they will hear this from more people than just me and will strive to at least keep the extensibility APIs clean.

&nbsp_place_holder;
