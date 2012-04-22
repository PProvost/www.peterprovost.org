---
layout: post
title: "BlogJet Is Working!"
comments: false
date: 2004-09-10 14:12:00
categories:
 - Technology
subtext-id: ba01da26-5f27-4044-ba2b-043e7ba79153
alias: /blog/post/BlogJet-Is-Working!.aspx
---


A couple of people posted comments to my last post suggesting that I use [Fiddler](http://www.fiddlertool.com/fiddler/) to see what's happening in the HTTP request. Fiddler was exactly the tool whose name I couldn't remember. Fiddler essentially sets up a local HTTP proxy server and reconfigures&nbsp_place_holder;your Internet Explorer proxy settings.

When I launched Fiddler, [BlogJet](http://blogjet.com/) worked. When I closed Fiddler, BlogJet didn't work.

"What the hell is going on here?" I thought.

Here is what I think happened...

Fiddler replaced my proxy settings, but didn't itself pass requests on to our internal proxy server. So when I had Fiddler running, I wasn't going through the MS Corpnet proxy servers. And BlogJet worked. When I closed Fiddler, it put my proxy settings back the way they were and BlogJet stopped working.

So I went into BlogJet and told it to use a "Custom Proxy Configuration" and then left the actual config entries blank.

And it worked. Strange, but it worked.
