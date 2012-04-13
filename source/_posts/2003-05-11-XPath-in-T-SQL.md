---
layout: post
title: "XPath in T-SQL"
comments: false
date: 2003-05-11 20:44:00
categories:
 - Technology
subtext-id: 23c146fb-dbc7-454f-9fc2-b39185da7ffa
alias: /blog/XPath-in-T-SQL.aspx
---


After reading [this article](http://www.fawcette.com/dotnetmag/2003_06/magazine/columns/sqlconnection/default.asp), Frans Bouma says...

> _XPath in T-SQL? Don't get me wrong, perhaps there is a way that this is useful, but this sounds like a clash of paradigms to me. XPath is a pattern-matching language, which behaves like a functional language. T-SQL on the other hand is a set-based language. To me these two paradigms are not mixable, like it is hard to mix procedural code with XPath code in an XSL sheet, just because they are two different paradigms: functional (XPath) and procedural (the script). _
> 
> _It's already not that good that T-SQL supports all kinds of middle/gui tier mumbo jumbo like string formatting, while constructions etc, but alas, it's there, you don't have to use these statements, however mixing T-SQL with XPath, as a pillar for the suport for the marketing hit 'XML', I think they've gone a bridge too far. _

I don't agree. The article says "Yukon includes XML as a native SQL Server datatype." To me this implies that I can have a column of type "XmlDocument" (or something like that). Given this, I can imagine that having XPath options in T-SQL could be very useful. 

I have had situations in SQL 2000 where I was storing XML in a column. Depending on its expected length, it may have been text or varchar, but regardless, it was very challenging&nbsp_place_holder; to query the XML document itself. Typically if I knew I was going to need to do that, I would extract those values out into other columns in the table. I didn't like doing it, but there wasn't really another good option. But with XPath in T-SQL, I can imagine writing SQL statements like this:

SELECT * FROM Documents WHERE Documents.data/pubdate/@year = '2003'

[Update] I haven't actually used Yukon yet, so I have no idea if this syntax is valid or not. Anyone out there want to show us some real examples?
