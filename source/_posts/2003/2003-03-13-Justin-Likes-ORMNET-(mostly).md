---
layout: post
title: "Justin Likes ORM.NET (mostly)"
comments: false
date: 2003-03-13 21:28:00
updated: 2004-05-05 14:42:00
categories:
 - Technology
subtext-id: 4f8070d6-a9f7-451e-b9be-038ca9a09fc7
alias: /blog/post/Justin-Likes-ORMNET-(mostly).aspx
---


It seems that Justin and I are on the same track again...

> [_Yet Another O/R Tool_](http://pinetree-tech.com/weblog/archives/2003/03/13.shtml#yet_another_or_tool)_. _
> 
> _In my quest to find an O/R tool, I have spent some time with the O/R tool called _[_ORM.NET_](http://www.olero.com/OrmWeb/)_. Unlike other toolkits that have you annotate your code with attributes or generate an XML mapping file, ORM.NET actually generates the code that will become your data access layer. _
> 
> _Now the reason I looked at this toolkit is because of their FetchPath construct. Basically FetchPath allows you to state which objects should be returned in the query. So using the examples I've been using, I could pass in something like this - FetchPath.LineItem.ServiceRequest.Lot. And this would instruct the code that is generated to return LineItems, the parent service requests, and the parent lots. The cool thing about it is that the FetchPath is a params parameter. So I can pass in multiple FetchPaths as long as they are related to the root object (LineItem in my example) or in one of the objects returned. _
> 
> _So it looks like it does what I want. But it does too much. There are some relationships in my tables that I don't want exposed. For example, we have the concept of a security context that can contain other sub-objects. I have foreign keys on these context columns and therefore ORM.NET generates code for them. And I can't seem to find a way to remove those "Parents". _
> 
> _But given that the DB schema I'm working off of is several years old and has had many, many hands touch it. I wasn't expecting a clean layer to be generated. But I probably would consider it for other projects that I'm working on. _
> 
> _[_[_News from the Forest_](http://pinetree-tech.com/weblog/)_]_

I'm lucky enough to spend most of my time working on greenfield applications, so this tool may be better suited to what I'm doing. As I said a couple of posts back, I'll let you know what I decide.
