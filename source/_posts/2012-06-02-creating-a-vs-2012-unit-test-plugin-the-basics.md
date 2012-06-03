---
layout: post
title: "Creating a VS 2012 Unit Test Plugin - The Basics"
date: 2012-06-02 17:59
published: false
comments: true
categories: 
- Code
- 
tags:
- visual studio
- unit testing
---

{% img right /images/blog/2012-06-01-my-speaking-schedule-2012/vs2012.png Visual Studio 2012 Logo %}

One of the coolest new capabilities in the Visual Studio 2012 unit testing
experience is the ability for third party test frameworks to plug in and get
the same integrated experience. I have previously posted a 
[list of available plugins][1], but there isn't a lot of information available
on how to create one.

In this post I will show you how to create one of these plugins, focusing on
the basic structure and interfaces you have to implement. Later posts might
cover things like troubleshooting, creating plugins for non- .NET languages,
and maybe some more advanced topics.

<!-- more -->

## Architecture of a Unit Test Plugin

Before we can get into the code, I need to explain a bit about how the system
works.  The following diagram shows the basic structure of the VS2012 unit test
experience.  The stuff in green ships with Visual Studio 2012, while the stuff
in blue is written by third parties.

{% img center /images/blog/2012-06-02-creating-a-vs-2012-unit-test-plugin-the-basics/vs2012-unittest-arch.png VS2012 Unit Testing Architecture %}

Each plugin is a .NET assembly that exports various interfaces that VS will use
to call into the plugin. These interfaces are defined in the "Visual Studio Unit
Test Platform" layer in the diagram above. Just because the plugin is a .NET 
assembly, do not assume we can only do .NET-based unit tests. You can call out
from .NET to anything else on which you depend (e.g. an EXE or some native code or
whatever).

The plugin installs into Visual Studio using a VSIX, which is a VS-specific,
lightweight installer mechanism. Within the VSIX (which is really just a ZIP
file) are the various files the test plugin requires (e.g. DLLs and other support
files) and a file called a vsixmanifest. This manifest file tells Visual Studio
what kinds of things it can find within the ZIP file.

When the user does something that causes us to need to refresh some or all of
the test list, VS calls into the plugin via the ITestDiscoverer interface. When
a test or tests need to be run, VS will call into the ITestExecutor interface.
These two interfaces are the bare minimum you will need to implement to create
your unit test plugin.

## ITestDiscoverer and ITestExecutor

The interface VS will use to find tests is called ITestDiscoverer and it contains
just one method: 

``` csharp ITestDiscoverer interface
namespace Microsoft.VisualStudio.TestPlatform.ObjectModel
{
   public interface ITestDiscoverer
   {
      void DiscoverTests( IEnumerable<string> sources,
                          IMessageLogger logger,
                          ITestCaseDiscoverySink discoverySink );
   }
}
```

As you can see, this interface is very lightweight. The first parameter is a list
of "test sources" which are provided to the adapter. For the case of DLLs and EXEs
these are just the full paths to the files that should be scanned. (You might ask
why this is a string, but if you think about other possibilities, like tests run
over a remote connection, then it would need to be something other than a path.)

When VS is ready to run a test or tests, it will call into the ITestExecutor
interface:

``` csharp ITestExecutor interface
namespace Microsoft.VisualStudio.TestPlatform.ObjectModel
{
   public interface ITestExecutor
   {
      void RunTests( IEnumerable<string> sources, 
                     IRunContext runContext, 
                     ITestExecutionRecorder testExecutionRecorder );

      void RunTests( IEnumerable<TestCase> tests, 
                     IRunContext runContext, 
                     ITestExecutionRecorder testExecutionRecorder );

      void Cancel();
   }
}
```

Again we have a very lightweight interface. There are two versions of RunTests,
one for running all tests within a "test source" (see above) and one for
running a specific test or tests. There is also a Cancel method that gets
called when the user wants to cancel the run.

## Creating our first test plugin

For this exercise, I am going to assume that the actual logic for running tests
is defined in another assembly. This is, in fact, my recommended approach to
creating a test plugin for VS. If you have a free-standing runner library that
already works, then the plugin is simply an *adapter* between our interfaces
and data types and yours. This greatly simplifies your work creating the
integration.

### Creating a VSIX project

For the test plugin to load into Visual Studio, you will need to create a VSIX.
You can do this by hand if you want, but I recommend people use the VSIX
Project Template that is included in the [Visual Studio SDK][2]. Using the VSSDK
also gets you the Visual Studio Experimental Instance, which makes running and
debugging your plugin a lot easier.

After installing the VSSDK, add a new project to your solution using the VSIX
template.

{% img center /images/blog/2012-06-02-creating-a-vs-2012-unit-test-plugin-the-basics/new-vsix-project.png New Project Dialog %}

By default, the VSIX project template will assume that you don't have any
actual code within the VSIX project. To make life easier, however, we will
change this so we can put the plugin itself in this project. To do this we
will make some manual edits to the project file.

Right click on the VSIX project in the Solution Explorer and choose **Unload
Project**. Then right click on it again and choose **Edit Project File**.

Change the XXX and XXX values in the top section to true. Your file should look
something like this:

{% img center /images/blog/2012-06-02-creating-a-vs-2012-unit-test-plugin-the-basics/vsix-project-file-xml.png Editing the VSIX project file %}

Then save and close the file, and reload the project into Solution Explorer. Now
you can create your plugin implementation within this project and the resulting
DLL will be included in the VSIX file.

### The framework runner library

As I said above, we are going to assume we have a class in this library called
TestRunner with the following public signature:

``` csharp The TestRunner class
namespace MyTestFramework.Runner
{
   public class TestRunner
   {
      public IEnumerable<MyTestCase> EnumerateTests(string assemblyPath) { }
      public void RunTest(string testName, ITestRunnerCallback callback) { }
      public void RunAllTests(string assemblyPath, ITestRunnerCallback callback) { }
   }
}
```

This is a common pattern in .NET test runners. One method for finding tests
in an assembly, and two for running the tests themselves. Of course, the real 
thing would probably be a bit more complicated, but this will suffice for us
to create our plugin adapter.

### Creating and testing a plugin skeleton

* create a basic implementation
* return bogus data for discovery
* return bogus data for execution
* F5 to run it and see it work
* 
### Implementing test discovery

* talk about "fast failing"
* call into the TestRunner
* convert the results to MS.VS.TP.OM.TestCase
* talk about the issues with CodeFilePath and LineNumber and DiaSession
* F5 to run it and see it work


### Implementing test execution

* again talk about fast failing for Run(sources)
* call into the TestRunner
* provide a special callback delegator that converts from theirs to ours
* F5 to run it and see it work


[1]: http://www.peterprovost.org/blog/2012/02/29/Visual-Studio-11-Beta-Unit-Testing-Plugins-List/
[2]: vssdk link
