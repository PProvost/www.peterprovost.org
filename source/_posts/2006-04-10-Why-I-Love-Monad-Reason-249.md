---
layout: post
title: "Why I Love Monad Reason #249"
comments: false
date: 2006-04-10 14:37:00
updated: 2008-07-06 19:38:07
categories:
 - Technology
tags:
 - powershell
subtext-id: bce19905-4704-46f5-b64c-ffde6aa1b71e
alias: /blog/Why-I-Love-Monad-Reason-249.aspx
---


I love being able to quickly bust out little scripts like thisΓÇª

> [1] MSH> gci -r -i *.csproj | foreach { $xml = [xml] (get-content $_); write-host $_.Name - $xml.Project.PropertyGroup[0].ProjectGuid } 

And have it produce this outputΓÇª

> Common.csproj - {028E519B-1B04-4D62-A96C-44C3493C4D5A}  
GreeterModule.csproj - {9308450E-0564-4B01-BC1B-9B327C4E1ECF}  
Shell.csproj - {A0DB510A-B00B-464F-A904-CC11A20E0E8A} 

Cool, eh? 
