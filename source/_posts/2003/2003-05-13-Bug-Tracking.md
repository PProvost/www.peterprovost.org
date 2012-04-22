---
layout: post
title: "Bug Tracking"
comments: false
date: 2003-05-13 11:53:00
categories:
 - Technology
subtext-id: 7fc29eb7-fc29-427d-87a0-8bf0c00f6f6b
alias: /blog/post/Bug-Tracking.aspx
---


[Jesse Ezell](http://dotnetweblogs.com/jezell/) [wrote about a solution his team used](http://dotnetweblogs.com/jezell/posts/6985.aspx) to catch bugs in a produciton application and have them submitted to a bug tracking system. He proposed a tightly coupled solution where the code traps errors and submits them to the bug tracking database. I added this to his comments:

> Another idea would be to use a more generic logging framework like log4net and create a custom Appender that would submit to your bugtracking system. Then when you are in development, you could use ADO.NET, EventLog, or any of the built-in Appenders, but when you go live you can switch to BugTrackAppender with a simple switch in the config file.

I really like [log4net ](http://sourceforge.net/projects/log4net)because of this extensibility. You can create your own appenders any time you need them. Also you can control what level of logging is handled at run time by making changes in the config file. On a project I was working on recently, we had all messages, regardless of severity, logged to a SQL Database so they could be easily monitored by the developers and testers. Once the application went live, we changed it so that only errors were reported and those were sent to the system Event Log. We could just have easily had them submit to our bug tracking Web Service.
