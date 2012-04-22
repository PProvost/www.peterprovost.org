---
layout: post
title: "XPath Querying Over Objects with ObjectXPathNavigator"
comments: false
date: 2003-04-05 10:56:00
categories:
 - Technology
subtext-id: 830243ef-2134-44bf-b3f5-fa203d3d7468
alias: /blog/post/XPath-Querying-Over-Objects-with-ObjectXPathNavigator.aspx
---


In [this article](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnexxml/html/xml03172003.asp), Steve Saxon shows off a very cool bit of code that lets you use XPath to query arbitrary object models. This is a spectacular idea!

What I really like is the idea that we can start thinking about asking questions from our business models using XPath instead of arbitrary code constructs. Additionally, it means that we can imagine using the same XPath query for use on the in-memory representation AND the persisted representation.

Unfortunately, from what I can tell, Steve's code will need some re-working to achieve this. Ideally, his ObjectXPathNavigator class would use the same virtual representation of the XML structure as you would get if you serialized the object using the .NET [XmlSerializer](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemxmlserializationxmlserializerclasstopic.asp). It doesn't seem to do this right now. Which means you may end up with two different XPath queries, depending on what you're doing.

Thinking even further, I would love to see XPath querying in [Yukon](http://www.microsoft.com/sql/evaluation/yukon.asp). I haven't seen it mentioned, but oh would it be nice.
