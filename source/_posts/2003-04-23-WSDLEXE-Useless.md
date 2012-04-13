---
layout: post
title: "WSDL.EXE Useless?"
comments: false
date: 2003-04-23 15:06:00
categories:
 - Technology
subtext-id: b3ffcd4c-af10-4dd6-9b4d-9f3f336e1b93
alias: /blog/WSDLEXE-Useless.aspx
---


Apparently [a lot of people think so](http://www.gotdotnet.com/team/dbox/default.aspx#nn2003-04-22T05:52:21Z)...

> _Run the .NET Framework SDK's WSDL.EXE against a WSDL file with the /server command line._
> 
> __&nbsp_place_holder;
> 
> _Simon Fell asks "_[_what am I supposed to do with it?_](http://www.pocketsoap.com/weblog/2003/04/1220.html)_"_
> 
> __&nbsp_place_holder;
> 
> _Alas, the feature is practically useless as it sits today. Here are two options (short of the obvious "edit the generated sources as text"):_
> 
> __&nbsp_place_holder;
> 
>   1. _Write some CodeDOM code to munge the intermediate result into something you actually can use. You can do this by invoking the WSDL generation code programmatically and/or by writing a WSDL importer extension and looking for the use of server-mode. _
>   2. _Combine #1 with the new C# partial classes feature that doesn't ship until whidbey. _
> 
> __&nbsp_place_holder;
> 
> _I'll ping _[_Yasser_](http://www.dotnetweblogs.com/yassers/)_ and _[_Tim_](http://www.gotdotnet.com/team/tewald/)_ to see if we have something laying around the shop._

It may be less than ideal, but the way I used it was to create the .cs file. Add it to my project, derive my ASMX code-behind file from the new class and (the bad part) re-add the [WebMethod] attributes. Sure, it would be better if I didn't have to redo the attributes, but that is about all I had to do...

If Don finds any better tools that let us skip these extra steps, it would be nice, but honestly it wasn't that much work.
