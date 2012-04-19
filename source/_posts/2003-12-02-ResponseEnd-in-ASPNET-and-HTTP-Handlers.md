---
layout: post
title: "Response.End in ASP.NET and HTTP Handlers"
comments: false
date: 2003-12-02 19:54:00
updated: 2004-05-01 15:05:00
categories:
 - Technology
subtext-id: f7df5987-b4b9-4ce6-a5f6-ff5d2ae74750
alias: /blog/post/ResponseEnd-in-ASPNET-and-HTTP-Handlers.aspx
---


I'm currently sitting through the ASP.NET Exposed Roadshow here in Denver and I just saw something on the screen that caught my eye. 

Rob Howard had an ASPX page that was pulling documents out of a database. After putting the content out and writing it back to the Response.OutputStream, he called Response.End. Now this was a nice demo of using File upload into and out of├é a database, but like so many MS demos, it could easily mislead novices. 

Now I seem to recall someone writing somewhere that Response.End (and Response.Redirect for that matter) actually do some very nasty things deep down inside of the .NET runtime. From what I recall, they both cause some pretty nasty stuff to occur deep down inside of .NET (exceptions... forceably terminated threads... etc.) 

The right answer of course, is to use an HTTP Handler (ASHX) file. ASHX files let you create an HTTP endpoint that can return any content type that you want. 

Later on, Ron demoed how to create an image on the fly using ASP.NET. Once again he used an ASPX file instead of an ASHX file. I understand that introducing ASHX files to a group of potential newbies is risky, but I'm really getting tired of running into "experienced" .NET developers who copy the things they see in these demos and put it in production code. 
