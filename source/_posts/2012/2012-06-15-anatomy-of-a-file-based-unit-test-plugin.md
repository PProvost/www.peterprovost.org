---
layout: post
title: "Anatomy of a File-based Unit Test Plugin"
date: 2012-06-15 10:43
comments: true
categories: 
- visual studio
- code
tags:
- visual studio
- unit testing
- javascript
---

{% img right /images/blog/2012-06-15-anatomy-of-a-file-based-unit-test-plugin/Matthews-Blog-Post.png %}

I've been working on a series of posts about authoring a new unit test plugin
for Visual Studio 2012, but today my friend Matthew Manela, author of the
Chutzpah test plugin, sent me [a post he did a few days ago][1] that discusses
the main interfaces he had to use to make his plugin.

The Chutzpah plugin runs JavaScript unit tests that are written in either the
QUnit or Jasmine test frameworks. Since JavaScript files don't get compiled
into a DLL or EXE, he had to create custom implementations of what we call a
**test container**.

<!-- more -->

A test container represents a thing that contains tests. For .NET and C++ unit
testing, this is a DLL or EXE, and Visual Studio 2012 comes with a built-in
test container subsystem for them. But when you need to support tests contained
in other files, e.g. JavaScript files, then you need to do a bit more.

Matthews post does a great job of going through each of these interfaces,
discussing what each is for and what he did for it in his plugin.

{% blockquote Matthew Manela http://matthewmanela.com/blog/anatomy-of-the-chutzpah-test-adapter-for-vs-2012-rc/ %}

The Chutzpah test adapter revolves around four interfaces:

1. ITestContainer – Represents a file that contains tests
2. ITestContainerDiscoverer – Finds all files that contain tests
3. ITestDiscoverer – Finds all tests within a test container
4. ITestExecutor – Runs the tests found inside the test container

{% endblockquote %}

You can read the entire post here:  
[http://matthewmanela.com/blog/anatomy-of-the-chutzpah-test-adapter-for-vs-2012-rc/][1]

And if you want to see the source for his plugin, you can read it all here
(look for the VS11.Plugin folder on the left side):  
[http://chutzpah.codeplex.com/SourceControl/BrowseLatest][2]

Nice post Matthew! Thanks for providing it to the community.

[1]: http://matthewmanela.com/blog/anatomy-of-the-chutzpah-test-adapter-for-vs-2012-rc/
[2]: http://chutzpah.codeplex.com/SourceControl/BrowseLatest
