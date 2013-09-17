---
layout: post
title: "HTML5 Frameworks"
date: 2013-09-17 08:29
comments: true
categories: 
- technology
- code
tags:
- html5
- jekyll
- bootstrap
- foundation
---

For a couple of weeks I've been playing around with some of the updated tools I
use to make this blog. [Back in April 2012][switching-post], I pulled all of my
content out of a server-side ASP.NET blog engine and moved to
[Jekyll][jekyllrb] and [Octopress][octopress]. Honestly, I can't see myself
going back.

But it has been more than a year since I created the current skin, and it was
time for change. Also, Jekyll has matured a lot and many of the things
that Octopress brought to the table are no longer needed. So I decided to kill
two birds with one stone and update the whole thing... generator and skin.

Of course I want a responsive layout, and for a long time my go-to framework
has been Twitter Bootstrap. But TWBS has a few issues that have started to bug
me, most notably the way it handles font-sizes. So I decided to begin an investigation
of available frameworks and toolsets.

<!-- More -->

I'm not sure if you've tried searching for "html5 template", but I will tell
you that it results in a a big list of "free, fresh web design templates".
Nothing particular interesting or useful there. A few refining searches and clicks later
landed me at the [Front-end Frameworks repository][usablica-github] owned by usabli.ca. This is
the list the search engines were failing to provide for me.

You can clone the repository if you want, but since it is really just the code
for the compare website, I would recommend you star it instead (so you know
when changes happen) and then visit the 
[CSS Front-end Frameworks Comparison][front-end-frx-compare] website itself.

{% img /images/blog/2013-09-17-html5-frameworks/front-end-frameworks-compare.png 'Screenshot' 'CSS Front-end Frameworks Compare' %}

As you can see, it gives you a nice list of the top frameworks, annotated with useful
bits like mobile/tablet support, browser support, license, etc. Great stuff and
certainly a link to keep handy.

[jekyllrb]: http://jekyllrb.com/
[octopress]: http://octopress.org/
[switching-post]: /blog/2012/04/15/switching-the-blog-to-octopress/
[front-end-frx-compare]: http://usablica.github.io/front-end-frameworks/compare.html
[usablica-github]: https://github.com/usablica/front-end-frameworks

