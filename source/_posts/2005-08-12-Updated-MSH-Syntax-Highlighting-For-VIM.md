---
layout: post
title: "Updated MSH Syntax Highlighting For VIM"
comments: false
date: 2005-08-12 09:06:00
updated: 2008-07-06 19:38:40
categories:
 - Technology
tags:
 - powershell
 - vim
subtext-id: 1790289e-1ec2-4ca1-bb8b-30c90850b87e
alias: /blog/Updated-MSH-Syntax-Highlighting-For-VIM.aspx
---


&nbsp_place_holder;

After posting my VIM MSH syntax file on the internal Monad discussion list, I got a great reply from [Tommy Williams](http://www.tommyblogs.com/) who obviously knows more about how to tweak VIM than I do. Tommy showed me the right way to add a custom syntax file to your VIM setup without potentially screwing up your upgradability. He also added support for comments, which in itself is worth the update. Thanks Tommy! 

Here is [the new msh.vim file](/Files/msh_vim.zip). If you followed my previous instructions, then begin by undoing all of it. ![](/Files/smile1.gif)&nbsp_place_holder;Then download this new msh.vim file and follow Tommy's instructions: 

> The best explanation I can find for it in the help files is with :help runtimepath. That shows you the directories and files. 
> 
> In this case, there are two directories and three files involved: 
> 
> $VIM\vimfiles\filetype.vim  
$VIM\vimfiles\ftplugin\msh.vim  
$VIM\vimfiles\syntax\msh.vim 
> 
> Msh.vim is the file you supplied as monad.vim. 
> 
> **filetype.vim**
> 
> For me, this is just a series of blocks of the form: 
>     
>     
>     	augroup filetypedetect
>     	au BufNewFile,BufRead *.<extension>&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; setf <extension>
>     	augroup END
>     	
> 
> In the case of MSH: 
>     
>     
>     	augroup filetypedetect
>     	au BufNewFile,BufRead, *.msh&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; setf msh
>     	augroup END
>     	
> 
> **ftplugin\msh.vim**
> 
> This is a file where I set things like indenting, textwidth, etc. for that filetype: things you can't - or shouldn't - do in a syntax file. So far it's just a shell. I'll tweak it to add more options later, but it should give you a feel for things: 
>     
>     
>     	" Only do this when not done yet for this buffer
>     	if exists("b:did_ftplugin") | finish | endif
>     	" Don't load another plug-in for this buffer
>     	let b:did_ftplugin = 1
>     	setlocal tw=0
>     	"setlocal comments=#
>     	setlocal commentstring=#%s
>     	setlocal formatoptions=tcqro
>     	"setlocal iskeyword+=#
>     	" Change the browse dialog on Win32 to show mainly MSH-related files
>     	if has("gui_win32")
>     	let b:browsefilter = "MSH Files (*.msh)\t*.msh\n" .
>     	\ "All Files (*.*)\t*.*\n"
>     	endif
>     	"-------------------------------
>     	" Undo the stuff we changed.
>     	let b:undo_ftplugin = "setlocal tw< cms< fo<" .
>     	\ " | unlet! b:browsefilter"
>     	" vim: ts=4:tw=0
>     	
> 
> And, of course, the syntax\msh.vim file is the one you made. 

**Now playing:** [AC/DC](http://phobos.apple.com/WebObjects/MZSearch.woa/wa/advancedSearchResults?artistTerm=AC/DC) - [Rocker](http://phobos.apple.com/WebObjects/MZSearch.woa/wa/advancedSearchResults?songTerm=Rocker&artistTerm=AC/DC)

UPDATE 2005-08-12: [Posted it to the vim.org scripts section.](http://www.vim.org/scripts/script.php?script_id=1327)  
UPDATE 2005-08-13: I made a small change to the syntax file that fixed a problem with foreach and while. The current version is 1.2. I will also be re-posting it to the vim.org scripts board. 
