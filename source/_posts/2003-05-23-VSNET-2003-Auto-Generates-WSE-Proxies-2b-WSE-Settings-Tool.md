---
layout: post
title: "VS.NET 2003 Auto-Generates WSE Proxies + WSE Settings Tool"
comments: false
date: 2003-05-23 09:28:00
categories:
 - Technology
subtext-id: 8c8c64bf-b844-4701-87bb-74fa74c156e0
alias: /blog/VSNET-2003-Auto-Generates-WSE-Proxies-2b-WSE-Settings-Tool.aspx
---


I haven't seen this discussed anywhere, but this is a very nice little feature of VS.NET 2003. Suppose you are using WSE to provide password control for your webservices. According to all of the docs I've seen, when you create the client app, you have to dig down and change the Reference.cs file from:
    
    public class MyService : System.Web.Services.Protocols.SoapHttpClientProtocol

to 
    
    public class&nbsp_place_holder;MyService : Microsoft.Web.Services.WebServicesClientProtocol

The side effects of this are that whenever you choose "Update Web Reference", your proxy class gets regenerated and you have to remember to go make the change again. Bummer.

Not so in VS.NET 2003. Now when you create a web reference, it creates two proxy classes. When I opened up Reference.cs to make the change I was used to making, I found an extra class in there that was already derived from the WSE base class!
    
    public class MyServiceWse : Microsoft.Web.Services.WebServicesClientProtocol  
    {  
      ...  
    }
    
    public class MyService : System.Web.Services.Protocols.SoapHttpClientProtocol  
    {  
      ...  
    }

Very nice! It automatically creates a class that has "Wse" appended to its name that is ready for me to use. Using WSE on the Web Service side was pretty easy before, but using it on the client had this one annoying change that you had to do by hand, every time you updated your web reference. Now it is as easy as it should be.

Also, if you are using WSE in VS.NET you should certainly download and install [WSE Settings Tool for Visual Studio .NET](http://www.microsoft.com/downloads/details.aspx?FamilyId=E1924D29-E82D-4D9A-A945-3F074CE63C8B&displaylang=en). It gives you a nice WSE Settings dialog to control all of the WSE config entries. Here is a screenshot:

![A picture named WSE_Settings.gif](http://www.peterprovost.org/images/myPictures/2003/05/23/WSE_Settings.gif)
