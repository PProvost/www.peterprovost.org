---
layout: post
title: "NAnt Build Files for Continuous Integration BoF"
comments: false
date: 2004-05-24 23:18:00
updated: 2004-05-24 23:20:00
categories:
 - Technology
subtext-id: 0e63d51c-548d-4a56-bbda-e1bd53e60ec2
alias: /blog/post/NAnt-Build-Files-for-Continuous-Integration-BoF.aspx
---


I have a few minutes tonight, so in case anyone asks, I wanted to share my barebones build files that I put together for my CI BoF tomorrow night. These are two very simple [NAnt](http://nant.sourceforge.net/) scripts that you can use with a [Cruise Control .NET](http://confluence.public.thoughtworks.org/display/CCNET/Welcome%2Bto%2BCruiseControl.NET) (CCNET) setup. One of my biggest goals when putting these together was to make them as reusable as possible. I wanted to be able to take these from one project to the next and not have to make tons of edits to get them to work. Since my demo uses [Subversion](http://subversion.tigris.org/) for source control, these files reference the SVN.EXE command line tool. If should be a simple matter to switch to a different provider.

The first one is the CCNET Bootstrapper file. The basic purpose of this file is to be the one that CCNET can use to clean, checkout and then build the project. I don't include this file in the actual project source tree. Rather it is part of the CCNET setup. It is completely parameterized so that the same file can be used for multiple CCNET projects on the same server.

> <project name="ccnet.bootstrap" default="go">
> 
> &nbsp_place_holder;<!--   
&nbsp_place_holder;&nbsp_place_holder;Required Properties - You must set the following properties before running this build script!  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;project.dir &nbsp_place_holder;The directory for the project  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;svn.url&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;The subversion URL for the source checkout  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;build.file&nbsp_place_holder;&nbsp_place_holder;The buildfile to launch to build the project (path is relative to project.dir)  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;build.target&nbsp_place_holder;The target to use when launching the build script
> 
> &nbsp_place_holder;&nbsp_place_holder;Use it like this from the command line to test it.  
&nbsp_place_holder;&nbsp_place_holder;  
&nbsp_place_holder;&nbsp_place_holder;C:\CCNet\Projects>nant -buildfile:bootstrap.build -D:project.dir=CCNetDemo -D:svn.url=svn://localhost/svn/CCNetDemo -D:build.file=CCNetDemo\CCNetDemo.build -D:build.target=go  
&nbsp_place_holder;&nbsp_place_holder;  
&nbsp_place_holder;&nbsp_place_holder;NOTE: Be careful about using relative paths in there! It can make things not work well...  
&nbsp_place_holder;&nbsp_place_holder;  
&nbsp_place_holder;&nbsp_place_holder;Once you know it works, pass those -D arguments from your ccnet.config file in production.  
&nbsp_place_holder;-->
> 
> &nbsp_place_holder;<property name="svn.executable" value="C:\Program Files\Subversion\bin\svn.exe" />
> 
> &nbsp_place_holder;<target name="go" depends="clean, checkout, build" />  
&nbsp_place_holder;  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <target name="clean">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <attrib readonly="false">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <fileset basedir="${project.dir}">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <includes name="**/*"/>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </fileset>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </attrib>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <delete>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <fileset basedir="${project.dir}">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <includes name="**/*"/>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </fileset>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </delete>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <mkdir dir="${project.dir}"/>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </target>  
&nbsp_place_holder;  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <target name="checkout">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <!-- checkout all files out of construction -->  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <exec program="${svn.executable}" commandline="checkout ${svn.url} ${project.dir}" />  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </target>
> 
> &nbsp_place_holder;<target name="build">  
&nbsp_place_holder;&nbsp_place_holder;<nant buildfile="${build.file}" target="${build.target}" />  
&nbsp_place_holder;</target>
> 
> </project>  


That is the file that is responsible for getting a fresh, clean checkout of the source tree and then lanching the master build file for that project. Here is the starting build file for my demo project.

> <project name="default" default="go" basedir=".">
> 
> &nbsp_place_holder;<!-- Project Directories -->  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <property name="results.dir" value="testresults"/>
> 
> &nbsp_place_holder;<!-- Project Properties -->&nbsp_place_holder;  
&nbsp_place_holder;<property name="solution.config" value="Debug" />  
&nbsp_place_holder;<property name="solution.file" value="CCNetDemo.sln" />
> 
> &nbsp_place_holder;<!-- Fileset Patterns -->&nbsp_place_holder;  
&nbsp_place_holder;<property name="fxcop.include.pattern" value="./**/bin/${solution.config}/*.dll" />  
&nbsp_place_holder;<property name="nunit.include.pattern" value="./**/bin/${solution.config}/*.Tests.dll" />  
&nbsp_place_holder;<property name="clean.pattern.bin" value="./**/bin" />  
&nbsp_place_holder;<property name="clean.pattern.obj" value="./**/obj" />
> 
> &nbsp_place_holder;<!-- EXE Locations -->  
&nbsp_place_holder;<property name="svn.executable" value="C:\Program Files\Subversion\bin\svn.exe" />  
&nbsp_place_holder;<property name="fxcop.executable" value="C:\Program Files\Microsoft FxCop\fxcopcmd.exe" />
> 
> &nbsp_place_holder;<!-- Primary Entry Point -->  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <target name="go">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; &nbsp_place_holder;<call target="clean" />  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <call target="compile" />&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;   
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <call target="nunit" />  
&nbsp_place_holder;&nbsp_place_holder;<call target="fxcop" />  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </target>
> 
> &nbsp_place_holder;<!-- Alternate Targets -->  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <target name="clean">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <delete>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <fileset>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <includes name="${clean.pattern.obj}"/>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <includes name="${clean.pattern.bin}"/>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </fileset>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </delete>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </target>
> 
> &nbsp_place_holder;<target name="update">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <exec program="${svn.executable}" commandline="update" />  
&nbsp_place_holder;</target>
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <target name="compile">  
&nbsp_place_holder;&nbsp_place_holder;<solution configuration="${solution.config}" solutionfile="${solution.file}"/>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </target>
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <target name="nunit">  
&nbsp_place_holder;&nbsp_place_holder;<nunit2 verbose="true" haltonfailure="true">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;<formatter type="Xml" usefile="true" extension=".xml" outputdir="${results.dir}" />  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;<test fork="true" failonwarning="true">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;<assemblies>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;<includes name="${nunit.include.pattern}" />  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;</assemblies>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;</test>  
&nbsp_place_holder;&nbsp_place_holder;</nunit2>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </target>
> 
> &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <target name="fxcop">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; &nbsp_place_holder;<foreach item="File" property="assembly.name">  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; &nbsp_place_holder;&nbsp_place_holder;<in>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;<items>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;<includes name="${fxcop.include.pattern}" />  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;</items>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; &nbsp_place_holder;&nbsp_place_holder;</in>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; &nbsp_place_holder;&nbsp_place_holder;<do>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;<regex pattern="^(?'path'.*(\\|/)|(/|\\))(?'file'.*)$" input="${assembly.name}" />  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <exec program="${fxcop.executable}"   
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;commandline="/o:${results.dir}/${file}-fxcop.xml /c /f:${assembly.name} /s"  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;failonerror="false"/>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; &nbsp_place_holder;&nbsp_place_holder;</do>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; &nbsp_place_holder;</foreach>  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; </target>
> 
> </project>

(This is all in one build file, which works for a simple setup like this, but if your build system gets more complicated you might want to consider splitting it into multiple build files and either launching them with the task or including them and calling them with the task.)

Like I said, I'm trying to make this as reusable as possible, and I may not have succeeded completely. I haven't actually used this script on a large project yet, so some of my "tricks" may not work at all. The main trick is that I am trying to get NUnit and FxCop to automatically figure out which assemblies to scan based on their assembly names. This works for my projects because we say in our coding standards that all test assemblies will be named XXX.Tests.dll. So I can run NUnit on those and FxCop on the others.

I would be very interested to hear what any of you think about these scripts.
