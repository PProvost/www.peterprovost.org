---
layout: post
title: "SQL Load Test Tool"
description : "vsts"
comments: false
date: 2008-07-14 09:44:39
categories:
 - Technology
subtext-id: 8cfa6f90-274d-4adc-bf6f-88da22d30b59
alias: /blog/SQL-Load-Test-Tool.aspx
---


_![](http://blog.svoboda.co.nz/content/binary/VSTS_Logo.gif)Ed. Note - The VSTS Rangers are at it again, this time with a great tool that generates VSTS Unit Tests from SQL Trace files. These tests can be then used as part of a VSTS Load Test. Nice!_

### Project Description 

This tool takes a SQL Profiler trace file and generates a unit test that replays the same sequence of database calls found in the trace file. The unit test is designed to be used in a Visual Studio Load Test. The code generated is easily modifiable so that data variation can be introduced for the purpose of doing performance testing.   
The tool generates code for both Visual Studio 2005 and Visual Studio 2008. The source code is a Visual Studio 2005 project.   
This is a V1 release with some known limitations which are specified in project description. 

### Why Load Test SQL? 

There is a lot of code out there that makes load testing the application very difficult. The most common type is a client application that contains direct database calls. The application however is not structured to allow the business logic to be exercised without the GUI. Another common scenario is a legacy application written in a language such as Visual Basic 6. In cases like these, it can be difficult to load test the application without a GUI test tool, which introduces other disadvantages. GUI test tools are notoriously difficult to use, generally lead to brittle tests and also have limitations in scaling the load injectors sufficiently to exercise the servers.   
This tool offers one possible alternative. You start with using the client application to generate a trace of the SQL statements which typically represent a usage scenario. You can then turn the trace into equivalent ADO.NET code program that can be used in a load test. 

### Tool Description 

The tool generates a Visual Studio 2005/2008 Unit Test from a SQL Server Profiler trace. It extracts all the SQL statements and stored procedure calls from the trace and turns them into a single Visual Studio Unit Test, which can then be configured as a Visual Studio Load Test. The tool does not interact with the database itself when it analyzes the trace and generates the test code. It can therefore be used in "offline" scenarios.   
The generated code needs to be customized to include a connection string to the database under test. That code also includes hooks to allow the user to customize the parameters that are passed to the SQL statements and stored procedures, so that variability can be introduced into the data to prevent caching from producing artificially high performance figures.   
The tool is intended to be used in conjunction with a client program that runs against a database. A trace of the client's SQL Server activity is captured using the SQL Server Profiler. This represents a test scenario, which is then processed by the tool to produce a Unit Test that replays the scenario. 

### More Information, Dowloads and Disucssions

CodePlex Project Home Page - [http://www.codeplex.com/SQLLoadTest](http://www.codeplex.com/SQLLoadTest)
