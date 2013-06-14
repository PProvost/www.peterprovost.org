---
layout: post
title: "Deleting Hyper-V Machines FAST!"
date: 2013-05-23 12:42
comments: true
categories: 
---

I use Hyper-V a lot at work. As part of how we build Visual Studio, we have
a nice system that generates VHDs each night for our mainline branches. 
This is really cool because it lets someone like me (product owner) pull
fresh builds of the whole product without me having to pull the source
for all the bits and build it myself. And since it is a ready-to-go
virtual machine, a simple file copy and some quick setup is all I need to
do.

This is also nice because I work remotely (Denver) and telecommute to
Redmond. My big Hyper-V server is sitting in the corner of a colleague's
office, and I can use remote desktop to administer the server and connect
to its guest machines.

One thing I do sometimes is create a differencing disk against the original
VM and then connect to that. It costs me a bit of performance, but Hyper-V
is pretty good at dealing with that.

But that causes and interesting (and annoying) problem when you decide you
want to delete the VM. For whatever reason, the Hyper-V team decided to
make it such that when you delete a machine in Hyper-V, it will leave you
with a single VHD file that represents the last state of that machine. To
do that, when you delete the VM, the server will initiate a merge process
to combine the AVHD files with the VHD files. This can take quite a while,
especially if the AVHD is big.

This also occurs if you use the snapshots feature, and in fact it can be
worse because if you create a sequence of snapshots it has to merge them
all, one at a time.
