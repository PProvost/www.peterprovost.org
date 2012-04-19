---
layout: post
title: "More Maverick.NET Comments"
comments: false
date: 2003-02-27 19:42:00
updated: 2004-05-05 14:16:00
categories:
 - Technology
subtext-id: 652da24d-1702-4f07-ba43-0d10e63083a7
alias: /blog/post/More-MaverickNET-Comments.aspx
---


I posted a [comment](http://pinetree-tech.com/mtapp/mt-comments.cgi?entry_id=220) to both [News from the Forest](http://pinetree-tech.com/weblog/) and [BSTR blog](http://dotnetweblogs.com/Bcoverston/Default.aspx)&nbsp_place_holder;asking how others who were playing with Maverick.NET are doing Unit Testing. [Justin](http://pinetree-tech.com/weblog/archives/2003/02/27.shtml#unit_testing_mavericknet_controllers) and Ben both suggest having the Maverick controllers be lightweight wrappers around the real controller, which you can test.

I had considered this and knew it would work, but what I really wanted was a way to test the actual Maverick Controller using NUnit in a test-driven development environment.

So I spent a few hours today exploring the idea and ran into many roadblocks. The first thing I did was (attempt) to create a Mock Object replacement for Maverick.Flow.IControllerContext and System.Web.HttpContext. Using [DotNetMock](http://sourceforge.net/projects/dotnetmock)&nbsp_place_holder;the IControllerContext Mock Object was a no-brainer, but, you can't make one for HttpContext because it doesn't derive from an interface and it is sealed.

But it doesn't really do much itself. It actually just builds up and contains the Request and Response objects (as well as other stuff, but that isn't really important to this discussion). It has two constructors, the one used by ASP.NET (I think) and one that takes an HttpWorkerRequest.

HttpWorkerRequest is an abstract class, so I thought I might have a chance here. I created a Mock Object (again using [DotNetMock](http://sourceforge.net/projects/dotnetmock)) that implemented the abstract members and fired it up. Didn't work. Added some more members... still didn't work. I was getting an exception inside of HttpRequest.get_Params(). Bummer.&nbsp_place_holder;Did some browsing in Anakrino and haven't really found the answer yet. At this point, I'm not sure if it is worth it. Unless someone else thinks it is worthwhile I'll probably not take this any further.

So know I have to decide if I really want to use Maverick or if I will continue to expand my homegrown MVC technique (which by the way supports complete unit testing of the Controllers). We'll see...
