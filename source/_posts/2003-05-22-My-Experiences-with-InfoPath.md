---
layout: post
title: "My Experiences with InfoPath"
comments: false
date: 2003-05-22 10:10:00
categories:
 - Technology
subtext-id: 836e349c-8969-4adc-8cd1-bfff462fcd25
alias: /blog/My-Experiences-with-InfoPath.aspx
---


Hmmm... interesting product. I'm a bit disappointed in its lack of support for WebServices created by VS.NET. Perhaps someone can enlighten me?

I've been through [Richard Caetano's tutorial](http://www.stronglytyped.com/Articles/ABetterXMLDataEditor.html) and it works just fine for submitting a dataset to a webservice, but what about reading it back? Every time I try to create an InfoPath form that is setup to read from a webservice created with VS.NET, I get this error:

_"InfoPath does not support XML data files with inline schemas. To use the inline schema, create a separate XML Schema that only includes the inline schema information. You can then use that XML Schema as the data source for a new form template."_

I understand what the error is saying, but it doesn't make sense that InfoPath can't read from VS.NET webservices **out-of-the-box**.

I'm sure I'm just missing something here. I await enlightenment...
