---
layout: post
title: "Programming Active Directory with the System.DirectoryServices Namespace"
comments: false
date: 2003-08-11 01:46:00
categories:
 - Technology
subtext-id: e68fcbfc-ba8f-4dde-b85d-7dcd24fb6900
alias: /blog/Programming-Active-Directory-with-the-SystemDirectoryServices-Namespace.aspx
---


Since I haven't been assigned to a project yet since starting with Interlink Group, I've been doing a lot of technical sales and internal projects. A couple of days ago, one of our network engineering guys asked me to help him port a VB6 application to .NET. After looking at it for 10 minutes I realized that I didn't want to port it to VB.NET, I wanted to rewrite it from scratch. He didn't really care, he just needed me to make a few changes. If it was in C# or VB.NET he didn't care.

Basically the application needed to change the password every day on the local machine's Administrator account to a predictable, but difficult guess value. A separate application is used by the helpdesk person to generate the same password given the machine's name and the date. Simple.

I'd dabbled with Active Directory Services from .NET before, but hadn't done anything real. So this would be fun.

As I produced my first [Solution Spike](http://c2.com/cgi/wiki?SpikeSolution) in about an hour. I had a bunch of things to learn. Most important was how to use the Invoke method of the DirectoryEntry object.

This method lets you make direct method calls on the underlying ADSI interface. The reason&nbsp_place_holder; you have to do this is that the guys who created DirectoryEntry didn't give us a full implementation. I don't know why. But they did give us the Invoke method.

You need the invoke method to do a number of things such as changing a user's password, getting a list of groups that a user is in, and adding a user to a group.

Here is a quick example of how to use the Invoke method from C#:
    
    public void SetPassword( DirectoryEntry entry, string password )
      
    {
      
       entry.Invoke("SetPassword", password );
      
    }
    

Invoke is defined as follows:
    
    public object Invoke( string methodName, params object[] args );

So in C# all parameters after the first parameter will be converted into an object array. This nice little C# feature lets us do this:
    
    public string SetDescription( DirectoryEntry entry, string description )
      
    {
      
       entry.Invoke( "Put", "Description", description );
      
    }
    

You'll notice that setting the description is different that setting the password. That is because IADsUser defines Description as a string property (hence the "Get" and "Put" method names) while SetPassword is a method. To see the full list of IADsUser methods and properties, refer to [MSDN](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/netdir/adsi/iadsuser.asp).

Once I wrapped the DirectoryEntry with a helper class to do all of this for me, writing my service and the help desk application was a snap.

(OK, it was a little more that a "snap", but that is because I got carried away with the [goldplating](http://c2.com/cgi/wiki?GoldPlating). A implemented a [strategy pattern](http://c2.com/cgi/wiki?StrategyPattern) and a [factory](http://c2.com/cgi/wiki?AbstractFactoryPattern) so I could sub out the password generation logic and/or the rename algorithm later. Oh well, sometimes we get carried away.)
