---
layout: post
title: "Asynchronous Web Service Calls"
comments: false
date: 2003-03-26 20:22:00
categories:
 - Technology
subtext-id: 823aedbc-c803-44e5-bf87-f559ab32c447
alias: /blog/post/Asynchronous-Web-Service-Calls.aspx
---


I'm often surprised how few people know how to do async web service calls. People get stuck doing it the obvious way (i.e., synchronous) because that is what VS.NET makes you think is the right answer. But what do you do if the web service you're calling is very slow? That is where making async calls comes into play.

When you create a WebReference in VS.NET it creates a nice little proxy class for you that contains methods that correspond to those defined in the web service's WSDL file. For example, lets assume that you have a web service called **MySvc** and a method called **GoSlow** that takes no parameters and returns a string. To make a sync call to this method, you would write code like this:
    
    private void CallSvc()  
    {  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; MySvc svc = new localhost.MySvc();  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; string result = svc.GoSlow();  
        // Do something else...  
      
      
      
      
      
      
    }

Wouldn't it be nicer, however, if you could do the "Do something else..." code _at the same time_ as the **GoSlow** call? Well it actually isn't a whole lot harder than the previous code. You use something called a **WaitHandle**.
    
    private void CallSvcAsync()  
    {  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; MySvc svc = new localhost.MySvc();  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; IAsyncResult asr = svc.BeginGoSlow(null, null);  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; // Do something else...  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; asr.AsyncWaitHandle.WaitOne();  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; string result = svc.EndGoSlow(asr);  
    }

Now you can do the two things in parallel. If you are making slow web service calls from an ASP.NET client, this is probably the best way to go. With ASP.NET pages, you typically need to have the result of the web service call in order to send the response to the client.

If you are creating a service or a WinForms application, you also have the option of using callback delegates. You do have to play thread games because the callback cannot be called in the context of the thread that made the original **BeginGoSlow** call. If you need to use this technique, check out [this article on MSDN](http://msdn.microsoft.com/library/en-us/dnservice/html/service09032002.asp).
