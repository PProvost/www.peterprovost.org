---
layout: post
title: "CodeSmith 2.1.1270 Released"
comments: false
date: 2003-06-24 19:06:00
categories:
 - Technology
subtext-id: f4c00388-0f52-477d-8e68-4ee4b5bb5437
alias: /blog/CodeSmith-211270-Released.aspx
---


Here is a list of some of the changes for this release. 

  * Added designers for TableSchemaCollection, CommandSchemaCollection, and ViewSchemaCollection.&nbsp_place_holder; These types can now be used as properties in the GUI and in the VS.NET custom tool. 
  * Added ability to select multiple root folders in CodeSmith Explorer. 
  * Enabled the maximize button on the explorer and generator forms. 
  * Included the awesome C# collection templates built by Chris Nahr. 
  * Made it so that if you had a previous selection the schema explorer designers will automatically select that item. 
  * Added CustomProperties sample.&nbsp_place_holder; This sample demonstrates using the XmlSerializer to deserialize an object and use it as a property. 
  * Added ExtendedProperties collection to all schema objects.&nbsp_place_holder; These can be used to hold any custom data. 
  * Made SqlSchemaProvider populate all extended properties from SQL 2000 into the ExtendedProperties collection on each schema object. 
  * Made SqlSchemaProvider populate five additional extended properties on each column: CS_IsIdentity, CS_IdentitySeed, CS_IdentityIncrement, CS_IsRowGuidCol, and CS_Default. 
  * Added CommandText property to the CommandSchema object.&nbsp_place_holder; This can be used to get the code for the command. 
  * Added IsDependantOf method to the TableSchema object.&nbsp_place_holder; This will determine if a given table is a dependant of another table by crawling the ForeignKey heirarchy. 
  * Added TableDependancyComparer class.&nbsp_place_holder; This can be used to sort tables in order of dependancy. 
  * Made all Schema Explorer designers remember their last selected data source. 
  * Added IsPrimaryKey, IsUnique, and IsClustered properties to IndexSchema. 
  * Added DateCreated to TableSchema, ViewSchema, and CommandSchema. 
  * Added support for Debug attribute in the CodeTemplate directive.&nbsp_place_holder; This must be set to true before you will be able to debug your templates. 
  * Added error handling to CodeSmithConsole and changed it to return a non-zero number if it fails. 
  * Added typed DataSet sample template and test application (TypedDataSetTester).&nbsp_place_holder; These are a work in progress but I am hoping to get feedback. 
  * Implemented the Equals and GetHashCode methods for each schema object.&nbsp_place_holder; Equals will now check for value equality instead of reference equality. 
  * Click [here](http://www.ericjsmith.net/codesmith/history.txt) for a complete list of changes.

[[From Eric J. Smith's Weblog](http://weblogs.asp.net/ericjsmith/)]
