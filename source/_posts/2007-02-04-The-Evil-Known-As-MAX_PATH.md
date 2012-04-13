---
layout: post
title: "The Evil Known As MAX_PATH"
comments: false
date: 2007-02-04 11:58:00
updated: 2007-02-04 11:59:00
subtext-id: 9a6dbfbd-a5d6-4f39-8a78-974aff23cde8
alias: /blog/The-Evil-Known-As-MAX_PATH.aspx
---


I've been working with Tom Hollander and the [Enterprise Library](http://www.codeplex.com/entlib) team on and off for the past two years on an interesting pain point: MAX_PATH. Tom just wrote a [very nice blog post explaining the problem in great detail](http://blogs.msdn.com/tomholl/archive/2007/02/04/enterprise-library-and-the-curse-of-max-path.aspx), so I'll refer you there for the whole thing, but here is the gist of it:

> We've been running into MAX_PATH related errors on and off for some time with our codebase, and we know many of you have as well. The problem mainly manifests itself when compiling the source code inside Visual Studio or msbuild, although you can get it in other situations such as when installing from MSIs or unfolding GAX guidance package templates. At first we assumed that the issue, while unfortunate, was mitigated easily enough by avoiding installing the code into deep root paths. But over time the problem has just gotten worse, and even manifested itself with relatively modest root paths - so we decided we needed to take some action.

And then he shows what we've discovered to be the root cause of the problem: How Visual C# 2005 handles embedded resources.

Here's a tidbit that Tom didn't put in his post though... Visual Basic 2005 does it differently. Visual C# creates filenames for embedded resources that look like this:

> ProjectDefaultNamespace.Folder.Folder.Filename.ext

But Visual Basic skips the "folder" part and does this **_for the same source tree layout_**:

> ProjectDefaultNamespace.Filename.ext

If you think about this, it means it can be very hard to create code that can be easily converted to or from VB and C#. Suppose we have an icon in the [Smart Client Software Factory](http://www.codeplex.com/smartclient) that is set as an Embedded Resource. In C#, its "name" might be "Microsoft.Practices.SCSF.Sample.Images.Folder.bmp" while in VB its "name" could be "Microsoft.Practices.SCSF.Folder.bmp", and any code that references this image by name is not-covertible.

Yuck.
