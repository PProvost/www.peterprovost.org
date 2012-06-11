---
layout: post
title: "Unit Testing ASP.NET MVC Web API"
date: 2012-06-09 16:26
published: false
comments: true
categories: 
- visual studio
- code
tags:
- unit testing
- visual studio
---

A couple of days ago a colleague pinged me wanting to talk about unit
testing an ASP.NET MVC Web API project. In particular he was having a
hard time testing the POST controller, but it got me thinking I needed
to explore unit testing the new Web API stuff.

Since it is always fun to add unit tests to someone else's codebase, I decided
to start by using the tutorial called [Creating a Web API that Supports CRUD Operations ][1] 
and the [provided solution][2] available on www.asp.net. 

<!-- more -->

## What should we test?

In a Web API project, one of the things you need to ask yourself is, "What do
we need to test?"

Despite my passion for unit testing and TDD, you might be surprised when I
answer "as little as possible." You see, when I'm adding tests to legacy code,
I believe strongly that you should only add tests to the things that need it.
There is very little value-add in spending hours adding tests to things that
might not need it.

I tend to follow the [WELC approach][5], focusing on adding tests to either
areas of code that I am about to work on, or areas that I know need some test
coverage. The goal when adding tests for legacy code like this is to "pin" the
behavior down, so you at least can make positive statments about what it does
do right now. But I only really care about "pinning" those methods that have
interesting code in them.

So I'm not going to bother putting any unit tests on things like
`BundleConfig`, `FilterConfig`, or `RouteConfig`. These classes really just
provide an in-code way of configuring the various conventions in ASP.NET MVC.
I'm also not going to bother with any of the code in the `Content` or `Views`
folders, nor will I unit test any of the Javascript (but if this were not just
a Web API, but a full web app with important Javascript, I would certainly
think more about that last one).

Since this is a Web API project, its main purpose is to provide an easy to use
REST JSON API that can be used from apps or web pages. All of the code that
*matters* is in the `Controllers` folder, and in particular the
`ProductsController` class, which is the main API for the project.

This is the class we will unit test.

## Unit Tests not Integration Tests

Notice that I said *unit test* in the previous sentence. For me a unit test
is **the smallest bit of code that I can test in isolation from other bits 
of code**. In .NET code, this tends to be classes and methods. Defining unit
test in this way makes it easy to find what to test, but sometimes the *how*
part can be tough because of the "in isolation from other bits" part.

When we create tests that bring up large parts of our system, or of the
environment, we are really creating **integration tests**. Don't get me wrong,
I think integration tests are useful and can be important, but I do not
want to get into the habit of depending entirely on integration tests
when writing code. Creating a testable, cohesive, decoupled design is important
to me. It is the only way to achieve the design goal of simplicity (maximizing
the amount of work **not done**).

But in this case we will be adding tests to an existing system. To make the
point, I will avoid changing the system at all. Because of this we may find
ourselves occasionally creating integration tests because we have no choice.
But we can (and should) use that feedback to think about the design of what
we have and whether it needs some refactoring.

## Analyzing the ProductsController class

The `ProductsController` class isn't too complex, so it should be pretty easy
to test. Let's take a look at the code we got in the download:

``` csharp ProductsController.cs
namespace ProductStore.Controllers
{
    public class ProductsController : ApiController
    {
        static readonly IProductRepository repository = new ProductRepository();

        public IEnumerable<Product> GetAllProducts()
        {
            return repository.GetAll();
        }

        public Product GetProduct(int id)
        {
            Product item = repository.Get(id);
            if (item == null)
            {
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.NotFound));
            }
            return item;
        }


        public IEnumerable<Product> GetProductsByCategory(string category)
        {
            return repository.GetAll().Where(
                p => string.Equals(p.Category, category, StringComparison.OrdinalIgnoreCase));
        }


        public HttpResponseMessage PostProduct(Product item)
        {
            item = repository.Add(item);
            var response = Request.CreateResponse<Product>(HttpStatusCode.Created, item);

            string uri = Url.Link("DefaultApi", new { id = item.Id });
            response.Headers.Location = new Uri(uri);
            return response;
        }


        public void PutProduct(int id, Product contact)
        {
            contact.Id = id;
            if (!repository.Update(contact))
            {
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.NotFound));
            }
        }


        public HttpResponseMessage DeleteProduct(int id)
        {
            repository.Remove(id);
            return new HttpResponseMessage(HttpStatusCode.NoContent);
        }

    }
}
```

We have three Get methods, and a method for each of Post, Put and Delete.

Straight away I see the first problem: The IProductRepository is private and
static. Since I said I didn't want to change the product code, this is an issue.
As a static, readonly, private field, we really don't have any way to replace
it, so in this one case, I will need to change the product to a more testable 
design. This isn't as bad as it looks, however, since in the tutorial they
acknowledge that this is a temporary measure in their code:

> Calling new ProductRepository() in the controller is not the best design,
> because it ties the controller to a particular implementation of
> IProductRepository. For a better approach, see [Using the Web API Dependency Resolver][3].

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

## Testing the easy stuff

Now that  we can use the testing constructor to provide a custom instance
of the IProductRepository, we can get back to writing our unit tests.

For these tests I will be using the Xunit.net unit testing framework. I will
also be using Visual Studio 2012 Fakes to provide easy-to-use Stubs for
dependent interfaces like `IProductRepository`. After using NuGet to get an
Xunit.net reference in the test project, I added a project reference to the
`ProductsStore` project. Then by right-clicking on the `ProductsStore`
reference and choosing **Add Fakes Assembly**, I can create the Stubs I will
use in my tests.

Testing all of the methods except the `PutProduct` method is pretty
straightforward.

### GetAllProducts

This is a very simple method that just returns whatever the repository
gives it. No transformations, no deep copies, it just returns the same
`IEnumerable` it gets from the repository. Here's the test:

``` csharp Tests for GetAllProducts
[Fact]
public void GetAllProductsReturnsEverythingInRepository()
{
    // Arrange
    var allProducts = new[] {
          new Product { Id=111, Name="Tomato Soup", Category="Food", Price = 1.4M },
          new Product { Id=222, Name="Laptop Computer", Category="Electronics", Price=699.99M }
       };
    var repo = new StubIProductRepository
    {
       GetAll = () => allProducts
    };
    var controller = new ProductsController(repo);

    // Act
    var result = controller.GetAllProducts();

    // Assert
    Assert.Same(allProducts, result);
}
```

### GetProduct

I used two tests to pin the existing behavior of the `GetProduct` method. The first
confirms that it returns what the repository gives it, and the second confirms
that it will throw if the repository returns null.

``` csharp Unit Testing the GetProduct method
[Fact]
public void GetProductReturnsCorrectItemFromRepository()
{
   // Arrange
   var repo = new StubIProductRepository
   {
      GetInt32 = id => new Product { Id = 222, Name = "Laptop Computer", Category = "Electronics", Price = 699.99M }
   };
   var controller = new ProductsController(repo);

   // Act
   var result = controller.GetProduct(222);

   // Assert
   Assert.Equal(222, result.Id);
   Assert.Equal("Laptop Computer", result.Name);
   Assert.Equal("Electronics", result.Category);
   Assert.Equal(699.99M, result.Price);
}

[Fact]
public void GetProductThrowsWhenRepositoryReturnsNull()
{
   var repo = new StubIProductRepository
   {
      GetInt32 = id => null
   };
   var controller = new ProductsController(repo);

   Assert.Throws<HttpResponseException>(() => controller.GetProduct(1));
}
```

### GetProductsByCategory

I just used one test to pin the behavior of `GetProductsByCategory`.

``` csharp Unit Testing GetProductsByCategory
[Fact]
public void GetProductsByCategoryFiltersByCategory()
{
   // Arrange
   var repo = new StubIProductRepository
   {
      GetAll = () => new[] {
         new Product { Id=111, Name="Tomato Soup", Category="Food", Price = 1.4M },
         new Product { Id=222, Name="Laptop Computer", Category="Electronics", Price=699.99M }
      }
   };
   var controller = new ProductsController(repo);

   // Act
   var result = controller.GetProductsByCategory("Electronics").ToArray();

   // Assert
   Assert.Equal(1, result.Length);
   Assert.Equal(222, result[0].Id);
}

```

### PutProduct


``` csharp Unit Testing PutProduct
[Fact]
public void PutProductUpdatesRepository()
{
   var wasCalled = false;
   var repo = new StubIProductRepository
   {
      UpdateProduct = prod => wasCalled = true
   };
   var controller = new ProductsController(repo);
   var product = new Product { Id = 111 };

   // Act
   controller.PutProduct(111, product);

   // Assert
   Assert.True(wasCalled);
}

[Fact]
public void PutProductThrowsWhenRepositoryUpdateReturnsFalse()
{
   // Arrange
   var repo = new StubIProductRepository
   {
      UpdateProduct = prod => false
   };
   var controller = new ProductsController(repo);

   // Assert
   Assert.Throws<HttpResponseException>(() => controller.PutProduct(1, new Product()));
}

[Fact]
public void PutProductSetsIdBeforeUpdatingRepository()
{
   // Arrange
   var updatedId = Int32.MinValue;
   var repo = new StubIProductRepository
   {
      UpdateProduct = prod => { updatedId = prod.Id; return true; }
   };
   var controller = new ProductsController(repo);

   // Act
   controller.PutProduct(123, new Product { Id = 0 });

   // Assert
   Assert.Equal(123, updatedId);
}
```

### DeleteProduct

Like the PUT handler, we had a few cases to handle to correctly pin the
behavior of this method.

``` csharp Unit Testing DeleteProduct
[Fact]
public void DeleteProductCallsRepositoryRemove()
{
   // Arrange
   var removedId = Int32.MinValue;
   var repo = new StubIProductRepository
   {
      RemoveInt32 = id => removedId = id
   };
   var controller = new ProductsController(repo);

   // Act
   controller.DeleteProduct(123);

   // Assert
   Assert.Equal(123, removedId);
}

[Fact]
public void DeleteProductReturnsResponseMessageWithNoContentStatusCode()
{
   // Arrange
   var repo = new StubIProductRepository();
   var controller = new ProductsController(repo);

   // Act
   var result = controller.DeleteProduct(123);

   // Assert
   Assert.IsType<HttpResponseMessage>(result);
   Assert.Equal(HttpStatusCode.NoContent, result.StatusCode);
}

```

## Testing the harder stuff: PostProduct

The `PostProduct` method is where things get interesting. Because the HTTP spec
says that when you create a resource from a POST you are supposed to return a
`Created` HTTP status code and include a location to the new resource, the
method we want to test does some funny things to get the HttpResponseMessage
assembled.

My first attempt at a test looked like this:

``` csharp Failing to Unit Test PostProduct
[Fact]
public void PostProductReturnsCreatedStatusCode()
{
   // Arrange
   var repo = new StubIProductRepository
   {
      AddProduct = item => item
   };
   var controller = new ProductsController(repo);

   // Act
   var result = controller.PostProduct(new Product { Id = 1 });

   // Assert
   Assert.Equal(HttpStatusCode.Created, result.StatusCode);
}
```

Unfortunately, that didn't work. You end up getting a `NullReferenceException`
thrown by `Request.CreateReponse` because it expects a fair amount of web
config stuff to have been assembled. This is a bummer, but it is what it is.

I reached out to Brad Wilson for help, and we figured out how to get this going
without going all the way to creating a web server/client pair, but there is
clearly a lot of extra non-test code still running. We had to assemble a whole
bunch of interesting confuration and routing classes to make the
`Request.CreateResponse` method happy, but it did work.

``` csharp Unit Testing PostProduct
[Fact]
public void PostProductReturnsCreatedStatusCode()
{
   // Arrange
   var repo = new StubIProductRepository
   {
      AddProduct = item => item
   };

   var config = new HttpConfiguration();
   var request = new HttpRequestMessage(HttpMethod.Post, "http://localhost/api/products");
   var route = config.Routes.MapHttpRoute("DefaultApi", "api/{controller}/{id}");
   var routeData = new HttpRouteData(route, new HttpRouteValueDictionary { { "controller", "products" } });
   var controller = new ProductsController(repo);
   controller.ControllerContext = new HttpControllerContext(config, routeData, request);
   controller.Request = request;
   controller.Request.Properties[HttpPropertyKeys.HttpConfigurationKey] = config;

   // Act
   var result = controller.PostProduct(new Product { Id = 1 });

   // Assert
   Assert.Equal(HttpStatusCode.Created, result.StatusCode);
}
```

In a future post, I may take a look at how we might use Visual Studio 2010
Fakes to create a Shim to remove all that config stuff, but this will have to
do for now.

I refactored out the ugly config code into a private method called
`SetupControllerForTests` and then wrote two more tests to finish verifying the
method.

``` csharp More tests for PostProduct
[Fact]
public void PostProductReturnsTheCorrectLocationInResponseMessage()
{
   // Arrange
   var repo = new StubIProductRepository
   {
      AddProduct = item => item
   };
   var controller = SetupControllerForTest(repo);

   // Act
   var result = controller.PostProduct(new Product { Id = 111 });

   // Assert
   Assert.Equal("http://localhost/api/products/111", result.Headers.Location.ToString());
}

[Fact]
public void PostProductCallsAddOnRepositoryWithProvidedProduct()
{
   // Arrange
   var providedProduct = default(Product);
   var repo = new StubIProductRepository
   {
      AddProduct = item => providedProduct = item
   };
   var controller = SetupControllerForTest(repo);
   var product = new Product { Id = 111 };

   // Act
   var result = controller.PostProduct(product);

   // Assert
   Assert.Same(product, providedProduct);
}

```

## Conclusion

Hopefully this post showed you a few new things. First, we got to see another
example of using Stubs in unit tests. We also got to see how to use Ninject
in an MVC4 Web API project. Finally, we learned a bit about how to deal with
the nastiness around the `HttpRequestMessage.CreateResponse` extension method.

Personally I wish that POST handler was as easy to test as the rest of the
controller was. One of my favorite things about MVC was always that the separation
of concerns let me test things in isolation. When a controller doesn't have tight
dependencies on the web stack, it is a well-behaved controller. Unfortunately,
when you want to create a controller that followed the HTTP spec for POST, you
will find this a bit hard today. But at least we found a way around it.

Let me know what you think!

[1]: http://www.asp.net/web-api/overview/creating-web-apis/creating-a-web-api-that-supports-crud-operations
[2]: http://code.msdn.microsoft.com/ASP-NET-Web-API-Tutorial-c4761894
[3]: http://www.asp.net/web-api/overview/extensibility/using-the-web-api-dependency-resolver
[4]: http://bradwilson.typepad.com/
[5]: http://www.amazon.com/Working-Effectively-Legacy-Michael-Feathers/dp/0131177052
