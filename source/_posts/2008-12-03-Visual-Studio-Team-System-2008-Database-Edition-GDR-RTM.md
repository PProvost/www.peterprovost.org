---
layout: post
title: "Visual Studio Team System 2008 Database Edition GDR - RTM"
comments: false
date: 2008-12-03 09:26:14
categories:
 - Technology
tags:
 - vsts
 - database
subtext-id: e1e8ca09-39ad-470b-bd5a-8e3d5ac5dfa6
alias: /blog/Visual-Studio-Team-System-2008-Database-Edition-GDR-RTM.aspx
---


In case you missed it yesterday, the Visual Studio Team System 2008 Database Edition GDR shipped yesterday!

Here's a snippet from [Gert Drapers' announcement post](http://blogs.msdn.com/gertd/archive/2008/11/25/visual-studio-team-system-2008-database-edition-gdr-rtm.aspx) on his Data Dude blog:

> Although the name "GDR", which stands for "General Redistribution Release", implies otherwise, this really is a complete new release, based on a new architecture. We have taken the architectural changes from the Rosario project (Visual Studio Team System 2010) and rolled them forward in time. Rolling forward these changes help us align the GDR release with the upcoming Visual Studio Team System 2010 release and provide numerous new features and extensibility points in this release. If you would compare the GDR release with the "Visual Studio 2005 Team Edition for Database Professionals" or "Visual Studio Team System 2008 Database Edition" you will agree this is a completely new product! 
> 
> ### The key architectural changes
> 
>   * Model based architecture - Everything underneath the covers is based on a true model representation of the SQL Server schema. This facilitates a true offline declarative database development system where the source code defines the shapes of the schema objects. 
>   * Models are implemented by Database Schema Providers, DSP's for short. - The introduction of a provider model enables multiple things at once. First of all the decoupling of release vehicles. For example when SQL Server will release a new version or adds new functionality in a service pack, like they did in SQL Server 2005 SP2 when adding "vardecimal" support, we can simply update an existing provider or provide a new one in case of a new SQL Server release. Overtime we will go to a model where the SQL Server providers will be an integral part of the SQL Server release. The provider model is also a key extensibility point, allowing 3rd parties to extend database project ecosystem and add support for other database platforms in Visual Studio Team System 2010. 
>   * Tool extensibility - In this release external tool writers have full access to the T-SQL parsers (for SQL Server 2000, 2005 and 2008), the SQL Script DOM and the schema model (when inside Visual Studio). This adds on top of the ability to write extend the tools inside the platform. You can extend T-SQL refactoring by writing your own refactoring types (operations) and refactoring targets; add T-SQL Static Code Analysis rules, data generators, data distributions and test conditions. Database Projects (.dbproj) now provide a truly extensible declarative database development platform. 
>   * Separation of BUILD and DEPLOY. - The separation of build & deploy makes it possible to deploy the output of your database project to many different targets and different points in time. Build now produces a single artifact file hat describes the schema inside your database, called a .DBSCHEMA file. This file is used by the deployment engine to deploy your schema. 
>   * Standalone Deployment Engine. - The inclusion of a standalone and [redistributable](http://blogs.msdn.com/gertd/archive/2008/08/22/redist.aspx) deployment engine makes it possible to deploy the output of your database projects (.DBSCHEMA files) to a target database without the need of having Visual Studio Team System Database Edition installed. This enables key scenarios like the inclusion of database schema deployment as part of your application installation. 
> 
> All these architectural changes enable many new usage scenarios and interesting new features.

Many, many congrats to the team!
