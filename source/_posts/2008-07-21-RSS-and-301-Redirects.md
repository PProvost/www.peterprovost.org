---
layout: post
title: "RSS and 301 Redirects"
comments: false
date: 2008-07-21 00:31:04
updated: 2008-07-21 00:31:39
categories:
 - Technology
tags:
 - http
 - blog
subtext-id: 742787b5-4c1f-4d04-9630-5b5fa3006258
alias: /blog/RSS-and-301-Redirects.aspx
---


![image](/images/blog/WindowsLiveWriter/RSSand301Redirects_1475/image_3.png) Apparently when I switched over to my new blog engine I accidentally abandoned a number of RSS subscribers. Not because I didn't do something I shouldn't have done, but because a large number of RSS readers don't do what they're supposed to do.

They don't do the right thing when presented with a 301 Redirect.

A 301 Redirect is a _permanent_ redirect. When a client is presented with one, it is supposed to do what it can to update itself do not use the old link anymore.

According to [RFC 2616 Hypertext Transfer Protocol -- HTTP/1.1](http://www.w3.org/Protocols/rfc2616/rfc2616.html), [Section 10.3.2](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html#sec10.3.2): 

> **10.3.2 301 Moved Permanently **
> 
> The requested resource has been assigned a new permanent URI and any future references to this resource SHOULD use one of the returned URIs. Clients with link editing capabilities ought to automatically re-link references to the Request-URI to one or more of the new references returned by the server, where possible. This response is cacheable unless indicated otherwise. 
> 
> The new permanent URI SHOULD be given by the Location field in the response. Unless the request method was HEAD, the entity of the response SHOULD contain a short hypertext note with a hyperlink to the new URI(s). 
> 
> If the 301 status code is received in response to a request other than GET or HEAD, the user agent MUST NOT automatically redirect the request unless it can be confirmed by the user, since this might change the conditions under which the request was issued. 

> Note: When automatically redirecting a POST request after receiving a 301 status code, some existing HTTP/1.0 user agents will erroneously change it into a GET request.

More than a year ago, I redirected [http://www.peterprovost.org/Rss.aspx](http://www.peterprovost.org/Rss.aspx) to my FeedBurner feed at [http://feeds.feedburner.com/GeekNoise](http://feeds.feedburner.com/GeekNoise). So when I moved my new blog engine over last month, I assumed nobody was using the old /Rss.aspx address.

But my good friend [Brad Wilson](http://bradwilson.typepad.com/) let me in on a tip: Lots of RSS readers, including some of the big web-based readers, **tread 301 Redirects like 302 (temporary) redirects.**

That sucks big time. The reason the HTTP protocol has 301 is to allow site publishers to deprecate old addresses in favor of new ones and if some of the major clients out there ignore it, they've taken away that ability from us. Booo!

So, if you are seeing this as my first blog post in months, you are probably still subscribing to my old feed address. Please update your address with my new address when you get a chance. Thanks.
