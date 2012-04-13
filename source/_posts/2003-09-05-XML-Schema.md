---
layout: post
title: "XML Schema"
comments: false
date: 2003-09-05 15:57:00
updated: 2004-05-02 22:06:00
categories:
 - Technology
subtext-id: dfb01727-d1ad-41dd-b057-a5f4f3838265
alias: /blog/XML-Schema.aspx
---


I finally got around to watching the Don Box SOA videos ([here](http://msdn.microsoft.com/msdntv/episode.aspx?xml=episodes/en/20030827SOAPDB/manifest.xml) and [here](http://msdn.microsoft.com/msdntv/episode.aspx?xml=episodes/en/20030902SOAPDB/manifest.xml)) that were recently posted to MSDN TV. Having just gone through the [XSD Tutorial](http://www.xfront.com/xml-schema.html) that I [mentioned earler](http://www.peterprovost.org/weblog/PermaLink.aspx?guid=ba5115d0-b5f4-4887-8807-bae152b2692c), I was very interested to hear him talk about RELAX NG.

From the [RELAX NG home page](http://www.relaxng.org/):

> RELAX NG is a schema language for XML. The key features of RELAX NG are that it:
> 
>   * is simple 
>   * is easy to learn 
>   * has both an XML syntax and a compact non-XML syntax 
>   * does not change the information set of an XML document 
>   * supports XML namespaces 
>   * treats attributes uniformly with elements so far as possible 
>   * has unrestricted support for unordered content 
>   * has unrestricted support for mixed content 
>   * has a solid theoretical basis 
>   * can partner with a separate datatyping language (such W3C XML Schema Datatypes) 

Hmmmm... interesting. I have to agree with Don that XSD is a beast of an abstraction that is probably much more that we really need, but whatcha gonna do?

How about write your XML Schemas in RELAX NG and convert them to XSD using [Trang](http://www.thaiopensource.com/relaxng/trang.html)?

I'll have to give it a try...
