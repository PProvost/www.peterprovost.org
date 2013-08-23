---
layout: post
title: "Injecting and Unit Testing an ActionFilter"
date: 2012-06-20 18:24
published: false
comments: true
categories: 
---

Loosely derived from the Understanding Action Filters example
Logs actions to the debug window

``` csharp Initial filter code
using System;
using System.Diagnostics;
using System.Linq;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace MvcApplication.Filters
{
    public class LogActionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            Log(actionContext);
        }

        public override void OnActionExecuted(HttpActionExecutedContext actionExecutedContext)
        {
            Log(actionExecutedContext.ActionContext);
        }

        private void Log(HttpActionContext actionContext)
        {
            var controllerName = actionContext.ActionDescriptor.ControllerDescriptor.ControllerType.Name;
            var actionName = actionContext.ActionDescriptor.ActionName;
            var args = actionContext.ActionArguments.Select(kvp => String.Format("{0}:{1}", kvp.Key, kvp.Value.ToString()));

            var message = String.Format("controller:{0} action:{1} arguments:[{2}]", controllerName, actionName, String.Join(",", args));
            Debug.WriteLine(message, "Action Filter Log");
        }
    }
}
```

Following previous pattern, let's pull out the Debug.WriteLine
Manual dependency injection to start

Create the following interface to abstract the log store:

``` csharp ILoggingStore Interface
namespace MvcApplication.Models
{
    public interface ILoggingStore
    {
        void LogMessage(string category, string message);
    }
}
```

If I follow the guidance in my previous post, since the LogActionFilter
requires the `ILoggingStore` to work, we should provide it on the
constructor. But because this is an attribute, we don't want to have
to specify the logging store every time we use the attribute. Instead
we want to use the attribute as we always have, but let Ninject provide
the logging store. So we end up having to use property injection.

Since I was on a plane when I wrote this and didn't have access to the
docs, my first attempt took a shortcut and used what Martin Fowler called
Type 1 Dependency Injection, also known as the "service locator" approach.
Essentially I just had the filter ask the configured IDependencyResolver
(which happens to be our Ninject container) to give me an `ILoggingStore`.

The code for the filter now looks like this

``` csharp ILoggingStore with injected logging store
using System;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace MvcApplication.Filters
{
    public class LogActionFilter : ActionFilterAttribute
    {
        public ILoggingStore LoggingStore
        {
            get
            {
                var resolver = GlobalConfiguration.Configuration.DependencyResolver;
                return resolver.GetService(typeof(ILoggingStore)) as ILoggingStore;
            }
        }

        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            Log(actionContext);
        }

        public override void OnActionExecuted(HttpActionExecutedContext actionExecutedContext)
        {
            Log(actionExecutedContext.ActionContext);
        }

        private void Log(HttpActionContext actionContext)
        {
            if (LoggingStore != null)
            {
                var controllerName = actionContext.ActionDescriptor.ControllerDescriptor.ControllerType.Name;
                var actionName = actionContext.ActionDescriptor.ActionName;
                var args = actionContext.ActionArguments.Select(kvp => String.Format("{0}:{1}", kvp.Key, kvp.Value.ToString()));

                var message = String.Format("controller:{0} action:{1} arguments:[{2}]", controllerName, actionName, String.Join(",", args));
                LoggingStore.LogMessage("Action Filter Log", message);
            }
        }
    }
}
```

While this code does work, it has a problem.

Since I ended up baking the dependency to
GlobalConfiguration.Configuration.DependencyResolver into the filter, I now
cannot unit test it without setting up all of the HttpConfiguration stuff. Ugh.

I could probably figure out a way to cause Ninject clean this up for me, but
one thing I like about this is that currently none of our code actually
knows that we have Ninject here. It is totally transparent to the code that
takes advantage of it. Even in the LoggingStore property, we are only depending
on the fact that we have some kind of IDependencyResolver that will give us
a service when we ask for it.

A little code hackery should be able to get past this.

``` csharp Updated LoggingStore property
namespace MvcApplication.Filters
{
    public class LogActionFilter : ActionFilterAttribute
    {
        private ILoggingStore loggingStore;
        public ILoggingStore LoggingStore
        {
            get
            {
                if (this.loggingStore == null)
                {
                    var resolver = GlobalConfiguration.Configuration.DependencyResolver;
                    return resolver.GetService(typeof(ILoggingStore)) as ILoggingStore;
                }
                return this.loggingStore;
            }
            set { this.loggingStore = value; }
        }

        // The rest is unchanged
    }
}
```

Now we can test the filter, and provide a custom `ILoggingStore`
that we can verify against. The unit tests are actually quite simple
and are really just checking that a) we call the logging store and
b) we get the right formatted message.

Unfortunately, due to a bug in Visual Studio 2012 RC that is preventing
me from creating a Fakes Assembly for System.Web.Http, I had to manually
create a stub for HttpActionDescriptor, which our implementation expects
to find within the HttpActionContext. We're looking into what is causing
this, but it looks like it might be related to the APTCA (Allow Partially
Trusted Callers Attribute) on the framework assembly. I'll post more on this
once I know more.

Anyway, here's the code that tests the mainline scenario for the filter.

``` csharp Unit Tests for LogActionFilter
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Http.Controllers;
using MvcApplication.Filters;
using MvcApplication.Filters.Fakes;
using Xunit;

namespace UnitTests
{
    public class LogActionFilterTests
    {
        class StubActionDescriptor : HttpActionDescriptor
        {
            public StubActionDescriptor()
            {
                ControllerDescriptor = new HttpControllerDescriptor
                {
                    ControllerType = this.GetType()
                };
            }

            public override string ActionName { get { return "TestActionName"; } }

            public override Task<object> ExecuteAsync(HttpControllerContext controllerContext, IDictionary<string, object> arguments)
            {
                throw new NotImplementedException();
            }

            public override System.Collections.ObjectModel.Collection<HttpParameterDescriptor> GetParameters()
            {
                throw new NotImplementedException();
            }

            public override Type ReturnType
            {
                get { throw new NotImplementedException(); }
            }
        }

        [Fact]
        public void LogsCorrectControllerNameAndActionName()
        {
            var sut = new LogActionFilter();
            string category = null, message = null;
            sut.LoggingStore = new StubILoggingStore
            {
                LogMessageStringString = (cat, msg) => { category = cat; message = msg; }
            };

            var context = new HttpActionContext { ActionDescriptor = new StubActionDescriptor() };

            sut.OnActionExecuting(context);

            Assert.Equal("Action Filter Log", category);
            Assert.Equal("controller:StubActionDescriptor action:TestActionName arguments:[]", message);
        }

        [Fact]
        public void LogsCorrectActionArguments()
        {
            var sut = new LogActionFilter();
            string category = null, message = null;
            sut.LoggingStore = new StubILoggingStore
            {
                LogMessageStringString = (cat, msg) => { category = cat; message = msg; }
            };

            var context = new HttpActionContext
            {
                ActionDescriptor = new StubActionDescriptor(),
            };
            context.ActionArguments["one"] = "ONE";
            context.ActionArguments["two"] = "TWO";

            sut.OnActionExecuting(context);

            Assert.Contains("arguments:[one:ONE,two:TWO]", message);
        }
    }
}

```
