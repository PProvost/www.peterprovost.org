---
layout: post
title: "Updated NUnit Plugin for VS11 Released"
date: 2012-05-04 11:07
comments: true
categories: 
- Visual Studio
tags:
- vs11
- unit testing
- tdd
---

Good news!! Last night I got an email from Charlie Poole, the maintainer of
NUnit pointing me to a blog post he'd just made:

{% blockquote Charlie Poole http://nunit.net/blogs/?p=123 %}

Today, I’m releasing version 0.92 of the NUnit Adapter for Visual Studio and
creating a new project under the NUnit umbrella to hold it’s source code, track
bugs, etc.
 
In case you didn’t know, Visual Studio 11 has a unit test window, which
supports running tests using any test framework for which an adapter has been
installed. The NUnit adapter has been available on Code Gallery since the
initial VS Developer preview. This release fixes some problems with running
tests that target .NET 2.0/3.5 and with debugging through tests in the unit
test window.

{% endblockquote %}

<!-- more -->
 
This is great news because if you've tried to use NUnit with VS11 Beta before
now, you probably noticed that you couldn't actually run or debug a selected
test or tests. When you tried, you ended up either getting a failed run
or having all tests run. Clearly not good.

The fix was pretty simple, and I want to thank our team for helping find the
issue and also of course thank Charlie for getting it out to customers to 
get them unblocked while using NUnit.

He's also pushed some new content about the plugin:

* [NUnit Test Adapter Project Page][1]
* [Bug Tracker][2]
* [Documentation][4]
* [Updated the VS Gallery page][3]

So if you are experimenting with VS11 and are an NUnit user, be sure to get
this update.

And of course, keep the feedback on VS11 Unit Testing coming!

[1]: http://launchpad.net/nunit-vs-adapter
[2]: http://bugs.launchpad.net/nunit-vs-adapter
[3]: http://visualstudiogallery.msdn.microsoft.com/6ab922d0-21c0-4f06-ab5f-4ecd1fe7175d
[4]: http://nunit.org/index.php?p=vsTestAdapter&r=2.6
