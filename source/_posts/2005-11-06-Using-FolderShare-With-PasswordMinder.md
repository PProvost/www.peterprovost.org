---
layout: post
title: "Using FolderShare With PasswordMinder"
comments: false
date: 2005-11-06 15:08:00
updated: 2005-11-18 12:20:00
categories:
 - Technology
subtext-id: 5d5793c7-7598-4d7c-b6dd-83c7bbd3cfda
alias: /blog/Using-FolderShare-With-PasswordMinder.aspx
---


If you aren't using [Keith Brown](http://www.pluralsight.com/blogs/keith/default.aspx)'s [Password Minder](http://www.pluralsight.com/tools.aspx) to keep track of all the passwords you use on the 'net, you are crazy. It is the only way to go. Especially when you combine it with a keyboard shortcut tool like [Hot Key Plus](http://www.brianapps.net/hotkeyplus/).

But when you have two computers and you want to keep your password minder files in sync, it can get a tad confusing.

Not so if you use [FolderShare](http://www.foldershare.com/) to keep them in sync. FolderShare is a killer p2p app [recently acquired by Microsoft](http://www.microsoft.com/presspass/press/2005/nov05/11-03FolderSharePR.mspx). Here's how I use it with Password Minder:

  1. Install FolderShare on both of your computers
  2. Move your pwm.xml file into a dedicated folder. I used a folder under My Documents called Password Minder.
  3. Launch Password Minder and tell it to use that pwm.xml file.
  4. Setup FolderShare to sync that folder between your two computers.
  5. Sync to the seconed computer and then tell that Password Minder to use the newly sync'ed file.

Now anytime you make a change to your Password Minder file, _on either computer_, it will be synced across both machines (assuming they are both on and logged in--otherwise they will sync the next time both machines are up). 

BTW, this is also an excellent way to keep your Internet Explorer Favorites folders synced.
