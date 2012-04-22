---
layout: post
title: "Just Released - Updater Application Block for .NET 2.0"
comments: false
date: 2006-05-23 06:59:00
updated: 2008-07-06 19:05:48
categories:
 - Technology
tags:
 - patterns & practices
 - .net
subtext-id: 110f7d62-d5f7-492f-a1bc-e8bf49df77a7
alias: /blog/post/Just-Released-Updater-Application-Block-for-NET-20.aspx
---


We are pleased to annouce the release of Updater Aplication Block for .NET 2.0 which includes adjustments to use the latest version of Enterprise Library (January 2006 Release). 

We suggest you should always evaluate ClickOnce as the peferred technology for managing updates on Smart Clients, but there are scenarios where ClickOnce is not applicable (like Windows Services). Based on the feedback received from our community, we've ported UAB into .NET 2.0 to help customers working with these scenarios. No new features have been included though. 

What is in the release: 

  * The code compiles on .Net 2.0 of course :-) 
  * Updater Application Block uses Enterprise Library 2.0 (Jan 2006) for the configuration 
  * Quickstarts migrated to support the new configuration system 
  * Breaking changes only related to configuration and not the Updater API 
  * Bits Downloader now handles broken downloads gracefully (this is a fix to the original implementation) 
  * UpdaterTask serialization fixed. There was a bug on the net 1.1 version of UAB related to the partial update scenario. When some files were removed from the manifest, the UAB serializes the UpdaterTask with the original version of the files. This caused the ApplicationDeployProcessor to fail. 
  * Partial update scenario fixed. 
  * The algorithms that might be used to calculate file hashes are non-keyed hash algorithms like: MD5; RIPEMD160; SHA1; SHA256; SHA384; SHA512 
  * Manifest tool fixed to correctly support salt enabled hashes 
  * The solution assumes you have EntLib installed in your machine to the default location (c:\program Files\...) 

There is no Enterprise Library 2.0 Design time (that's an excercise to the reader), there are still .NET 2.0 compilation warnings and we've only ported the C# version. 

As usual, feedback is very much welcome! 

patterns & practices Client Team 
