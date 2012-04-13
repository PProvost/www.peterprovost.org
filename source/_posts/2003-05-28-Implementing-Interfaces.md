---
layout: post
title: "Implementing Interfaces"
comments: false
date: 2003-05-28 11:25:00
categories:
 - Technology
subtext-id: 319e9429-7798-4bd8-9087-cc9462c7b32a
alias: /blog/Implementing-Interfaces.aspx
---


In [this article](http://dotnetweblogs.com/rosherove/posts/7673.aspx), Roy writes:

> When defining a class that implements an interface, instead of just declaring the interface overrides like so:
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; public class MyCustomHandler:IConfigurationSectionHandler
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; {&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; public object Create(object parent, object configContext, System.Xml.XmlNode section)
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; {return null;}
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; }
> 
> you can explicitly prefix the name of the method with the name of the interface and a dot, and removing "public" modifiers from the signature, thus making it look like this:
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; public class MyCustomHandler:IConfigurationSectionHandler
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; {&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; object IConfigurationSectionHandler.Create(object parent, object configContext, System.Xml.XmlNode section)
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; {
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; return null;
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; }
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; }
> 
> This makes for a more readable and explicit code, and states exactly which methods belong to what interface.&nbsp_place_holder;It also saves writing comments&nbsp_place_holder;for when&nbsp_place_holder;their really needed.&nbsp_place_holder;Could be a great way to show coding examples that do not use #region fields (not to mention that some coders don't use VS.NET, and their IDE does not recognize #region fields - this makes the code *tons* more readable)

The thing here is that in C#, these two ways of implementing an interface produce different IL! They are not the same thing. In the second example, the Create() method would NOT be available to an object of type MyCustomHandler. The method is essentially marked as private for the class, but still fulfills the requirements of the interface. But the Create method would be available if you cast your MyCustomHandler to an IConfigurationSectionHandler

Assuming the second example from above, the following code explains what I mean:
    
    MyCustomHandler handler = new MyCustomHandler();  
      
    // The following line is illegal!  
    object bad = handler.Create(...);  
      
    // The following is legal  
    IConfigurationSectionHandler handler2 = (IConfigurationSectionHandler) bad;  
    object good = handler2.Create(...);

BTW, an excellent discussion of this can be found in Chapter 3 of Don Box's [Essential .NET Volume 1](http://www.amazon.com/exec/obidos/ASIN/0201734117/peterprovosto-20).

&nbsp_place_holder;
