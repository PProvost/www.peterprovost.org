---
layout: post
title: ".NET Command Prompt Here Tip"
comments: false
date: 2003-04-24 10:36:00
categories:
 - Technology
subtext-id: 7e75d82d-bba5-4018-bf83-b74f0e38300a
alias: /blog/NET-Command-Prompt-Here-Tip.aspx
---


Do you use the "Command Prompt Here" trick for opening a command prompt in a particular directory? I use it a lot, but I find that sometimes I want the .NET environment setup. Here is a trick I use.

Create a new file called "dotnetcmd.reg" and paste the following into it:

> Windows Registry Editor Version 5.00
>     
>     [HKEY_CLASSES_ROOT\\Directory\\shell\\dotnetcmd]  
>     @="Open .NET Command Prompt Here"
>     
>     [HKEY_CLASSES_ROOT\\Directory\\shell\\dotnetcmd\\command]  
>     @="cmd.exe /k \"C:\\Progra~1\\Micros~1.NET\\Common7\\Tools\\vsvars32.bat & cd %L\""
>     
>     [HKEY_CLASSES_ROOT\\Drive\\shell\\dotnetcmd]  
>     @="Open .NET Command Prompt Here"
>     
>     [HKEY_CLASSES_ROOT\\Drive\\shell\\dotnetcmd\\command]  
>     @="cmd.exe /k \"C:\\Progra~1\\Micros~1.NET\\Common7\\Tools\\vsvars32.bat & cd %L\""

NOTE: You may have to modify the paths used! Use "dir /x" to find out the short form of any directories you need to navigate thru.

Save the .reg file and double click on it to import it into the registry.

If you've done everything right, you should&nbsp_place_holder; have "Open .NET Command Prompt Here" in the right click menu for drives and folders.

Enjoy!

[Now Playing: Queens of the Stone Age - Queens of the Stone Age]
