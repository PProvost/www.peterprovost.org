---
layout: post
title: "BizTalk 2004 Schema Compiler Bug"
comments: false
date: 2004-08-03 13:36:00
categories:
 - Technology
subtext-id: 1a044229-e999-4066-95a3-507e7b1dc080
alias: /blog/post/BizTalk-2004-Schema-Compiler-Bug.aspx
---


[Bob Brumfield](http://weblogs.ilg.com/brumfieldb/) and I spent about 4 hours yesterday fighting, identifying and then documenting a bug in the BizTalk 2004 Schema Compiler.

Here's the gist of the matter:

You have a schema project called Bug.Demo.btproj and the namespace called Bug.Demo. In the project, create a folder called Bug. So the namespace for items in that folder is Bug.Demo.Bug, which should be a legit .NET namespace.

To that folder, add a schema called Foo. Then add another one called Bar. Open Bar in the BTS Schema editor. Add an XSD Import that references Foo.

Compile.

BLAMMO!

Now go read [Bob's post](http://weblogs.ilg.com/brumfieldb/archive/2004/08/02/425.aspx) for more detail and screenshots.
