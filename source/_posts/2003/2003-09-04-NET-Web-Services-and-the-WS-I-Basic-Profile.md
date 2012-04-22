---
layout: post
title: ".NET Web Services and the WS-I Basic Profile"
comments: false
date: 2003-09-04 21:35:00
updated: 2004-05-02 22:07:00
categories:
 - Technology
subtext-id: 625cc712-a4e4-4088-9b70-dc830e3605cf
alias: /blog/post/NET-Web-Services-and-the-WS-I-Basic-Profile.aspx
---


I've spent much of the day using with the [WS-I Testing Tools](http://www.ws-i.org/Testing/Tools/2003/07/WSI_Test_CS_0.96_bin.zip)├é to test a very simple .NET Web Service and I'm surprised by what I'm finding.

My first test was to uncomment the HelloWorld method. I massaged the analyzerConfigBinding.xml configuration file from the WS-I samples directory so that it called my webservice. It passed with flying colors.

The next thing I wanted to try was passing my own classes back from a web service. I creates a fairly complex class model that defined a Contacts class containing Contact objects, each of which has properties like FirstName, Address, etc.

Once again it passes. So far so good. But what about DataSets?

I have seen countless demonstrations by MS people showing DataSets passed to and from web services. While I've never been much of a fan of this myself, I didn't have a good reason other than vague "concerns" about interoperability. It appears that my concerns are well founded as I have not been able to get a DataSet to pass through the WS-I analyzer.

I created a simple Web Method that returned a DataSet. It failed on tests WSI2102, WSI2122, and WSI2703. 

The first test (2102) fails because the  element contains an  element that specifies [http://www.w3.org/2001/XMLSchema](http://www.w3.org/2001/XMLSchema)├é as the namespace. There isn't a valid schema file at that URL. Maybe they meant [http://www.w3.org/2001/XMLSchema.xsd](http://www.w3.org/2001/XMLSchema.xsd)?

The second (2122) and third (2703) tests fail because deep down in the  section of the WSDL, a DataSet is defined as being a sequence of a  followed by . What I think is happening here is that it is telling us that the schema for the dataset will be sent with the dataset itself. This apparently isn't allowed in WS-I Basic Profile. (Now that I write this, I think I understand what InfoPath is complaining about when I tried to have it consume a DataSet from a webservice.)

So plain-jane DataSets are out. What about typed DataSets? I created a simple typed DataSet and dragged the authors table from the pubs database onto it. Modified my web service to return this DataSet and...

BOOM! The analyzer tool chokes on the WSDL and throws an InvalidOperationException during XmlSerializer.Deserialize. One thing to note is that the data set definition has changed from the sequence I descibed above to a sequence containing just an  element with its namespace attribute set to the address of the XSD file for the DataSet. I suspect the WS-I tool is choking either on the  element or on the XSD file. Not sure which at this point.

So, after all of this I think it is safe to say that my original vague feelings about not using DataSets in Web Services was the right thing, even if I didn't have a good reason why. So how does this affect the old "[DataSets vs. Strongly Typed Collection](http://www.mail-archive.com/advanced-dotnet@discuss.develop.com/msg01579.html)" debate? I think it is obvious where I stand.
