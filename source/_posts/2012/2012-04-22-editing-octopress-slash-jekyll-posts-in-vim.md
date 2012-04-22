---
layout: post
title: "Editing Octopress/Jekyll posts in Vim"
date: 2012-04-22 02:26
comments: true
categories: 
 - Code
tags:
 - blogging
 - vim
 - markdown
 - jekyll
 - octopress
---

I use [Vim][6] as my day-to-day, non-IDE text editor. Yeah, I know everyone is in
love with Notepad2, Notepad+ or whatever the new favorite on the block is. I've
been a vi/vim guy for ages and am not gonna change.

Since switching my blog to [Octopress][5], I've been writing all my posts in Vim.
Vim does a nice job with [Markdown][7], but it doesn't know anything about the other
things that are often used in a [Jekyll][9] markdown file.

The two big things are:

1. It gets confused by the [YAML Front Matter][8]
2. It can go nuts over some of the Liquid filters and tags

Fortunately Vim has a nice way of letting you add new things to an existing
syntax definition. You just create another syntax file and put it in the
`after` directory in your `~/.vim` directory. Then you just add the new syntax
descriptors and restart Vim.

For the first problem, I found a [blog post by Christopher Sexton][10] that had a
nice regex match for the YAML Front Matter. He has it included in his
[Jekyll.vim plugin][2] (which I don't use, but it is pretty cool).

A quick catch-all regex for Liquid tags and another for backtick code blocks
and it works pretty damn well.

Here's the code:

{% codeblock markdown.vim %}
    " YAML front matter
    syntax match Comment /\%^---\_.\{-}---$/ contains=@Spell
    
    " Match Liquid Tags and Filters
    syntax match Statement /{[%{].*[}%]}/
    
    " Match the Octopress Backtick Code Block line
    syntax match Statement /^```.*$/
{% endcodeblock %}

I do think it would be cool if I could do a few other things:

1. Actually use YAML syntax coloring in the Front Matter. I'd like not to have
   to reimplement the YAML syntax to accomplish this, but from looking at the
   way the HTML syntax works for javascript, I may have to.
2. Build in understanding of the [Octopress codeblock tag][4] and disable
   Markdown syntax processing within it.

It also has a three line ftplugin tweak to force markdown files to use
expandtab and use a 3 character tabstop. Since I typically keep tabs (I don't
have expandtab in my vimrc) and since Markdown actually uses the spaces to mean
things, this just works better. If you don't like that part, just delete the
file.

If you want to use it, I recommend using pathogen and then clone the [GitHub
repository][3] into your bundle folder. 

[1]: http://octopress.org/docs/plugins/backtick-codeblock/
[2]: https://github.com/csexton/jekyll.vim
[3]: https://github.com/PProvost/vim-markdown-jekyll
[4]: http://octopress.org/docs/plugins/codeblock/
[5]: http://octopress.org/
[6]: http://www.vim.org/
[7]: http://daringfireball.net/projects/markdown/
[8]: https://github.com/mojombo/jekyll/wiki/yaml-front-matter
[9]: https://github.com/mojombo/jekyll
[10]: http://www.codeography.com/2010/02/20/making-vim-play-nice-with-jekylls-yaml-front-matter.html
