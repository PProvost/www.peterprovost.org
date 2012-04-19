---
layout: post
title: "Use of Generics to Eliminate Casting"
comments: false
date: 2005-05-14 21:02:00
updated: 2005-05-14 20:10:00
categories:
 - Technology
subtext-id: 18127f14-e009-4053-9c9f-501e312f9a92
alias: /blog/post/Use-of-Generics-to-Eliminate-Casting.aspx
---


This post is really more of a question than something educational, so please if
you have an opinion on this, post a comment.

Suppose you are creating a new class that implements an older, pre-Whibey
interface. For sake of argument, lets suppose you are implementing
`System.ComponentModel.IServiceProvider`.

``` csharp
public interface IServiceProvider  
{  
   Object GetService(Type serviceType);  
}
```

Because `IServiceProvider.GetService()` returns an `Object`, you have to cast it
before you can use it, resulting in the kind of ugly code shown here:
    
``` csharp
public void Foo()  
{  
   IMyService service = (IMyService) provider.GetService(typeof(IMyService));  
}
```

Of course, if this interface were being created today, we may defined it like
this to avoid all that nastiness:
    
``` csharp
public interface IServiceProvider  
{  
   T GetService<T>();  
}
```

That's not too bad eh? Now we can call it with much nicer code like this:
    
``` csharp
public void Foo()  
{  
   IMyService service = provider.GetService<IMyService>();  
}
```

Now here's the question for all of you...

Given that this older interface exists, and will not likely be updated to have
the kind of generics support I show here, should we use the generics form of
`GetService` anyway? In other words, if you were creating a new class that
implemented `IServiceProvider`, would you provide not only the required interface
for use by people who expect you to be an IServiceProvider, but also provide the
new generic method for people who know about it?

There is a part of my that likes it, but there is another part of me that thinks
the interface clutter created by doing this isn't worth it. We all know that
behind the scenes the new implementation is just doing this...
    
``` csharp
public T GetService<T>()  
{  
   return (T) GetService(typeof(T));  
}
```

...so it isn't like this is saving me a cast or anything.

What do you think? Is this kind of thing good or bad?
