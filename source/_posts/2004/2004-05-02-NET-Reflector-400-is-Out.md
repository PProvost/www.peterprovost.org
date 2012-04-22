---
layout: post
title: ".NET Reflector 4.0.0 is Out"
comments: false
date: 2004-05-02 18:32:00
categories:
 - Technology
subtext-id: 6e45548d-4496-409d-8928-e62e98329b20
alias: /blog/post/NET-Reflector-400-is-Out.aspx
---


Lutz Roeder just released version 4.0. Somehow (and I'd love to see thee code) he has one EXE working on all three .NET frameworks. Tres cool. Download it [here](http://www.aisto.com/roeder/dotnet/Download.aspx?File=Reflector.zip).

From the readme file:

> .NET Reflector 4.0 Release Notes
> 
> 28 March 2004  
--------------------------------------------------------------------------------
> 
> Reflector is a class browser for .NET components. It allows browsing and searching the meta data, IL instructions, resources and XML documentation stored in a .NET assembly. Reflector was first released in October 2000 running on .NET Framework 1.0 Beta 2.
> 
> **Code Model:** While previous versions of Reflector partly used the CLR Reflection infrastructure, the new version 4.0 has changed to use a code model library for reading assembly files into memory. As a result Unload and Refresh operations really unload files from memory and Reflector is no longer locking files on disk.
> 
> **Reflector and .NET Framework 2.0:** Reflector.exe runs on all .NET Framework versions. The new code model library loads .NET Framework 2.0 assemblies with no .NET Framework 2.0 installed. However, a Reflector.exe.config file is still going to make Reflector run faster on .NET Framework 2.0.
> 
> **Assembly Cache:** When resolving an assembly reference, Reflector will first search the local path and then falls back to the cache directories defined in the Reflector.cfg file. Reflector doesn't search the GAC unless you add "%SystemRoot%\Assembly" to the cache directories list.
> 
> **Search and Callee Graph:** There is now only one search window (F3). You can click on the icon on the top-right to switch to search members (this was previously called member search). The reference search windows are replaced with a callee graph window that shows any kind of dependencies of a type or member.
> 
> **Command Line:** The /configuration switch allows you to specify a config file different from Reflector.cfg. The /fontsize and /fontname switches can be used to increase the font size for overhead demos.
> 
> **Assembly Versioning:** By default, assembly version numbers are ignored when resolving type and member references. You can enable side-by-side versioning in the options dialog but it is suggested to avoid this if possible.
> 
> **Add-Ins:** Reflector add-ins and hosting projects can be found here. An introduction to the add-in model is available here.
> 
> **WinFX Help:** To view the Longhorn MSDN documentation instead of the .NET Framework MSDN documentation add a [WebSearch] section to your Reflector.cfg file with Msdn="[http://longhorn.msdn.microsoft.com](http://longhorn.msdn.microsoft.com)".
