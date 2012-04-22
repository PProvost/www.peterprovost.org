---
layout: post
title: "Windows PowerShell (fka Monad) RC1 Available"
comments: false
date: 2006-04-28 12:59:00
updated: 2008-07-06 10:48:49
categories:
 - Technology
tags:
 - powershell
subtext-id: 01fe3618-65ee-403b-8e10-32c82d4be220
alias: /blog/post/Windows-PowerShell-(fka-Monad)-RC1-Available.aspx
---


You all know that I love Monad, which has now been rebranded "Windows PowerShell". Now you can download RC1 of the best shell ever invented! 

A few important points: 

  * The file extension for scripts has changed from MSH to PS1[1]
  * There are lots of new features, like [custom TabExpansions](http://blogs.msdn.com/powershell/archive/2006/04/26/584551.aspx)!

To get the real story behind all this, and to find the right download links, read [this post on the Windows PowerShell Team blog](http://blogs.msdn.com/powershell/archive/2006/04/25/583344.aspx). 

If, like me, you have a directory full of .MSH files that need to be renamed to .PS1, you can use this little tidbit: 

> gci *.msh | foreach { ren $_ $([System.IO.Path]::GetFileNameWithoutExtension($_.Name) + ".ps1") } 

[1] Yeah, I know, .PS1 seems dumb to me too, but there are lots of reasons why it couldn't (and maybe shouldn't) be something else. Oh wellΓÇª get used to it. 
