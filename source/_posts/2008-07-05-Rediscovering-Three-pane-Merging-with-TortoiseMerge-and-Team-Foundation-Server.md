---
layout: post
title: "Rediscovering Three-pane Merging with TortoiseMerge and Team Foundation Server"
comments: false
date: 2008-07-05 14:58:05
updated: 2008-07-06 09:37:26
categories:
 - Technology
tags:
 - tfs
 - tortoisesvn
 - vsts
subtext-id: 1709b11a-a3fd-4bed-804d-014f7c5f0dca
alias: /blog/post/Rediscovering-Three-pane-Merging-with-TortoiseMerge-and-Team-Foundation-Server.aspx
---


I find that merging without a real 3-pane merging tool is painful at best. When I was a Subversion user, I always used TortoiseMerge, the merge tool that comes with TortoiseSVN. Now that I'm in VSTS, I've been using the merge tool that comes with TFS, which is 2-pane, or BeyondCompare2, which is also 2-pane, and I don't like it very much.

I started out playing with KDiff3, which I used a long time ago. It is okay, but it has some strange usability issues that don't make it a natural fit for me. I really like the diff/merge tool that comes with TortoiseSVN, so I decided to figure out how to use it.

Step 1 was figuring out how TortoiseMerge works. The [TortoiseSVN docs have an Appendix](http://tortoisesvn.net/docs/release/TortoiseMerge_en/tme-automation.html#tme-automation-basics) that tells all the command line switches for it:

Command Description

/?
Shows a dialog box with the most important command line switches.

/help
The same as /?. 

/base
Specifies the _base_ file used in three way diffs. This is the common ancestor of the files being diffed, although it is not shown in a separate window. For two way diffs, this is the left file. 

/basename
The name of the base file. This is shown in the view title instead of the file path. For three way diffs it is shown in a tooltip for the view title. 

/theirs
Specifies the _theirs_ file used in three way diffs, displayed in the left pane. 

/theirsname
The name of the theirs file. This is shown in the view title instead of the file path. 

/mine
Specifies the _mine_ file used in three way diffs, displayed in the right pane. For two way diffs, this is the right file. 

/minename
The name of the mine file. This is shown in the view title instead of the file path. 

/merged
Specifies the resulting _merged_ file used in three way diffs. This is the filepath where the result of the merge/conflict resolving is saved. If this is not set, then TortoiseMerge will ask the user where to save the result. 

/mergedname
The name of the merged file. This is shown in the view title instead of the file path. 

/patchpath
The path where a patch should be applied to. If you don't set this path, then TortoiseMerge will try to find the path itself to match the paths in the patch file, but that can take _very long_. 

/patchoriginal
The name of the original file to patch. Used for the view title. 

/patchpatched
The name of the resulting patched file. Used for the view title. 

/diff
The path to the patch/diff file to apply to a directory. 

/oneway
Forces TortoiseMerge to start with the one-way view instead of the view the user specified in the settings. 

/reversedpatch
Switches the left and right view of the specified two files to diff. 

/createunifieddiff
Creates a unified diff file (patch file) of two files specified with /origfile:"path_to_original_file" and /modifiedfile:"path_to_modified_file". The target path is set with /outfile:"path_to_resulting_patchfile". If /outfile is not set, a file save dialog is shown so the user can choose the location to save the patch file. Note: If /createunifieddiff is set, all other parameters are ignored. 

The next step is to figure out what the command line substitutions are for the TFS tools. [James Manning wrote a post](http://blogs.msdn.com/jmanning/articles/535573.aspx) on his blog that tells what the tokens are:

  * %1 = Original file (in diff, the pre-changes file, in merge, the "server" or "theirs" file, the file that is the base file after "their" changes were applied) 
  * %2 = Modified file (in diff, the post-changes file, in merge the "yours" file - the base file with "your" changes applied) 
  * %3 = Base file (in the 3-way merge operation, the file which both "theirs" and "yours" are derived from - the common ancestor. This doesn't mean it's the version the changes were based from, since this may be a cherry-pick merge) 
  * %4 = Merged file (The output file for the merge operation - the filename that the merge tool should write to) 
  * %5 = Diff options (any additional command-line options you want to pass to your diff tool - this comes into play only when using "tf diff /options" from the command-line) 
  * %6 = Original file label (The label for the %1 file) 
  * %7 = Modified file label (The label for the %2 file) 
  * %8 = Base file label (The label for the %3 file) 
  * %9 = Merged file label (The label for the %4 file) 

Combine those together and we can easily get what we need. You may need to adjust the command path if your TortoiseSVN installation is somewhere else.

**Compare   
**Command: C:\Program Files\TortoiseSVN\bin\TortoiseMerge.exe   
Arguments: /base:%1 /mine:%2 /basename:%6 /minename:%7

**Merge   
**Command: C:\Program Files\TortoiseSVN\bin\TortoiseMerge.exe   
Arguments: /base:%3 /mine:%2 /theirs:%1 /basename:%8 /minename:%7 /theirsname:%6 /merged:%4 /mergedname:%9

To set this up, you first need to install TortoiseSVN to get the merge tool installed. Then you can either follow the instructions on MSDN for adding them via the UI (tip: use .* as the extension to use it with all file types) or you can put them directly into the registry with something like this:

Windows Registry Editor Version 5.00   
  
[HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\9.0\TeamFoundation\SourceControl\DiffTools\.*]   
  
[HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\9.0\TeamFoundation\SourceControl\DiffTools\.*\Compare]   
"Arguments"="/base:%1 /mine:%2 /basename:%6 /minename:%7"   
"Command"="C:\\Program Files\\TortoiseSVN\\bin\\TortoiseMerge.exe"   
  
[HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\9.0\TeamFoundation\SourceControl\DiffTools\.*\Merge]   
"Arguments"="/base:%3 /mine:%2 /theirs:%1 /basename:%8 /minename:%7 /theirsname:%6 /merged:%4 /mergedname:%9"   
"Command"="C:\\Program Files\\TortoiseSVN\\bin\\TortoiseMerge.exe"

So far it is working pretty well, but I'll have to give it a try with some real merge scenarios and see how it holds up.
