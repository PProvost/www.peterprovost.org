--- 
layout: post 
title: "Deleting Hyper-V Machines FAST!" 
date: 2013-07-26 12:42
comments: true 
published: false 
categories: 
---

I use Hyper-V a lot at work. As part of how we build Visual Studio, we have a
nice system that generates VHDs each night for our mainline branches.  This is
really cool because it lets someone like me (product owner) pull fresh builds of
the whole product without me having to pull the source for all the bits and
build it myself. And since it is a ready-to-go virtual machine, a simple file
copy and some quick setup is all I need to do.

This is also nice because I work remotely (Denver) and telecommute to Redmond.
My big Hyper-V server is sitting in the corner of a colleague's office, and I
can use remote desktop to administer the server and connect to its guest
machines.

One thing I do sometimes is create a differencing disk against the original VM
and then connect to that. It costs me a bit of performance, but Hyper-V is
pretty good at dealing with that. But it lets me create different VMs against
the same underlying base image.

But this causes interesting (and annoying) problems when you decide you want to
delete the VM. For whatever reason, the Hyper-V team decided to make it such
that when you delete a machine in Hyper-V, it will leave you with a single VHD
file that represents the last state of that machine. To do that, when you delete
the VM, the server will initiate a merge process to combine the AVHD files with
the VHD files. This can take quite a while, especially if the AVHD is big.

This also occurs if you use the snapshots feature, and in fact it can be worse
because if you create a sequence of snapshots it has to merge them all, one at a
time. And this takes forever.

I think I've found a very nice solution that deletes these VMs **fast**, but it
does have a few caveats.

<!-- more -->

## You must be willing to trash the VHD

It is important to note that if you intend to keep the as-running VHD file for
use with another VM, this technique will not work. Basically that scenario is
why the slowness exists today. The Hyper-V tool assumes you do want to reuse
the machine at some point, so it merges the whole thing together before
deleting the virtual machine.

In my case I'm bailing on the whole machine. I don't care about the VHD when
I'm done. I really mean "delete", so this is perfect for me. Any files or data
I have on the machine are either in a source repo, on my SkyDrive, on a share,
or easy to backup manually.  

So this in an acceptable tradeoff for me, but if you really need to keep the
VHD after deleting the machine, you should look elsewhere for a solutions.

**WARNING: A note about Windows versions**

I've had this Hyper-V machine for quite a while. Since I'm pretty much always
using it and don't have physical access to it, I am still running Windows
2008 R2 Enterprise. If you are using a different version of Windows Server, or
are using Windows 8 Hyper-V, the specifics may be different, or this whole thing
may not even be relevant. YMMV.

## Step-by-step HOWTO

The gist of this is to detach the VHD file from the machine before deleting it.
But if you're not really experienced with Hyper-V, you may now know what that
means, so I'll take you through it step-by-step.

### Step 1 - Stop the virtual machine

Of course you need to stop the machine before messing with it.  Since you are
going to trash this machine anyway, you don't need to do a proper shutdown and
can just power it off.

Select the machine in your Hyper-V Manager and then click the Turn Off button in
the task pane on the right side. You also can right click and choose Turn Off
from the context menu.

### Step 2 - Remove the VHD file 

### Step 3 - Delete the machine 

### Step 4 - Clean up your mess
