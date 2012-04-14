---
layout: post
title: "Extending Visual Studio 2010 UML Designers &ndash; Part 1: Getting Started"
comments: false
date: 2009-10-26 16:28:07
categories:
 - Technology
tags:
 - visual studio
 - uml
 - mef
 - vssdk
subtext-id: 408cb58f-fd0e-4dfd-9732-090f33416427
alias: /blog/Extending-Visual-Studio-2010-UML-Designers-ndash3b-Part-1-Getting-Started.aspx
---


_This is the first in a series of blog posts to show how the new UML Modeling capabilities in Visual Studio 2010 Ultimate can be extended. Later articles will expand on the examples shown here and show more advanced extensibility._

## Introduction

In Visual Studio 2010 Ultimate we have introduced a set of new UML 2.1.2 modeling capabilities. We include designers for producing five UML diagram types:

  * Class Diagram 
  * Sequence Diagram 
  * Component Diagram 
  * Use Case Diagram 
  * Activity Diagram 

In addition, we also have tools for analyzing, documenting and validating your architecture. The Layer Diagram can be used to define the large layered components on your solution, map them to real code elements and later validate that your as-built system conforms to what you planned. If you have existing systems you want to investigate and understand better, we have the Architecture Explorer and a set of Dependency Graphs that you can create to see how the parts come together.

As we were building our new capabilities, we realized that people would need to be able to add new capabilities to the diagrams and models we're including in the box. You may, for example, want to add a command for refactoring the model to the menu that appears when you right click on on a shape on the Class Diagram. Or perhaps you want to be able to drag-and-drop something onto a diagram and have it create new model elements based on the source of the drag. Or maybe your enterprise has guidelines about what makes a model "valid" and want to code those validation constraints into the tool so you know when you have deviated.

We can support all of those scenarios using very simple extensibility mechanisms that are present in Visual Studio 2010 Ultimate.

## Before You Begin

This series of articles assumes you already have Visual Studio 2010 Beta 2 Ultimate installed on your system. To make our lives a lot easier we will also be using the Visual Studio 2010 Beta 2 SDK to get our projects started, installed and debugged.

In case you are missing any of those, you can find links to all of the downloads on the [Visual Studio 2010 and .NET Framework Beta 2](http://go.microsoft.com/fwlink/?LinkID=151797) Landing Page.

## Creating Your First Extension Project

Visual Studio 2010 uses the Managed Extensibility Framework for lightweight extensibility and we were eager adopters of that when we created our own extensibility hooks. What this means is that to create a new UML Designer extension, you create a new VSIX Project (a VSIX is just a ZIP file that tells Visual Studio how to install the extension...see [What is a VSIX?](http://blogs.msdn.com/quanto/archive/2009/05/26/what-is-a-vsix.aspx) for more information) and then add a simple little MEF component to it. Easy pie. So let's get started...

### Creating the VSIX Project

Before we can get into the extension itself, we need to get our project set-up correctly.

  1. Create a new C# VSIX Project (you can do VB if you want but my code here is in C#). File | New | Project | Visual C# | Extensibility | VSIX Project. 
  2. Add references to the following .NET Assemblies: 
    * Microsoft.VisualStudio.Modeling.Sdk.10.0 
    * Microsoft.VisualStudio.Uml.Extensions 
    * Microsoft.VisualStudio.Uml.Interfaces 
    * System.ComponentModel.Composition 
  3. Open source.extension.vsixmanifest in the editor. (If it opens in an XML editor, close it and choose View Designer from the file context menu). 
  4. Fill in the Name, Author, and Description sections. 
  5. Set "Supported VS Editions" to Visual Studio Ultimate. 
  6. Save all open files and close them. 
  7. Delete the file VSIXProject.cs from the project 

### VSSDK Beta 2 Bug Workarounds

Unfortunately there are a couple of bugs in the current VSSDK Beta 2 that we have to work around. I've been told they will be fixed in an update release but until then, let me take you through the project cleanup required to make this work:

#### Step 1 - Tweak the .csproj file

  1. Right click on your project and choose "Unload Project". 
  2. Right click again on your project and choose "Edit Yourprojectname.csproj"
  3. In the topmost property group, look for the XML tag <IncludeAssemblyInVSIXContainer>. It will be set to false. Change it to true. 
  4. Save the .csproj file and reload it into Visual Studio. 

#### Step 2 - Tweak the .vsixmanifest file

  1. Right click on the file "source.extension.vsixmanifest" and choose View Code 
  2. At the bottom of the file in the section called <Content> add the following line. (Yes, those vertical bars are important.) 
    
    <MefComponent>|Yourprojectname|</MefComponent> 

  3. Save and close the file. 

### Say "Hello World!"

Now let's make this thing fly. We won't get into any complicated UML or model manipulation in this article. Instead we will just add a new menu item to the context menu of the UML Class Designer. When clicked, the menu item will say Hello World.

  1. Add a Project Reference to System.Windows.Forms (a simple way to get a MessageBox). 
  2. Add a new class named HelloWorldCommandExtension.cs to the project 
  3. Have your new class implement the ICommandExtension interface and add the following attributes to your class (you will need to add the required using directives): 
    
    [Export(typeof(ICommandExtension))] 
    
    
    [ClassDesignerExtension] 

  4. Delete the body of the QueryStatus method 
  5. Replace the Text property implementation as shown here: 
    
    public string Text
    
    
    {
    
    
        get { return "Hello World!"; }
    
    
    }
    

  6. Replace the Execute method as follows: 
    
    public void Execute(IMenuCommand command)
    
    
    {
    
    
        System.Windows.Forms.MessageBox.Show("Hello World!");
    
    
    }

### Testing Your Extension

The nice thing about using the VSIX project template is that is sets everything up for debugging and testing for you using the Visual Studio Experimental hive. To run your extension without debugging, press Ctrl+F5. To run with debugging enabled, just press F5.

One the Experimental Hive is up and running, create a new Modeling Project, add a new Class diagram, and right click on the surface. You should see your "Hello World!" menu item and choosing it should display the message box. Voila!

### Next Steps

In the next part of this series, I will show you how to create new model elements in the Model Store and display them on the diagram surface. Subsequent articles will explore other diagram types and more complex scenarios including creating a full VSPackage.
