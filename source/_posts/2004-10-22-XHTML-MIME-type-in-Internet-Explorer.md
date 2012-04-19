---
layout: post
title: "XHTML MIME type in Internet Explorer"
comments: false
date: 2004-10-22 11:34:00
categories:
 - Technology
subtext-id: 4624fd01-731e-4117-9df1-5b23bf9eaeac
alias: /blog/post/XHTML-MIME-type-in-Internet-Explorer.aspx
---


I was interested in playing around with [XSLTunit](http://xsltunit.org/), which is a unit testing framework for XSLT, but I found that Internet Explorer wouldn't open it. It kept popping up a "Save As..." dialog box. Hmmm...

So I fired up [Fiddler](http://www.fiddlertool.com/fiddler/) to see what the MIME type was that was being sent by the server. It was "application/xhtml+xml" which was a MIME type that I had never seen before. After a bit of googling, I discovered that "application/xhtml+xml" is [the correct MIME type for XHTML files](http://www.xml.com/pub/a/2003/03/19/dive-into-xml.html)!

Although a number of people seem to think that Internet Explorer doesn't support it, the real answer is that it is just missing an entry in the registry to tell it what to do with that MIME type. At least, that is all I had to do to get it to work. (I'm sure some XHTML purist will say that IE is still broken even with this hack, but I don't really care. All I wanted was to be able to browse the XSLTunit web site!)

Here is the registry entry you need to add. Put this into a text file named "xhtml_mime.reg" and double click on it. Then you should be able to view the XSLTunit site (and any others that use the new XHTML MIME type).

> Windows Registry Editor Version 5.00
> 
> [HKEY_CLASSES_ROOT\MIME\Database\Content Type\application/xhtml+xml]  
"CLSID"="{25336920-03F9-11cf-8FD0-00AA00686F13}"  
"Encoding"=hex:08,00,00,00  
"Extension"=".xhtml"

(This was tested on Windows XP SP2, your mileage may vary on other systems.)
