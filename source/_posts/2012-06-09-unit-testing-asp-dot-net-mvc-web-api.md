---
layout: post
title: "Unit Testing ASP.NET MVC Web API"
date: 2012-06-09 16:26
published: false
comments: true
categories: 
- visual studio
- code
tags:
- unit testing
- visual studio
---

Information:

* http://weblogs.asp.net/scottgu/archive/2012/02/23/asp-net-web-api-part-1.aspx
ScottGu's post on the topic

* http://www.asp.net/web-api/overview/creating-web-apis/creating-a-web-api-that-supports-crud-operations
This page shows how to setup a POST handler correctly that returns the right
status code and the location URL. This is the actual problem.

* http://www.asp.net/web-api/overview/testing-and-debugging
This page actually has nothing about testing at all, and only one section
about tracing.

* http://www.asp.net/web-api/overview/hosting-aspnet-web-api/self-host-a-web-api
This one talks about config.Routes.MapHttpRoute(...) which we ended up using in
the unit test.
