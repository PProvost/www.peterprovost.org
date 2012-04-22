---
layout: post
title: "XML Schema Validation with ASP.NET WebMethods"
comments: false
date: 2003-06-27 14:28:00
categories:
 - Technology
subtext-id: 5351637e-bdb7-45ff-a7b3-991940f99334
alias: /blog/post/XML-Schema-Validation-with-ASPNET-WebMethods.aspx
---


In this article on MSDN, Aaron Skonnard and Dan Sullivan show how to extend ASP.NET to support schema validation of SOAP messages. They go much farther than most people would think to go. Very nice work.

I actually needed something like this a few months ago... to bad this hadn't been written yet. I ended up using the [XmlElement parameter trick](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnservice/html/service04162003.asp) and then performed the validation myself.
