---
layout: post
title: "Adding Ninject to Web API"
date: 2012-06-15 15:23
published: false
comments: true
categories: 
- Code
- Visual Studio
tags:
- Dependency Injection
- Unit Testing
- Ninject
---

**Copying stuff over from the other post**

The easiest way that I've found to fix this was to fire up the NuGet Package
Manager and grab the **Ninject MVC3** library. Even though we're using MVC4
with Visual Studio 2012 RC, the MVC version of Ninject MVC works just fine with
a VS 2012 RC Web API project, with just a few little changes.

For the RC release, Web API projects use a different mechanism for dependency
resolution than classic MVC. This means the built-in Ninject mechanism needs
some updating to work. The following code was provided by [Brad Wilson][4] to
bind Ninject to the Web API dependency resolution mechanism.

In the NinjectWebCommon.cs file (which was added by the Ninject MVC package we
added above), add the following two functions:

``` csharp New Web API Dependency Resolution for Ninject
public class NinjectScope : IDependencyScope
{
   IResolutionRoot resolver;

   public NinjectScope(IResolutionRoot resolver)
   {
      this.resolver = resolver;
   }

   public object GetService(Type serviceType)
   {
      if (resolver == null)
         throw new ObjectDisposedException("kernel", "This scope has been disposed");
      return resolver.TryGet(serviceType);
   }

   public System.Collections.Generic.IEnumerable<object> GetServices(Type serviceType)
   {
      if (resolver == null)
         throw new ObjectDisposedException("kernel", "This scope has been disposed");
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

public class NinjectGlobalScope : NinjectScope, IDependencyResolver
{
   IKernel kernel;

   public NinjectGlobalScope(IKernel kernel)
      : base(kernel)
   {
      this.kernel = kernel;
   }

   public IDependencyScope BeginScope()
   {
      return new NinjectScope(kernel.BeginBlock());
   }
}

```

And then in the `NinjectWebCommon.CreateKernel` method, before returning the kernel,
add the following line:

``` csharp Add to the bottom of NinjectWebCommon.CreateKernel
GlobalConfiguration.Configuration.DependencyResolver = new NinjectGlobalScope(kernel);
```

*That is a bit of a mess, but we can hope that before RTM the Ninject folks
will make this part go away, leaving us to just use it the way it was meant
to be.*

The next step is simply to get rid of the ugly default constructor and replace
it with one that specifies the dependency on `IProductRepository` and stores
the parameter is a readonly field.

``` csharp Products Controller with Dependency Injection Constructor
public class ProductsController : ApiController
{
   readonly IProductRepository repository;

   public ProductsController(IProductRepository repository)
   {
      this.repository = repository;
   }

   // The rest is unchanged

}

```

Because we will need to call this constructor from our unit tests, we
also need to change the accessibility of the `IProductRepository` interface
to `public`.

Ninject will take care of the rest. Don't believe me? Run your app. 

