---
layout: post
title: "VirtualPC Default Folder"
comments: false
date: 2004-09-01 14:48:00
categories:
 - Technology
subtext-id: bab873af-1784-4c4a-bd39-9a00f596f535
alias: /blog/VirtualPC-Default-Folder.aspx
---


I just found this gem (again) and didn't want to lose it this time.

If you don't like that Virtual PC uses C:\Documents and Settings\<profile>\My Documents\My Virtual Machines as the default location for its Virtual Hard Disk files, then you need to do this:

  1. On the host computer, right-click My Computer, and then click Properties. 
  2. Click the Advanced tab, and then click Settings under Environmental Variables. 
  3. Under System variables, click New. 
  4. In the Variable Name box, type myvirtualmachines. 
  5. In the Variable Value box, type the path of the folder that you want to use. 
  6. Click OK two times, and then close the Computer Management window.

That's it!

(Taken from [MSKB](http://support.microsoft.com/default.aspx?scid=kb;en-us;831506))  

