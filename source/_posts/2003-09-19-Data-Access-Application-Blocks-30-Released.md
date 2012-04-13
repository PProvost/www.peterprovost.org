---
layout: post
title: "Data Access Application Blocks 3.0 Released"
comments: false
date: 2003-09-19 21:17:00
updated: 2004-05-02 09:32:00
categories:
 - Technology
subtext-id: 36601a7c-0e18-4e13-813c-54029394b59a
alias: /blog/Data-Access-Application-Blocks-30-Released.aspx
---


It looks like MS has finally acknowledged the core flaw in ADO.NET. Here's the deal...

In [System.Data](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemdata.asp) there are the following interfaces:

  * [IDbConnection](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemdataidbconnectionclasstopic.asp)
  * [IDbCommand](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemdataidbcommandclasstopic.asp)
  * [IDataReader](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemdataidatareaderclasstopic.asp) (why it isn't IDbDataReader I don't know)
  * [IDbDataAdapter](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemdataidbdataadapterclasstopic.asp)
  * etc...

The nice thing about this is that you should be able to program against the database transparently, right?

WRONG!

Here is the core problem:

IDbConnection doesn't have a CreateDataAdapter method. So there is no way to "know" which kind of Data Adapter to use given only an IDbConnection. This sucks. You can call IDbConnection.[CreateCommand ](http://msdn.microsoft.com/library/en-us/cpref/html/frlrfsystemdataidbconnectionclasscreatecommandtopic.asp)to get a command object. From the command object you can get a data reader. But to fill a DataSet you are hosed.

Well, if you haven't already written your own factory code, the [new Data Access Application Block](http://www.gotdotnet.com/community/workspaces/newsitem.aspx?id=c20d12b0-af52-402b-9b7c-aaeb21d1f431&newsId=1304) is out and they have done it for you. It looks pretty good at first glance but I haven't banged on it hard.

I can't believe we have to go through all of that just because the ADO.NET team forgot one method...

(Found the DAAB 3.0 via [Fabrice's Weblog](http://weblogs.asp.net/fmarguerie/posts/28256.aspx).)

PS. This is the first bit of code I've seen come out of MS that has and [NUnit](http://www.nunit.org/) test harness with it. Very cool. Keep it up.
