---
layout: post
title: "Adding Ninject to Web API"
date: 2012-06-19 20:21
comments: true
categories: 
- Code
- Visual Studio
tags:
- visual studio
- ninject
- web api
---

In my last post I focused on how to unit test a new Visual Studio 2012 RC
ASP.NET Web API project. In general, it was pretty straightforward, but when I
had Web API methods that needed to return an `HttpResponseMessage`, it got a
little harder.

If you recall, I decided to start with the 
[Creating a Web API that Supports CRUD Operations ][1] tutorial and the
[provided solution][2] that came with it.  That project did not use any form of
dependency inversion to resolve the controller's need for a
`ProductRepository`.  My solution in that post was to use manual dependency
injection and a default value. But in the real world I would probably reach for
a dependency injection framework to avoid having to do all the resolution
wiring throughout my code.

In this post I am going to convert the manual injection I used in the last post
to one that uses the [Ninject framework][3]. Of course you can use any other
framework you wanted like [Unity][5], [Castle Windsor][6], [StructureMap][8],
etc.  but the code that adapts between it and ASP.NET Web API will probably
have to be different.

<!-- more -->

## Getting Started

First let's take a look at the code I had for the `ProductsController` at the end
of the last post, focusing on the constructors and the `IProductRepository` field.

``` csharp Manual Depdendency Injection
namespace ProductStore.Controllers
{
   public class ProductsController : ApiController
   {
      readonly IProductRepository repository;

      public ProductsController()
      {
         this.repository = new ProductRepository();
      }

      public ProductsController( IProductRepository repository )
      {
         this.repository = repository;
      }

      // Everything else stays the same
   }
}
```

The default constructor provides the default value for the repository, while
the second constructor lets us provide one. This is fine when we only have a
single controller, but in a real-world system we will likely have a number of
different controllers, and having the logic for which repository to use spread
among all those controllers is going to be a nightmare to maintain or change.

By default, the ASP.NET Web API routing stuff will use the default constructor
to create the controller. What I want to do is make that default constructor go
away, and instead let Ninject be responsible for providing the required
dependency.

## A quick aside - Constructor injection or Property injection?

This came up in one of my talks last week at TechEd, so it probably warrants
some discussion here. When [Brad Wilson][4] and I made the first version of the
ObjectBuilder engine that hides inside Unity and the various P&amp;P CAB
frameworks, we got to have this argument with people all the time.

While this argument looks like another one of those "philosophical arguments"
that doesn't have a right answer, I don't think it really is. I think the
distinction between constructor injection and property injection is important,
and I think you can find yourself using both depending on the circumstances.

Here's the gist of my argument: If the class would be in an invalid state
without the dependency, then it is a **hard dependency** and should be resolved
via constructor injection. This kind of class **requires the dependency**. It
cannot be used without it. Putting the dependency on the constructor and not
providing a default constructor makes it very clear to the developer who wants
to consume this class. The developer is required to provide the dependency or
the class cannot be created. If you find yourself doing a null check everywhere
the dependency gets used, and especially if you throw an exception when it is
null, then you likely have a hard dependency.

But if the class has a dependency that either isn't required, or that will
use a default object or a null object if it is not provided, then it is a
**soft dependency** and should not be resolved via constructor injection. If
you do choose to express this optional dependency via constructor, then you 
should either show the default value in the constructor definition or provide
an override that doesn't require it. Then if the developer wants to provide
a special implementation (logging is an example that comes to mind), they 
can provide it via the property setter.

Dependency injection containers hide a lot of this from you, which might take
you to a "who cares" kind of place. But one thing I always look for in DI
frameworks is that I don't have to change the code itself very much. It should
read and be understandable without knowing anything about the DI container.  If
I don't want to use a DI framework at all, the code should still express its
meaning and it should still be usable. I believe that this distinction between
**hard** and **soft** dependencies makes that clear.

## Expressing the IProductRepository dependency

In our case, the repository is a **hard dependency**, so I will express it on
the constructor. Additionally, I don't actually want the default object instance
so I'm going to delete the default constructor. It will be invalid to create a 
`ProductsController` without providing an instance of `IProductRepository`.

The code now looks like this:

``` csharp Manual Depdendncy Injection ProductsController.cs
namespace MvcApplication.Controllers
{
   public class ProductsController : ApiController
   {
      readonly IProductRepository repository;

      public ProductsController(IProductRepository repository)
      {
         this.repository = repository;
      }

      // Everything else stays the same
   }
}
```

If you try to run the app now, either through the web page that consumes
the API or by pointing a browser at **<your local app URL>/api/products** 
you will get an HTTP 500 Internal Server error because the ASP.NET routing
cannot create an instance of the controller.

It is time to bring Ninject to the party.

## Using Ninject to resolve the repository dependency

### Getting the NuGet Packages

In previous releases of ASP.NET MVC4, you were able to use the existing
**Ninject MVC3** NuGet package to give us all the required glue code. But with
the RC build of MVC4, it no longer works because the MVC team changed the
dependency resolution mechanism for Web API projects. 

Since I can't use the **Ninject MVC3** package, I need to do something slightly
different. Instead, I will use the **Ninject.Web.Common** package and then
create my own wrapper class to adapt between the `IDependencyResolver` API and
Ninject.

When you add the **Ninject.Web.Common** NuGet package to your project, it does
a few things to help you. So that you can skip adding a bunch of code to your
Global.asax.cs file, it uses a nice little package called **WebActivator**
to call another class when certain ASP.NET events have happened.

After adding **Ninject.Web.Common** to the project, open the App\_Start folder
and you will see a new file called NinjectWebCommon. This static class will be
called by WebActivator when the application starts and stops. The Ninject.Web.Common
package provided it with the code required to bootstrap the Ninject kernel.

### NinjectDependencyResolver

I said we needed an implementation of `IDependencyResolver` that knew about
Ninject. Fortunately my good friend Brad Wilson came to the rescue again, and
pointed me to [a chunk of code he'd written to do just that][9]. Here's my
slightly modified version of his code:

``` csharp NinjectDependencyResolver.cs
using System;
using System.Web.Http.Dependencies;
using Ninject;
using Ninject.Syntax;

namespace MvcApplication.App_Start
{
   // Provides a Ninject implementation of IDependencyScope
   // which resolves services using the Ninject container.
   public class NinjectDependencyScope : IDependencyScope
   {
      IResolutionRoot resolver;

      public NinjectDependencyScope(IResolutionRoot resolver)
      {
         this.resolver = resolver;
      }

      public object GetService(Type serviceType)
      {
         if (resolver == null)
            throw new ObjectDisposedException("this", "This scope has been disposed");

         return resolver.TryGet(serviceType);
      }

      public System.Collections.Generic.IEnumerable<object> GetServices(Type serviceType)
      {
         if (resolver == null)
            throw new ObjectDisposedException("this", "This scope has been disposed");

         return resolver.GetAll(serviceType);
      }

      public void Dispose()
      {
         IDisposable disposable = resolver as IDisposable;
         if (disposable != null)
            disposable.Dispose();

         resolver = null;
      }
   }

   // This class is the resolver, but it is also the global scope
   // so we derive from NinjectScope.
   public class NinjectDependencyResolver : NinjectDependencyScope, IDependencyResolver
   {
      IKernel kernel;

      public NinjectDependencyResolver(IKernel kernel) : base(kernel)
      {
         this.kernel = kernel;
      }

      public IDependencyScope BeginScope()
      {
         return new NinjectDependencyScope(kernel.BeginBlock());
      }
   }
}
```

This file contains two classes. The first, `NinjectDependencyScope`, provides a
scoping region for dependency resolution. Scopes and Blocks are beyond the
scope (sic) of this post, but the gist is that you may need to provide
different service resolutions for different places in your app.  The second
class is the actual implementation of `IDependencyResolver`, and since it is
also the *global scope*, it derives from `NinjectDependencyScope`. 

### Hooking it all up

Now that we have these classes, we can hook it all up. Returning to the
NinjectWebCommon static class, we only need to add one line to use our new
dependency resolver. We will add this to the `CreateKernel` method:

``` csharp CreateKernel() method
private static IKernel CreateKernel()
{
   var kernel = new StandardKernel();
   kernel.Bind<Func<IKernel>>().ToMethod(ctx => () => new Bootstrapper().Kernel);
   kernel.Bind<IHttpModule>().To<HttpApplicationInitializationHttpModule>();

   RegisterServices(kernel);

   // Install our Ninject-based IDependencyResolver into the Web API config
   GlobalConfiguration.Configuration.DependencyResolver = new NinjectDependencyResolver(kernel);

   return kernel;
}
```

We simply new up an instance of the `NinjectDependencyResolver` and assign it
to the `DependencyResolver` property of the global `HttpConfiguration` object.

I'm still not 100% sure this is the best place to do this, but I tried a few
others and it didn't feel any better. If I later change my mind on this, or if
someone can tell me a better place or way to do this, I will update this post.
In the Unity sample that I link to at the end of this post, they did it in the
Application class. One advantage to doing it here is that we can imagine it
being done for us by a NuGet package (more on that at the end). Choose what
feels right for you.

### Registering our services with Ninject

The NinjectWebCommon static class already had a nice method called
`RegisterServices` where I am supposed to express my service bindings, so I
will simply use that. Here is mine:

``` csharp RegisterServices method
private static void RegisterServices(IKernel kernel)
{
   // This is where we tell Ninject how to resolve service requests
   kernel.Bind<IProductRepository>().To<ProductRepository>();
}
```

Ninject has a very friendly fluent API for binding instance types to interface
types, so with that one line I am telling it that whenever someone (in this
case ASP.NET) asks for an `IProductRepository`, it should give back a
`ProductRepository`. Remember when I said we didn't want these kinds of
dependency resolutions spread all over our code? Now they're not.  We have them
all in one place where they are easy to see and change as needed.

## Next Steps

I feel pretty good about the state of this project at this point. In my
previous post I focused on testability and the issues with having a Web API
handler that returned an `HttpResponseMessage`. In this post I explored how to
resolve the dependencies using Ninject. If this was a real project, I would now
feel pretty good about adding additional controllers, real repository
implementations, etc. I'm in a testable state, which I love, and my classes are
loosely coupled while still expressing their dependencies in a clear, readable
way.

I would love to see the `NinjectDependencyResolver` stuff become a new NuGet
package for others to use, so if someone wants to grab this code and do that,
I'm fine with it (and I assume Brad Wilson is too, since this was originally
his code). I don't do enough full-time web development to be a very good
maintainer of such a package, so it really would be better for someone else to
do that instead of me.

I mentioned at the top that you can do this kind of thing with a number of
different dependency injection frameworks. If you want to see an implementation
that uses the *patterns &amp; practices* Unity container, there is one called
[Using the Web API Dependency Resolver][7] up on www.asp.net. 

If you are looking at the new ASP.NET Web API framework for building out your
new REST APIs, hopefully you've found these two posts useful. Let me know!

[1]: http://www.asp.net/web-api/overview/creating-web-apis/creating-a-web-api-that-supports-crud-operations
[2]: http://code.msdn.microsoft.com/ASP-NET-Web-API-Tutorial-c4761894
[3]: http://www.ninject.org/
[4]: http://bradwilson.typepad.com/
[5]: http://unity.codeplex.com/
[6]: http://docs.castleproject.org/Default.aspx?Page=MainPage&NS=Windsor&AspxAutoDetectCookieSupport=1
[7]: http://www.asp.net/web-api/overview/extensibility/using-the-web-api-dependency-resolver
[8]: http://docs.structuremap.net/
[9]: https://gist.github.com/2417226
