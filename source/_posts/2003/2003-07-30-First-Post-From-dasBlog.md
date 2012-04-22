---
layout: post
title: "First Post From dasBlog"
description : "My first dasBlog post... I had to make a few changes to get it working the way I wanted. Nothing serious just a couple of edits."
comments: false
date: 2003-07-30 21:18:00
categories:
 - Technology
subtext-id: 50ba161a-5e05-45c8-920c-817c47217876
alias: /blog/post/First-Post-From-dasBlog.aspx
---


I've been working on [dasBlog](http://www.dasblog.net/) to get it to do what I want for the last hour or so. Nothing too bad, just a couple of simple edits. Here is a summary:

  1. SideBarList.ascx.cs - There was formatting in here (the table cell's align was center) that shouldn't be in the code. It really should be in the stylesheet. 
  2. SideBarOpmlList.ascx.cs - Same as #1 
  3. CategoryList.ascx.cs - Same as #1 
  4. Created a new theme to look like my old Radio theme (modified Movable Radio Blue)

Now that it is all done, I'm going to make the switch over. I'll leave my Radio archive up so the old links will still work. Clemens provided an HttpHandler to help with this, but I haven't dug into that yet. Once I do, I'll pull the old Radio archive too.

So far I have to admit that I love it. Now I can uninstall Radio from my work machine. It has been acting up lately (won't close when Windows shuts down) and I'm looking forward to using dasBlog.

There are a few things that I will miss:

  1. Shortcuts - a very nice tool for frequently used bits of content like other people's blogs 
  2. Stories - when&nbsp_place_holder; you want to write a bit more than belongs in a blog post

Maybe I'll find time to write a patch... we'll see. Another thing I'd like to have is support for nested outlines in SideBarOpmlList.ascx. I'd love to have my blogroll in the same outline structure that I use in [SharpReader](http://www.sharpreader.net/).

Many thanks to [Chris Anderson](http://simplegeek.com) for the original BlogX (which I almost switched to a couple of weeks ago) and to [Clemens Vasters](http://staff.newtelligence.net/clemensv/) for this wonderful blog engine.
