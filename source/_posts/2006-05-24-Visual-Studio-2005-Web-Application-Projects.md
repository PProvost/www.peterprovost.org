---
layout: post
title: "Visual Studio 2005 Web Application Projects"
comments: false
date: 2006-05-24 07:00:00
categories:
 - Technology
subtext-id: add1da5e-e90d-42c8-ab3c-41f0f704aa4a
alias: /blog/post/Visual-Studio-2005-Web-Application-Projects.aspx
---


If you are like me and you prefer the old VS 2003 Web Application project structure to the new one in VS 2005, we recently shipped the [Visual Studio 2005 Web Application Project](http://msdn.microsoft.com/asp.net/reference/infrastructure/wap/default.aspx) model for VS 2005 which does just this.

From the overview page:

> The Visual Studio 2005 Web Application Project model uses the same project, build and compilation semantics as the Visual Studio .NET 2003 web project model:
> 
>   * All files contained within the project are defined within a project file (as well as the assembly references and other project meta-data settings). Files under the web's file-system root that are not defined in the project file are not considered part of the web project.
>   * All code files within the project are compiled into a single assembly that is built and persisted in the \bin directory on each compile.
>   * The compilation system uses a standard MSBuild based compilation process. This can be extended and customized using standard MSBuild extensibility rules. You can control the build through the property pages, for example, name the output assembly or add pre- and post-build actions.
> 
> Because the Web Application Project model uses the same conceptual semantics as the Visual Studio .NET 2003 web project model, it can make migrating projects much easier--minimizing code changes. The key changes in this release from the previous release are:
> 
>   * Team Build Support with VSTS
>   * Strongly-typed access to resources defined within the App_GlobalResources directory
>   * Custom Build Tool Action support
>   * Edit and Continue support
> 
> To fully enable Web Application Projects in Visual Studio 2005, you will need to first install [Microsoft Visual Studio 2005 - Update to Support Web Application Projects](http://go.microsoft.com/fwlink/?LinkId=63636), then this add-in. Visual Studio 2005 Web Application Projects are not supported in Visual Web Developer Express Edition.

Please visit the links above to download this package.

> &nbsp_place_holder;
