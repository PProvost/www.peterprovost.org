---
layout: post
title: "Microsoft Virtual PC 2004 Service Pack 1"
comments: false
date: 2004-10-12 14:19:00
categories:
 - Technology
subtext-id: 5bcfe0a7-015b-4ea1-a417-07641007a466
alias: /blog/post/Microsoft-Virtual-PC-2004-Service-Pack-1.aspx
---


Get it while its hot: SP1 for Microsoft VPC is available at [Microsoft Downloads](http://www.microsoft.com/downloads/details.aspx?FamilyID=b07c9ef0-265a-4237-ae3b-25bc8937d40f&DisplayLang=en).

The readme link on that page is currently broken, so here is what is new:

  * Many bug fixes
  * Command-line installation changes
  * Virtual Disk Precompactor
  * Updated Network Adapter Driver for Windows NT Workstation 4.0
  * Software Update for Shared Folders Under MS-DOS 6.22
  * Updated Virtual Machine Additions
  * Update to support TCP segmentation offloading
  * Update to support Group Policy Software Installation
  * Default performance option now set to "Run Virtual PC at maximum speed" 
  * Performance improvements for XPSP2
  * Update to allow the name of the host computer and the virtual machine name to be read from within the guest operating system
  * The hotfix described in article [833506](http://go.microsoft.com/fwlink/?LinkID=32826), which describes how Virtual PC 2004 may stop responding when a virtual machine is started

Now some of these things may be of particular interest to you, but what I'm happiest about is the Virtual Disk Precompactor.

From the readme file:

> SP1 includes Virtual Disk Precompactor, a utility that is designed to "zero out"├óΓé¼"that is, overwrite with zeros├óΓé¼"any available blank space on a virtual hard disk. 
> 
> We recommend that you use Virtual Disk Precompactor before you compact a dynamically expanding virtual hard disk. Using Virtual Disk Precompactor should result in a smaller compacted virtual hard disk. After you install SP1, Virtual Disk Precompactor.iso is located in the folder: \Program Files\Microsoft Virtual PC\Virtual Machine Additions\.
> 
> To use Virtual Disk Precompactor, you must first capture Virtual Disk Precompactor.iso. To do so, use the standard procedure for capturing .iso files. For more information about this procedure, see "To capture or release a CD or DVD" in the Virtual PC Help.
> 
> After you capture Virtual Disk Precompactor.iso, you can run Virtual Disk Precompactor by going to the CD drive of the virtual machine. To view Help for Virtual Disk Precompactor, type **precompact -help**. To run Virtual Disk Precompactor, type **precompact**.

Enjoy!
