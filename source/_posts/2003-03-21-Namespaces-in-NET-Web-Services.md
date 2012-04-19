---
layout: post
title: "Namespaces in .NET Web Services"
comments: false
date: 2003-03-21 14:12:00
categories:
 - Technology
subtext-id: 2189b12c-7e2a-4502-bb2b-01fbb54124a3
alias: /blog/post/Namespaces-in-NET-Web-Services.aspx
---


I always forget about these. When you add a new Web Service to your ASP.NET project (I'm assuming you use VS.NET), it uses the default namespace [http://tempuri.org/](http://tempuri.org/). This is just fine as long as two conditions hold:

  1. You don't plan on deploying your Web Service 
  2. You only have one Web Service in your project

Because I keep forgetting this, I always end up fighting&nbsp_place_holder;my Web References.&nbsp_place_holder;ALl of my WDSL files show up, but when you try to reference another&nbsp_place_holder;Web Service, you get a compile error 'cause it only sees one URI! So remember to always define a unique URI for each of your&nbsp_place_holder;Web Services as follows:
    
    [WebService(Namespace="http://www.blah.com/MyProj/MySvc"]  
    public class Items : System.Web.Services.WebService  
    {  
    &nbsp_place_holder;&nbsp_place_holder; // blah blah  
    }

The other Web Service thing that I forget is how to re-enable the .vsdisco file so that you can reference all of the Web Services in one ASP.NET project. To do this, add the following to your web.config file in the system.web section:
    
    <httpHandlers>  
     <add verb="*" path="*.vsdisco"   
     type="System.Web.Services.Discovery.DiscoveryRequestHandler,   
     System.Web.Services, Version=1.0.3300.0,   
     Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"   
     validate="false"/>  
    </httpHandlers>

[Update] I wrapped that to fit in the page, but in my web.config I keep the entire <add> element on one line.
