---
layout: post
title: "Annoying VS.NET Bug"
comments: false
date: 2004-04-13 15:46:00
updated: 2004-05-01 11:15:00
categories:
 - Technology
subtext-id: 6ad4a0ed-c7b4-498a-a4ef-eb329a4dbeb2
alias: /blog/Annoying-VSNET-Bug.aspx
---


OK this is a bug. Flat out. A bug. 

Here's the deal. 

[Subversion](http://subversion.tigris.org),├é which is my new favorite source control system, creates a hidden folder when you do a checkout called ".svn". And for some reason, VS.NET will not tolerate a folder that begins with a period in a web project. 

It works fine for Class Library projects. It works fine for Windows Forms projects. But when you use a Web Project, it says, "Refreshing the project failed. Unable to retrieve folder information from the server." 

And to make matters worse, this is a [known bug](http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&oe=UTF-8&threadm=018901c370ad%2467041600%24a301280a%40phx.gbl&rnum=1&prev=/groups%3Fhl%3Den%26lr%3D%26ie%3DUTF-8%26oe%3DUTF-8%26q%3D%2522Refreshing%2Bthe%2Bproject%2Bfailed.%2BUnable%2Bto%2Bretrieve%2Bfolder%2Binformation%2Bfrom%2Bthe%2Bserver.%2522). I hate things like this. There is absolutely no good reason for this rule. 
