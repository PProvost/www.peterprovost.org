---
layout: post
title: "Switching the blog to Octopress"
date: 2012-04-15 16:12
comments: true
categories: 
- Community
- Technology
tags:
- octopress
- blog
---

{% img right /images/blog/2012-04-15-switching-the-blog-to-octopress/octopress-logo.png Octopress Logo %}

A week or so ago, Mark Groves mentioned to me that he was thinking about going
to a totally static blog system for his photo site. He pointed me to some of
the cool work done by the [Code 52][1] guys, particularly
[Pretzel][2] and [Markpad][3]. 

I've been a fan of [Markdown][4] for quite a while and have been using it on
[my GitHub project pages][5] for the readme content, but I'm not really sure
why I never hit upon the idea of using it for my blog posts and translating it
to HTML in a kind of a compilation pass. Editing blog posts in Vim feels very
natural to me, but I hate the idea of having to write HTML and all that crap.
Markdown is a lot more natural to write. I also like the idea of getting
off of a particular content management system / blog engine, of keeping my
content in a source control repository, and of having total freedom of hosting. 
And of course, you can't beat static HTML for site responsiveness.

<!-- more -->

Pretzel by the Code52 guys is interesting, but I decided to look at some of the
non-.NET approaches people have been taking.  Digging into it I discovered
[Jekyll][6] and then [Octopress][7].  Since I really like to understand the
internals of how things work, I started by spending a few days creating a
totally custom blog layout based solely on Jekyll and [Twitter Bootstrap][8].
That was good, and I learned a lot about Jekyll and [Liquid][9] (the templating
engine) but I realized quickly that I was reinventing a lot of stuff that
Octopress had already made easy.

Octopress turned out to be exactly what I wanted. Since it is based on Jekyll I
was able to reuse the learning I'd acquired playing with that. It uses
[Sass][10] for its stylesheet stuff (as opposed to [Less][11] which the Twitter
Bootstrap system uses), but honestly they're both good and I didn't care much
about that.

More than anything else, Octopress let me focus on the basic styling and
layout, without having to build everything from scratch. It also came with a
bunch of great Jekyll and Liquid plugins which make the actual writing of the
blog much nicer. Also the built in HTML & CSS are already HTML5-based, ready to
go with media queries and responsive layout. It uses a nice [Pygments][17] based code
syntax coloring system with the [Solarized][18] theme and has lots more nice usability
tweaks for authoring.

When it came to hosting it, there were a few interesting free choices. I could
host it on [GitHub Pages][12] by compiling the site locally and pushing the
resulting HTML to a repository. Octopress has [pretty good documentation][13]
on the process, but the process of making GitHub Pages happy feels pretty
cumbersome. The other good free choice is [Heroku][15], which has 
[much simpler deployment][14].

Heroku uses a nice model for pricing. Pay for what you use, and only for what
you use, and the lowest tier of usage is free. So hosting a static site, like
those generated from Markdown, is free unless you are getting totally pounded
by readers. If I were to ever get to the point where this blog requires more
availability (not likely), I can just scale it up and start paying for more
[Dynos][16]. Not a bad system, so I decided to go with it.

As I built the new blog, I used a bunch of tools and snippets to get what I
wanted.  The basic Octopress site wasn't far from what I wanted, but I did do a
bunch of theming to it. I also added a few new Liquid templates, some custom
@font-face CSS elements to get the styling I wanted, etc.

All up, it was a fun project, with the clear advantage of no longer being tied
to any blogging platform whatsoever. I am now, from the perspective of hosting,
nothing but static HTML. So should Heroku change their pricing model or should
something else pop up which is more interesting, it is just a matter of pushing
my HTML pages somewhere else. I like that.

It also gave me the opportunity to redesign my layout to a responsive HTML5/CSS
design, using media queries, etc. to make sure it plays nicely in devices,
tablets, etc.

Revisiting Ruby has also been interesting, but the HTML5/CSS/Javascript stuff
has been more interesting at this point in time. I've got a few blog posts
pending about some of the new VS11 stuff I've been working on, and am excited
to be doing it on this new blogging platform.

[1]: http://code52.org/
[2]: http://code52.org/pretzel/ 
[3]: http://code52.org/DownmarkerWPF/
[4]: http://daringfireball.net/projects/markdown/
[5]: https://github.com/PProvost
[6]: https://github.com/mojombo/jekyll/wiki
[7]: http://octopress.org/
[8]: http://twitter.github.com/bootstrap/
[9]: http://liquidmarkup.org/
[10]: http://sass-lang.com/
[11]: http://lesscss.org/
[12]: http://pages.github.com/
[13]: http://octopress.org/docs/deploying/github/
[14]: http://octopress.org/docs/deploying/heroku/
[15]: http://www.heroku.com/
[16]: https://devcenter.heroku.com/articles/dynos
[17]: http://pygments.org/
[18]: http://ethanschoonover.com/solarized
