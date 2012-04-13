---
layout: post
title: ".Net Shortcuts + Automate GAC and COM operations using this Cool Add-in"
comments: false
date: 2003-06-17 09:32:00
updated: 2004-11-11 17:45:00
categories:
 - Technology
subtext-id: 9570b9a4-5e88-4bc6-889c-77de41b85631
alias: /blog/Net-Shortcuts-2b-Automate-GAC-and-COM-operations-using-this-Cool-Add-in.aspx
---


Thanks [Roy](http://weblogs.asp.net/rosherove/)...

> Date: 6/2/2003  
Author: [Enrico Sabbadin](mailto:esabbadin@vb2themax.com)  
Versions: VS.NET Level: Advanced   
File Size: 315K [download](http://www.devx.com/vb2themax/CodeDownload/19802)  
  
Summary: This add-in for VS.NET 2003 automatically:  
&nbsp_place_holder; 1) Registers the assembly in the GAC right after it has been built.  
&nbsp_place_holder; 2) Exports types to COM: produces the type library (and registers it if specified) .. as tlbexp.exe does.  
&nbsp_place_holder; 3) Registers classes in the registry ..as regasm.exe does.  
&nbsp_place_holder; 4) Avoids the bulding of an Assembly if its read-only attribute is set.  
&nbsp_place_holder; 5) If a build fails, it stops the build process for the remaining assembly in the solution.  
You configure the Add-in behaviour for your VS.NET project by placing appropriate entries in the section of the project app.config file. 
> 
> ----------------------------------------------------
> 
> Date: 5/26/2003  
Author: [Enrico Sabbadin](http://www.sabbasoft.com/netutilities.htm)  
Versions: .NET Level: Advanced   
File Size: 4K [download](http://www.devx.com/vb2themax/CodeDownload/19801)  
  
Summary: This registry file adds the following entries to the Windows Explorer's context menus, that will help you speed your development and test cycle:  
1) .idl files : Build : run midl.exe against the idl file top produce a type library from it.  
2) .dll files: register/unregister COM dll using regsvr32, register .NET assembly in the GAC, register .NET assembly for COM Interop (regasm.exe), register .NET assembly for COM Interop using the codebase switch (regasm.exe /codebase), register/unregister COM EXE.  
3) .tlb files : use regtlib to register a type library.  
4) Any directory: Open a DOS console and sets required PATH and INCLUDE environment variables (runs vsvar32.bat).

Updated 2004-11-11: Fixed broken links.
