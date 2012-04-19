---
layout: post
title: "HttpContext and the [ThreadStatic] Attribute"
comments: false
date: 2003-05-23 08:11:00
categories:
 - Technology
subtext-id: 43377bab-8ab2-43de-81ff-7862c9069631
alias: /blog/post/HttpContext-and-the-ThreadStatic-Attribute.aspx
---


Scott Hanselman writes:

> _Don't slap a [ThreadStatic] attribute on a static member when you're operating within ASP.NET as chances are you don't control the thread life...you inherit a worker thread. ThreadStatic gives you thread local storage, not HttpContext local storage! If you need to store something away to be used later in the same HTTP request, think about my favorite ASP.NET class, the little-known and not-used-enough System.Web.HttpContext.Current.Items (aside: great _[_article_](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnaspnet/html/asp01242002.asp)_ by _[_Susan Warren_](http://swarren.net/)_ on Context). In ASP.NET your code is run on a WorkerThread from the 25 or so threads in the default ASP.NET worker thread pool and the variable that you think is "personal private to your thread" is personal private...to you and every other request that this worker thread has been with. Under load you may well find your variable modified._[[Scott Hanselman](http://radio.weblogs.com/0106747/2003/05/23.html#a320)]

It is quite amazing to me how few people know and use HttpContext.Current.Items. I first found it while digging through the internals of Maverick.NET (I think), and have kept it on the top shelf of my ASP.NET toolbox ever since.

Scotts comments about [ThreadStatic] and static members are worth noting by everyone doing real development in ASP.NET.
