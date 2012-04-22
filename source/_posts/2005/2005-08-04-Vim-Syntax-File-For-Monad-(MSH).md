---
layout: post
title: "Vim Syntax File For Monad (MSH)"
comments: false
date: 2005-08-04 23:33:00
updated: 2008-07-06 19:37:42
categories:
 - Technology
tags:
 - powershell
 - vim
subtext-id: 3bfc98e8-349d-4e0d-a55d-0630492baac4
alias: /blog/post/Vim-Syntax-File-For-Monad-(MSH).aspx
---


As you probably know, I'm becoming a Microsoft Command Shell (aka Monad, aka MSH) junkie. I'm also a vim guy, and I was sorely missing syntax highlighting for my MSH files in my general purpose text editor. 

So I wrote one. Here is it.. in all its glory. This is my first ever syntax file for Vim, so I'm sure it could be improved. Send me any improvements you make, and I'll update it. 

To use this file, first save it to the same directory as your other syntax files (C:\Program Files\Vim\vim63\syntax on my system). Then edit your _vimrc file (in your profile directory) and add the following lines to the bottom: 
    
    
    au BufRead,BufNewFile *.msh set filetype=monad
    au! Syntax monad source $VIMRUNTIME\syntax\monad.vim
    

The next time you open a .MSH file, you should see colors. Woo hoo! (I'm sure [Hanselman](http://www.hanselman.com/blog/default.aspx) has already done one for Notepad2, but I don't use that. ![](/Files/smile1.gif)) 

UPDATE: Apparently the link was broken. I turned it into a ZIP and now it works. 

**UPDATE: This post is obsolete. Please see **[**this post**](/archive/2005/08/12/6812.aspx)** for an updated version and some better instructions.**
