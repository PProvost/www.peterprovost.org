---
layout: post
title: "INI File Redirection When Running Non-Admin"
comments: false
date: 2004-12-19 09:48:00
updated: 2004-12-19 10:51:00
categories:
 - Technology
subtext-id: a9f96ec3-f9e9-4ce3-a259-73a2f77e00dd
alias: /blog/INI-File-Redirection-When-Running-Non-Admin.aspx
---


One of the things that I've noticed running non-admin is all the apps that work, but not always correctly. Two interesting ones that you may not have noticed are the Windows Calculator (calc.exe) and Character Map (charmap.exe).

In Calculator, the problem is that is forgets your current view. As a geek, one of the first things I do is to switch it into Scientific mode. But when you're running non-admin, it never seems to remember this and starts up again in Standard mode. Annoying, but if you aren't looking for it, you may not even notice. After all, you don't get any errors or warnings.

In Charmap there is a similar problem. Before, when running as admin, charmap would remember the last font you had selected in the dropdown list. But when runnning non-admin, it forgets and starts you off with Arial. Once again, you don't get any error messages or warnings, it just doesn't seem to remember.

The reason for both of these failures is that both apps persist their state information into the WIN.INI file. Yes, you heard me right, _the Windows INI file_. This is leftover from the old days of Windows 3.x. Since INI files are located in your Windows installation directory (typically C:\WINDOWS), the app can't write to them because your non-admin account doesn't have write privileges for files in that folder.

But thanks to the wonderful folks on the nonadmin alias (an internal list for discussing non-admin issues and techniques), I now know of a way around this problem. It turns our that since Windows NT, when the registry was introduced, we have had the ability to redirect INI files into the registry. (See [Knowledge Base Article 102889](http://support.microsoft.com/default.aspx?scid=kb;en-us;102889) for the details of how this works.)

So, armed with this information, you can redirect those two apps into your HKEY_USERS registry hive with the following entry. (To use this copy-paste it into Notepad, save it with a .reg extension, and double click on it. You will have to be Admin to make this change!!!!)
    
    Windows Registry Editor Version 5.00  
      
    [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\IniFileMapping\win.ini]  
    "SciCalc"="USR:Software\\Microsoft\\SciCalc"  
    "MSUCE"="#USR:Software\\Microsoft\\CharMap"

&nbsp_place_holder;**Now playing:** [The Breeders](http://phobos.apple.com/WebObjects/MZSearch.woa/wa/advancedSearchResults?artistTerm=The Breeders) - [Drivin' on 9](http://phobos.apple.com/WebObjects/MZSearch.woa/wa/advancedSearchResults?songTerm=Drivin' on 9&artistTerm=The Breeders)
