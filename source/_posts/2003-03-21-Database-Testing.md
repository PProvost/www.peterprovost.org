---
layout: post
title: "Database Testing"
comments: false
date: 2003-03-21 07:41:00
categories:
 - Technology
subtext-id: df3f310d-2491-4952-aaca-486b87ca8a01
alias: /blog/Database-Testing.aspx
---


[This article](http://www.dallaway.com/acad/dbunit.html) is interesting, but I don't think the author has actually had to do much database testing. He proposed 4 different databases and you actually have code that bangs against one of those databases. Sounds like a CM nightmare to me.

What I want to do, but can't because of limitations in the CLR is actually create a Mock ADO.NET Connection object coupled with mock DataAdapter and a mock Command. The problem is with the DataAdapter. While it does implement an interface (IDataAdapter), then problem is that there isn't a generic way to create one from the Connection object.

Let me show an example and you'll understand.

Suppose I'm creating the Save method for my User object with this prototype:
    
    public void Save( IDbConnection&nbsp_place_holder;conn )  
    {  
      // blah blah  
      
      
    }

I can easily generate a Command object, because IDbConnection provides a method called CreateCommand. This means that in my MockDbConnection object, I can have it return a MockDbCommand object when CreateCommand is called.

This is all well and good until my domain code wants to use a DataSet. The ADO.NET way to populate a DataSet is by using a DataAdapter. So if I'm talking to a SQL Server database, I use a SqlDataAdapter class.

But if I'm trying to abstract my database code, I can't "know" what kind of database I'm using. What is needed is for IDbConnection to have a CreateDataAdapter method. The we could write well tested database code.
