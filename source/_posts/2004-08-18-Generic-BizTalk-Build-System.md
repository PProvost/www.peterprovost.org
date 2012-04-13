---
layout: post
title: "Generic BizTalk Build System"
comments: false
date: 2004-08-18 09:42:00
updated: 2004-08-18 09:02:00
categories:
 - Technology
subtext-id: 4f4b5b4e-b0ed-4a63-a63e-116e1b1a4623
alias: /blog/Generic-BizTalk-Build-System.aspx
---


I was really excited when I first saw [Scott Colestock's NAnt build system for BizTalk 2004](http://www.traceofthought.net/PermaLink,guid,2e018262-cc86-4830-bdc6-871dfb1af51e.aspx)&nbsp_place_holder;project (and [the update](http://www.traceofthought.net/PermaLink,guid,df02e4ab-590c-409c-8de9-8f54776de595.aspx)). It was exactly the kind of thing I was looking for on my project.

But I've been working with NAnt for quite a while and didn't really like a few things he'd done. No biggie, everyone has their own style, so I re-wrote it one night.

Conceptually this build script is the same as Scott's, with two major differences:

  1. It uses a generic build include file driven from a project specific property file
  2. It supports mutiple projects for each project type (i.e. Schema, Map, Orchestration, etc.)

I really like to make my build systems property driven. Ideally, I shouldn't even have to scroll down a project build file to change its behavior. I think I accomplished that with this build file.

Here is a sample project property file. Assume that we have a solution named Sample.sln and that this file is called Sample.sln.build:

<?xml version="1.0" encoding="utf-8"?>  
<project name="Sample" default="compile">

&nbsp_place_holder;<include buildfile="tools/biztalk.build" />

&nbsp_place_holder;<!-- These properties are comma separated lists of project names -->&nbsp_place_holder;  
&nbsp_place_holder;<property name="schema.project.dirs" value="Sample.Schema" />  
&nbsp_place_holder;<property name="map.project.dirs" value="Sample.Map" />  
&nbsp_place_holder;<property name="orchestration.project.dirs" value="Sample.Orchestration" />  
&nbsp_place_holder;<property name="component.project.dirs" value="Sample.Component" />  
&nbsp_place_holder;<property name="pipeline.project.dirs" value="Sample.Pipeline" />

&nbsp_place_holder;<!-- "Most dependent" is first.&nbsp_place_holder; Keep this list up to date with your actual orchestrations! -->  
&nbsp_place_holder;<property name="orchestration.dependencies" value="Sample.Orchestration.InboundPO,Sample.Orchestration.OutboundInvoice" />

</project>

As you can see, I have pulled all of the dependent information from the main targets file (tools/biztalk.build) and put them in this file. Now when I need to work on a new BizTalk project, I only have to update six lines.

The targets file is way too big to show here (download is below), but the main thing it does differently from Scott's is to use the <foreach> task in NAnt to process multiple projects of each type. The only place I was unable to continue this pattern was in the "remove.ports" target, but I think I could do it with a custom NAnt task written in C#. Since that target is only called by "undeploy.pipelines" and since I don't have any pipelines yet, I leave this as an exercise for the reader. (Although I would love it if you sent me the code.)

I hope you all find this as useful and I do. Many props to Scott Colestock for his wonderful trailblazing on this stuff.

The ZIP file [GenericBizTalkBuild.zip (11KB)](http://www.peterprovost.org/Files/GenericBizTalkBuild.zip) contains the build files and VBS scripts needed for this. Remember, just like with Scott's system, you must [bootstrap your bindings file](http://www.traceofthought.net/PermaLink,guid,67b98ddc-95c3-48a0-bc0c-91adb95a381b.aspx) by doing a traditional deployment and then exporting a binding file!

Enjoy!

**Now playing:** A Perfect Circle - The Package
