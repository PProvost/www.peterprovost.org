---
layout: post
title: "Create the Solution Before Adding Projects"
comments: false
date: 2003-08-12 21:29:00
categories:
 - Technology
subtext-id: e09fc58d-8aeb-40c4-8237-cb9e8558b340
alias: /blog/post/Create-the-Solution-Before-Adding-Projects.aspx
---


[Korby Parnell writes](http://blogs.gotdotnet.com/korbyp/permalink.aspx/47bed69e-15a6-4c7b-8152-92594a358ba0):

> Here's my Source Control Tip of the Week:&nbsp_place_holder;
> 
> <<Create a _**blank solution**_ before creating&nbsp_place_holder;a project.>>
> 
> In&nbsp_place_holder;[Web Projects and Source Control Integration in Visual Studio .NET](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dv_vstechart/html/vetchWebProjectsSourceControlIntegrationInVisualStudioNET.asp?frame=true),&nbsp_place_holder; I state that doing so will, "_ ...improve the long-term manageability and discoverability of your projects_ [and] _maintain a close symmetry between local project files and their master copies on the source control server_."

I couldn't agree more. Even when you aren't using Source Control Integration you should follow this guideline. Unless I know I am creating a one-off [Spike Solution](http://c2.com/cgi/wiki?SpikeSolution), I always create a blank solution first.

As Korby shows, it is the only way to ensure that you get a parent solution folder containing child project folders. This is a good thing whether you are using the VS.NET Source Control stuff or not. I use CVS these days and it makes me a lot happier to have my folders structured this way.

Another thing that I do that I don't think many other people do (except [Brad Wilson](http://dotnetguy.techieswithcats.com/)) is to create my web projects as Class Libraries instead of ASP.NET Projects. By doing this, you get to keep the source files in the normal project file tree instead of over in the wwwroot folder. With a little bit of tweaking you can debug just fine, add all the same kinds of project files, etc. Works like a charm. (Thanks to [Brad](http://dotnetguy.techieswithcats.com/) for suggesting it.)
