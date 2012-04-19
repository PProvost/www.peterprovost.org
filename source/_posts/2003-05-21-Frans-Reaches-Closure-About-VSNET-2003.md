---
layout: post
title: "Frans Reaches Closure About VS.NET 2003"
comments: false
date: 2003-05-21 14:03:00
categories:
 - Technology
subtext-id: 0d2b8ad4-22cc-44a4-9953-f1164f6b9a25
alias: /blog/post/Frans-Reaches-Closure-About-VSNET-2003.aspx
---


Frans has posted a solution to his earlier rant about VS.NET 2003. Forgot the problem already? Let me recap:

  1. VS.NET 2002 targets .NET 1.0 by default
  2. VS.NET 2003 targets .NET 1.1 by default
  3. If you want to use .NET 1.1, you have to use VS.NET 2003
  4. If you want to use .NET 1.0, you have to use VS.NET 2002

Now numbers 3 and 4 aren't really true, but they may as well be to Mort, who will never figure this out. Here is a summary of the solution:

  1. When you create a new project or open an "old" project in VS.NET 2003, the project will be setup to use the .NET 1.1 runtime. So all of the References will be to .NET 1.1 DLLs.
  2. To get the project back to .NET 1.0 again, remove all of the References to the 1.1 DLLs and add in references to the 1.0 DLLs.
  3. Restart VS.NET to make sure all the old references are really unloaded.
  4. Make sure you use .NET 1.0 compliant code ONLY! The intellisense will mislead you sometimes into using .NET 1.1 calls.

Now, I haven't actually done this myself. I'm still using the side-by-side install method. If someone out there can confirm 100% that this works, please [let me know](mailto:peter@provost.org).

This solution has been mentioned before on many blogs, but the real issue I have is this: Why is it this hard? Why isn't there a project property or a tool that allows us to use 1.0 or 1.1 **easily** from VS.NET 2003?
