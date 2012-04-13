---
layout: post
title: "I Want InfoPath"
comments: false
date: 2003-03-06 20:18:00
updated: 2004-05-05 14:31:00
categories:
 - Technology
subtext-id: bd56fa62-236f-431e-ac6b-08dd5184b289
alias: /blog/I-Want-InfoPath.aspx
---


I keep reading more and more stuff about InfoPath (formerly XDocs), especially on Don Box's weblog. The problem I'm having now is that I don't feel like waiting anymore!

  * _When you design a form based on an XML&nbsp_place_holder;Schema,&nbsp_place_holder;and fill out that form later, the&nbsp_place_holder;document that you'll save&nbsp_place_holder;will be&nbsp_place_holder;a pure XML document instance of the exact underlying schema, without any other goo. InfoPath will only associate the instance with itself by injecting a processing instruction. _
  * _InfoPath understands XML Schema type restrictions, validates them and gives you red frames on fields that are wrong. It spell-checks and gives you red squiggles for misspelled words. It gives you repeating edit regions for arrays of complex types. It gives you date pickers for dates. It gives you combo-boxes for enums. _
  * _When you "export" a form template (whose native storage format is, inexplicably, binary), you will find an XSLT innocently hanging out in your output directory. That stylesheet is capable of rendering an XML instance of the underlying schema to a proper DHTML page that is visually (and functionally) equivalent to the form you've designed. _
  * _You can submit a filled out form to a file or to a web service; however, most importantly, you can submit to a Windows Scripting Host script (JScript/VBScript). Which means that you could smuggle (for instance) a COM/Interopped managed pipeline underneath it (think WSE) that will wrap the payload into an envelope and add all the current and essential web services stuff to it. Or you could submit to a disconnected message queue&nbsp_place_holder;on a client and have a server do the processing for forwarding your data into a service-oriented bus. Or you could drop stuff into BizTalk._

> [[CraigBlog](http://staff.develop.com/candera/weblog/)]
