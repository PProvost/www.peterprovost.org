---
layout: post
title: "Make Acrobat Load Faster"
comments: false
date: 2003-10-08 21:51:00
updated: 2004-05-01 16:42:00
categories:
 - Technology
subtext-id: dac2652b-53e0-4f8f-8114-10efb72fcb75
alias: /blog/post/Make-Acrobat-Load-Faster.aspx
---


[Robert McLaws points us](http://weblogs.asp.net/rmclaws/posts/31152.aspx) to [this post by Vasanth Dharmaraj](http://www.vasanthdharmaraj.com/PermaLink.aspx?guid=148c6d4a-902b-4803-8372-bf5c543f42e3):

_Here's how to do it:_

  1. _Go to C:\Program Files\Adobe\Acrobat 6.0\Reader (replace the C if you installed on another drive, like I did). _
  2. _Create a new folder called **plug_ins_disabled**. _
  3. _Move all files from the plug_ins folder to the plug_ins_disabled folder except EWH32.api, printme.api, and search.api. There should only be these 3 files in the plug_ins folder. _
  4. _You're done._

Thank├é you. Acrobat just seems to be getting slower and slower.
