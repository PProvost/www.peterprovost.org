---
layout: post
title: "Another Interview with Michael Stuart about UIP"
comments: false
date: 2003-05-14 08:11:00
categories:
 - Technology
subtext-id: dbcf5995-34ae-463d-aeb1-15263ba7b677
alias: /blog/Another-Interview-with-Michael-Stuart-about-UIP.aspx
---


In this interview on [DotNetGuru.org](http://www.dotnetguru.org/), Michael Stuart, author of the forthcoming UIP BlueBrick, talks more about how UIP is put together and how you use it as a developer. Excellent article.

I was happily surprised to hear a few different things in this article. Primarily, I found it exciting that they carefully considered other popular MVC implementations:

> _We looked at MANY implementations and patterns, including MVC, FrontController, Observer. We looked at Struts. We looked at several very good .NET MVC?s including Maverick. Our customers wanted more than JUST MVC, they wanted us to make workflow a first-class citizen, and many of them needed an easy way to migrate win-web, web-win. Also many needed ?dehydrated tasks?. So UIP serves those needs, while also serving the core MVC needs._

I've used Maverick and I liked it. What I didn't really like was the changes that I had to make to IIS for it to work. Not always possible on hosted environments.

One of the other things I didn't like about Maverick was the dependency controllers have on HttpContext. It makes them almost impossible to test using NUnit. I still don't have any good information about testing controllers in UIP, but I will certainly let you know when I do.

Also, [BlueBricks has a GDN Workspace](http://www.gotdotnet.com/Community/Workspaces/workspace.aspx?id=ba6270ca-f1cd-4489-8232-14815f9935ac). I wonder if they're letting outsiders join yet? I'm going to try.

BTW... this site is in French, but the interview in in English. Enjoy!
