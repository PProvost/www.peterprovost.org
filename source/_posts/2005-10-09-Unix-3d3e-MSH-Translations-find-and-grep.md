---
layout: post
title: "Unix => MSH Translations: find and grep"
comments: false
date: 2005-10-09 10:40:00
updated: 2005-10-13 20:19:00
categories:
 - Technology
subtext-id: da97e815-83d0-4b90-9d2a-ac83694c587d
alias: /blog/post/Unix-3d3e-MSH-Translations-find-and-grep.aspx
---


I'm sure some of the cool folks over on the MSH team have better ways to do some of these things, but I wanted to share some of the ones I use all the time.

Everyone who works on a UNIX system for very long learns how to get the **find** command to work for them. If you install the [Unix Tools package for Win32](http://unxutils.sourceforge.net/), you can have find on your Windows machine. Then, to use it to look for all occurrances of all C# files below the current directory, you would do something like this:

> MSH:1 > find . -name *.cs -print

It turns out that find has tons of other options, but 9 times out of 10, what you do is just what I showed.

Now to do that in MSH requires a little more typing, but it easier to customize, and in my mind, it is easier to a) figure out what to do and b) figure out how to change things:

> MSH:2 > get-childitem -recurse | where { $_.Name -like "*.cs" }

But there is actually a shorter way to do this:

> MSH:3 > get-childitem -include *.cs -recurse

And, in fact, this can be made even shorter when you use the default aliases and the fact that cmdlets only require enough of the switch to make it unique:

> MSH:4 > gci -i *.cs -r

Which is really not any longer than the original **find** form. All four of those options produce exactly the same output. As with most things in computers, it is a balance between clarity and simplicity. Number 4 is nice and short and very simple, but it isn't as clear as #2. You decide which you prefer.

Now suppose you aren't just looking for C# files, but you are looking for all C# files that have the string _"using System.Configuration"_ in them. I can take any of #2, #3 or #4 from above and pipe it into the match-string cmdlet. I'll go ahead and take the short form (#4):

> MSH:5 > gci -i *.cs -r | match-string "using System.Configuration;"

Now, on my system I have an alias named "grep" that points to "match-string", so I actually do it like this:

> MSH:6 > gci -i *.cs -r | grep "using System.Configuration"

Not bad, eh? I use this kind of search almost every day. I _never_ use the Windows Explorer "SearchΓÇª" thingy anymore--you know, the one with the dog? This is just so much faster to use.

Before I end, one other thing that is interesting is to see how quickly you can start to combine these things to ask different questions. Suppose your project manager comes and asks you, "How many lines of C# code do we have in the project?" First, let me show you how to get the count of C# files:

> MSH:7 > (gci -i *.cs -r).Count

That's cool, but not the answer we wanted. We want the number of lines of code. Now, for simplicity lets assume that "lines of code" means something simple like "non-blank lines that don't start with two slashes." That may not be 100% accurate, but it is certainly close enough for a swag answer.

First of all, I had to figure out the regex for this. I decided to skip the "non-blank" part in the regex and instead focus on the part about "lines that don't start with two slashes".

That got me this regex, which I went ahead and stored off into a variable called $re:

> MSH:8 > $re = "^((?!\s*//.*).)*$"

This basically says "all lines that don't start with whitespace zero or more times followed by two slashes followed by anything up to the end of the line. (FWIW, there's a part of my that thinks this regex has one too many dots but I can't seem to make it work without them.)

Now we can combine this with what we did above to count the lines that don't match the regex:

> MSH:9 > (gci -i *.cs -r | grep $re).Count

But we forgot to filter out the blank lines! Oops. Since I couldn't figure out how to do that in the regex, I did it with a where clause on the pipeline:

> MSH:10 > (gci -i *.cs -r | grep $re | where-object { $_.Line.Trim() -ne "" }).Count

Pow! That works.

But man, that was a crappy think to type in wasn't it. So let's save it off into a script file that we can reuse later. Just copy these three lines into a file called linecount.msh and put it somewhere on your path.
    
       1:  param ( [string] $match="*.cs" )
    
       2:  $re = "^((?!\s*//.*).)*$"
    
       3:  (get-childitem -i $match -r | grep $re | where-object { $_.Line.Trim() -ne "" }).Count

Again, I don't promise that this is perfect, just what I've been using lately.

Enjoy!
