---
layout: post
title: "WSDL-First Development"
comments: false
date: 2003-09-05 13:41:00
updated: 2004-05-02 22:07:00
categories:
 - Technology
subtext-id: fef3a0ad-b37c-4775-8c0f-9929bb5b44f3
alias: /blog/post/WSDL-First-Development.aspx
---


As [I mentioned yesterday](http://www.peterprovost.org/weblog/PermaLink.aspx?guid=ba5115d0-b5f4-4887-8807-bae152b2692c), I'm trying to get comfortable with [WSDL First](http://www.capescience.com/articles/wsdlfirst/index.shtml) development of web services. Deep down inside it makes sense to me (I come from ATL/COM land so defining my interface first just makes sense to me).

So I went through the [XSD tutorial](http://www.xfront.com/xml-schema.html) I mentioned and made a schema for the CRM project. No problem.

But before tackling a web service that large, I decided to create a little spike solution first to test a couple of things. I tryed in the first WSDL sample from chapter 6 of the O'Reilly book [Web Services Essentials](http://www.amazon.com/exec/obidos/ASIN/0596002246/peterprovosto-20?dev-t=D68HUNXKLHS4J%26camp=2025%26link_code=xm2)├é by Ethan Cerami (pp122-123).

I then used wsdl.exe with the /server flag to produce a base class. Imported it into my project and derived my web service from it. Added the override for the abstract method and pow! I had a working WSDL first web service.

But one thing bugs me... when I ask the .ASMX file for the WSDL, I get something that looks very different from what I started with:

  * Most of the names have changed (not the operations). This doesn't really matter, but it is a difference. 
  * The first time I did this the new WSDL had a  section with a  element that defined the messages. My original├é didn't have this. Then I remembered to copy the attributes from the base class to my code-behind class and that went away. 
  * The binding/soap:binding element now has the style="document" attribute, but my original WSDL had style="rpc" 
  * The binding/operation/soap:operation element now had style="rpc" but my original didn't have a style element at all. 
  * My original WSDL fifn't have a  section. The new one does.

Now I don't think most of these are important, but the "document/rpc" thing has me worried. I think the end result will cause client proxies to produce the same SOAP messages, but I'm not 100% sure.

Has anyone explored this further with a more complicated WSDL? Perhaps one with a ?
