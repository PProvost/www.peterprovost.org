---
layout: post
title: "Shell Integration for NUnit Console"
comments: false
date: 2004-10-13 11:45:00
categories:
 - Technology
subtext-id: 567438d2-68ed-4285-a745-b75bd132da36
alias: /blog/post/Shell-Integration-for-NUnit-Console.aspx
---


Today I was experiencing some interesting differences between different NUnit test runners.

I wanted to be able to easily right-click on a DLL or EXE and have it run NUnit-Console. I prefer console for this task because it is lightweight and quick. YMMV.

This isn't anything miraculous, but here is the registry tweak I made. Take this, save it to a file with a .reg extension and double-click on it.

NOTES: If your nunit-console.exe is in a different location you may need to edit this. Also, this file is 5 lines of content... the header line, four lines of text and two lines of whitespace.

> Windows Registry Editor Version 5.00
> 
> [HKEY_CLASSES_ROOT\dllfile\shell\Test with NUnit Console\command]  
@="\"C:\\Program Files\\NUnit V2.1\\bin\\nunit-console.exe\" \"%1\" /wait"
> 
> [HKEY_CLASSES_ROOT\exefile\shell\Test with NUnit Console\command]  
@="\"C:\\Program Files\\NUnit V2.1\\bin\\nunit-console.exe\" \"%1\" /wait"
