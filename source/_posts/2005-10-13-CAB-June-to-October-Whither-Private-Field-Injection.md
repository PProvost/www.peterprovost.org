---
layout: post
title: "CAB June to October: Whither Private Field Injection?"
comments: false
date: 2005-10-13 20:45:00
updated: 2008-07-06 19:20:28
categories:
 - Technology
tags:
 - cab
 - .net
subtext-id: 710a468f-dd4d-4701-9601-69270bc091f4
alias: /blog/CAB-June-to-October-Whither-Private-Field-Injection.aspx
---


As I'm sure you can imagine, we were given lots of feedback from the June CTP of CAB. One of the things we heard about, both from within MS and from outside folks, was that doing manipulation of private fields or properties was bad and that we shouldn't support doing dependency injection into privates. 

Additionally, in .NET&nbsp_place_holder;the permission that allows private reflection&nbsp_place_holder;is limited&nbsp_place_holder;to only those assemblies running with Full Trust. Which means that those running in the LocalIntranet or Internet zones can't do it. It also turns out that [private reflection causes a pretty severe performance hit](http://hyperthink.net/blog/CommentView,guid,14736081-2589-474a-b867-85fa1c33f4d7.aspx). 

So we decided to go to public injection only. 

This led us to the question about whether to support fields at all. According to the [.NET Framework Design Guidelines for Class Library Developers](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconfieldusageguidelines.asp), it is recommended that fields not be exposed publicly to better enable versioning and maintenance of the class. Instead, it is recommended that if the data is meant to be get/set from outside the class it should be wrapped in a property. So as a result, we decided to discontinue support for field injection. 

But what about those times when you don't want the property to be set by users of this class? How do we allow for injection of it, while not allowing unwanted manipulation of its contents by consumers of the class? Almost everyone who wanted to do private field injection sited something like this as the reason for wanting to keep it private. 

That is why the dependency attributes now support being applied to parameters. You see, we now support constructor dependency injection. So when you have a situation when you want a field to get set once and only once, instead of doing dependency injection into a private field, we now recommend that you take that dependency injection via a constructor parameter. 

So whereas you would have had something like this in June CAB: 
    
    
       1:  public class MyClass
    
    
    
       2:  {
    
    
    
       3:      [ServiceDependency]
    
    
    
       4:      private ISomeService service;
    
    
    
       5:  &nbsp_place_holder;
    
    
    
       6:      public MyClass()
    
    
    
       7:      {
    
    
    
       8:      }
    
    
    
       9:  &nbsp_place_holder;
    
    
    
      10:      // Etc.
    
    
    
      11:  }
    

In Oct CAB, we would do it like this: 
    
    
       1:  public class MyClass
    
    
    
       2:  {
    
    
    
       3:      private ISomeService service;
    
    
    
       4:  &nbsp_place_holder;
    
    
    
       5:      public MyClass([ServiceDependency] ISomeService service)
    
    
    
       6:      {
    
    
    
       7:          this.service = service;
    
    
    
       8:      }
    
    
    
       9:  &nbsp_place_holder;
    
    
    
      10:      // Etc.
    
    
    
      11:  }
    

If you need to be able to support multiple constructors, we have a special attribute called [InjectionConstructor] that you can apply to the one you want us to use: 
    
    
       1:  public class MyClass
    
    
    
       2:  {
    
    
    
       3:      private ISomeService service;
    
    
    
       4:  &nbsp_place_holder;
    
    
    
       5:      public MyClass()
    
    
    
       6:      {
    
    
    
       7:          service = new DefaultServiceImplementation();
    
    
    
       8:      }
    
    
    
       9:  &nbsp_place_holder;
    
    
    
      10:      [InjectionConstructor]
    
    
    
      11:      public MyClass([ServiceDependency] ISomeService service)
    
    
    
      12:      {
    
    
    
      13:          this.service = service;
    
    
    
      14:      }
    
    
    
      15:  &nbsp_place_holder;
    
    
    
      16:  }
    

In the end, you get the same thing: an instance of MyClass that gets its service field set. But in the newer code, you control how that private field gets set (as it should be) and we just make sure you get the right value for it. 

We think that this results in a class that is clearer, easier to test, and doesn't cause problems that can crop up when you do private reflection. 

But as always, we'd love to hear what you think of this. 
