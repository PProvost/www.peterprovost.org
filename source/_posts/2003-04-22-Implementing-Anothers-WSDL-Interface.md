---
layout: post
title: "Implementing Another's WSDL Interface"
comments: false
date: 2003-04-22 18:38:00
categories:
 - Technology
subtext-id: 1761e180-b185-40b0-a952-d2bd8a015e3d
alias: /blog/post/Implementing-Anothers-WSDL-Interface.aspx
---


Today I ran across something I'd never had to do before. I had a WSDL file that I had to implement in my own webservice project. By reading the WSDL, I was pretty sure that I could create it by hand, but I was worried about whether it would really be the same thing or not.

I figured that there&nbsp_place_holder;had to be a way to do this in .NET and of course there is. The WSDL.EXE tool has an option that will create an abstract base class for a given WSDL. If you need to use this, it is simple:
    
    C:\> wsdl.exe /server MyService.wsdl

This example will produce a .cs file called MyService.cs that contains an abstract class called MyService that has abstract methods for each method defined in the WSDL file. Nice stuff.
