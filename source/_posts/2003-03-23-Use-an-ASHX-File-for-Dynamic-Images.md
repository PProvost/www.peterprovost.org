---
layout: post
title: "Use an ASHX File for Dynamic Images"
comments: false
date: 2003-03-23 21:00:00
categories:
 - Technology
subtext-id: 8bb8cfea-9be9-4673-b65b-47f5e147ee67
alias: /blog/post/Use-an-ASHX-File-for-Dynamic-Images.aspx
---


In [this post](http://dotnetweblogs.com/Whaggard/posts/post.aspx?ID=4180)&nbsp_place_holder;Wes proposes to store images&nbsp_place_holder;as resources in an assembly. He shows a simple ASPX file that extracted the image from the assembly and send the data back to the client. Using it, you can create <img> tags like this:
    
    <IMG&nbsp_place_holder;src="image.aspx?asm=<AssemblyName>&img=<namespace>.testimage.gif"&nbsp_place_holder;/>

There are two things that I don't like about this. The first one was posted by [Yves](http://dotnetweblogs.com/Yreynhout/): I don't really like telling people that much about how my stuff is written. By viewing a URL, people can figure out the name of an assembly on my machine. Don't really like that, but it can easily be solved by using keys into your config file so the URL looks like this instead:
    
    <IMG src="images.aspx?key=<assmKey>&img=<namespace>.testimage.gif" />

The second thing that I don't like about Wes' solution was that it used a ASPX file when it wasn't needed. Remember that ASPX files derive from System.Web.UI.Page, which provides all kinds of extra stuff for rendering a page full of HTML content (and webcontrols, etc.). Since the requirement is to return a stream of bytes representing an image file, it seems silly to derive it from a class that does something completely different.

The answer is to use an ASHX file. ASHX files are HTTP handlers written using .NET. Basically you can think of them as .NET ISAPI Extensions, except that they are much, MUCH easier to write. For more information about using ASHX files for images, read [this great little article](http://www.devhawk.net/articles/imagehandler.aspx) on [Harry Pierson's DevHawk](http://www.devhawk.net/).
