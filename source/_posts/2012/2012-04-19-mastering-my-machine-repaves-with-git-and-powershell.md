---
layout: post
title: "Mastering my machine repaves with Git and PowerShell"
date: 2012-04-20 00:12
comments: true
categories: 
- Technology
tags:
- git
- powershell
- vim
---

## You repave how often?

I've always been someone who likes regularly rebuilding my Windows machines.
(See [this post][agile-repave-1] or [this post][agile-repave-2] for some
ancient history on this.) I know this isn't needed as much as it used to be,
but I still find myself starting to get that itch anywhere from 6-weeks to
3-months after I last flattened the box.

I'm convinced that part of this is due to my willingness to try out new apps,
hack on things, mess with my registry, try beta drivers, etc. Say what you
will... Those things make me happy! 

So rather than curtail those things, I just figure out ways to get around it.
As I like to explain to my wife, "What I really enjoy is bending computer to
my will."

<!-- more -->

Since I've been a part of Visual Studio, I've been using Hyper-V based machines
more than ever. I've been a "do your development in VMs" guy for a long time
came from my time in consulting and services). And here in DevDiv, it is faster
and easier to just pull a nice new already flattened "Windows7 + yesterday's
VS11 Ultimate" VHD than it is to reinstall VS. So that's what we all do.

(We are very fortunate that this is common enough that we have great big
servers full of these VHDs, generated by our build labs, and you can just pull
the one you want.)

But when I get to a new machine, there are a bunch of programs that I like to
have handy:

* [Git][msysgit] - For CodePlex, GitHub or just a quick little local repo and required for
  this whole process to work
* [Vim][vim.org] - my "it always works" editor
* [7-zip][7zip.org] - the only Windows zip tool you ever need
* [KDiff3][kdiff3.sf.net] - my "it always works" diff/merge tool
* [LinkShellExt][linkshellext] - show symlinks & junctions in Windows explorer

But there are also a bunch of configurations that go with those things:

* My PowerShell configuration
* My Vim configuration
* My gitconfig/gitignore files
* etc

I've tried a number of different things over the years to get this all working
but I think my current approach is finally **The One**. What I wanted to create,
and what I now have, is something as simple as this:

1. Download one thing
2. Run it
3. Win!

And I also wanted to be able to tweak it from any of my systems and have it
easily available on the others.

I like the idea of having this stuff in a single easily available location.
I've also always liked symbolic links, junction points, etc. as a way of making
things look like they are where they are expected, even if they're not.  That
probably comes from my \*NIX background, where I first learned about them. 

## Hosted on GitHub

Here's the short form of what I do with a new box: I download and install the
most recent msysgit, then I pull my dotfiles repository from GitHub, and
finally I run a couple of scripts. That's it.

Since GitHub doesn't really have any restrictions on what I put there, and
since their isn't anything private in any of these files, it is a perfect place
to host this content. The repository has three main parts: the root, the .vim
folder and the powershell folder. 

In the root I keep various "dotfiles". In the \*NIX world, configuration of
tools is almost always done by files in your `$HOME` directory that start with a
dot (which makes them hidden). Examples include files like .vimrc, .bashrc,
kdiff3rc, .gitconfig, etc.

The .vim folder is my configuration folder for Vim and Gvim. I use a vim plugin
called [pathogen][pathogen] which makes installing other plugins a snap,
because it lets the plugin maintain its own local copy of the typical vim
folder structure.  Without pathogen, you have to unpack a vim plugin's files
into their respective `syntax`, `ftdetect`, etc. folders. But with pathogen,
each *bundle* lives by itself, with its own folders, and pathogen merges them
all together for vim.

The powershell folder contains all of my PowerShell scripts, my various profile
scripts (I currently have three) and the modules that I load in. PowerShell
modules are the same kind of thing as pathogen's bundles. Each is in its own
folder and they can be loaded by your profile.

## Making it all work with symlinks and junctions

Here's where things get a little interesting. These programs expect to find
their dotfiles in your $HOME directory. Vim, in fact, will be looking for an 
entire directory (called .vim of course) there. PowerShell on the other hand
will be looking in $HOME\Documents\WindowsPowerShell.

So rather than copy things around, which would leave me in a crappy place
when it came to updating things, I use [symbolic links][wikipedia-symlink]
(and their directory counterpart on Windows called junction points). Basically
symlinks add another pseudo-entry in the file system which makes the file
appear as if it were in a new location. (This is as opposed to hardlinks
which make the file have a real entry / second name which makes the file
actually **be** at the new location. Subtly different, but different.)

What I want is for the following files to appear in the right place. (Note:
I'm using the \*NIX / PowerShell ~ to represent `$HOME` because that is
getting tedious to type.)

* $dotfiles\\.vimrc &raquo; ~\\.vimrc
* $dotfiles\\.gitconfig &raquo; ~\\.gitconfig
* $dotfiles\\.gitignore &raquo; ~\\.gitignore
* $dotfiles\\.vsvimrc &raquo; ~\\.vsvimrc
* $dotfiles\\.kdiff3rc &raquo; ~\\.kdiff3rc
* $dotfiles\\.vim &raquo; ~\\.vim
* $dotfiles\\powershell &raquo; ~\Documents\WindowsPowerShell

Fortunately, the [PowerShell Community Extensions][pscx] (aka PSCX) module for 
PowerShell provides me with a few helper cmdlets to do this. So now
I can set up those symbolic links with simple commands like these:

{% codeblock %}
PS> new-junction ~\.vim $dotfiles\.vim
PS> new-junction ~\Documents\WindowsPowerShell $dotfiles\powershell
PS> new-symlink ~\.vimrc $dotfiles\.vimrc
PS> new-symlink ~\.gitconfig $dotfiles\.gitconfig
{% endcodeblock %}

But of course I didn't want to have to remember that all the time, so 
I wrapped it up in another script that is in the same repository. (Hint:
take a look in the `/powershell/EnvSetup` directory.)

## Wrap up

If you want to see how it works, go [check out the code][my-dotfiles-repo]. It
is all in my dotfiles repository on GitHub. One of the really nice things about
this approach is that since vim pathogen and PowerShell both let me place
modules in-situ in their own folders, I can use git's submodule feature to pick
up the content, rather than cloning it into my own repository. Even pathogen
loads in via a submodule. Win!

When I want to change some config setting, like a vim configuration or a new
tweak to my PowerShell profile, I don't have to think about it. I just change
it, commit and push to GitHub. On my other machines I can just pull (or not)
and get the update. Perfect!

You can see [my dotfiles repository on GitHub][my-dotfiles-repo] to see the details.

Questions? Comments? Just ask.

[my-dotfiles-repo]: https://github.com/PProvost/dotfiles
[agile-repave-1]: http://www.peterprovost.org/blog/2005/09/23/Machine-Repave-Trials-and-Tribulations/
[agile-repave-2]: http://www.peterprovost.org/blog/2007/07/16/Another-Agile-Computer-Repave-Done/
[wikipedia-symlink]: http://en.wikipedia.org/wiki/Symbolic_link
[vim.org]: http://www.vim.org/
[7zip.org]: http://7-zip.org/
[msysgit]: http://code.google.com/p/msysgit/
[kdiff3.sf.net]: http://kdiff3.sourceforge.net/
[linkshellext]: http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html
[pathogen]: https://github.com/tpope/vim-pathogen
[pscx]: http://pscx.codeplex.com/
