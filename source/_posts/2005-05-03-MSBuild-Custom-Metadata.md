---
layout: post
title: "MSBuild Custom Metadata"
comments: false
date: 2005-05-03 22:49:00
updated: 2005-05-03 22:11:00
categories:
 - Technology
subtext-id: 1f69501c-db50-409c-ba16-2917c17c8c0f
alias: /blog/MSBuild-Custom-Metadata.aspx
---


Before coming to MS, I wrote a bunch of general purpose NAnt scripts to help people do things like [automate their builds](http://www.peterprovost.org/archive/2004/05/24/1295.aspx), [set up CC.NET](http://www.peterprovost.org/archive/2004/06/18/1515.aspx) and other fun things.

Of course, you have to imagine that I couldn't just sit here and not explore MSBuild a bit here and there.

So while putting together a bootstrap MSBuild file for our build server, I discovered a cool feature I wish NAnt had had "back in the day": Custom Metadata.

Suppose I want to create a target called UnitTest that called NUnit-Console.exe on a number of assemblies. Also assume that for various reasons, I can't use wildcards to figure out which assemblies to use. I have to specify which specific assemblies I want it to run against.

One more thing, I want the tests to run with the current working directory set to the bin\Debug directory for that test assembly.

In NAnt, I would have had to use <foreach> and a number of other nasty property constructs, but in MSBuild it is a simple as this. (Please note the line numbersΓÇª I have manually wrapped some lines to make them fit on the page better.)
    
       1:  <?xml version="1.0" encoding="utf-8" ?>
    
       2:  <Project DefaultTargets="BuildAll" 
    
                   xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    
       3:      <PropertyGroup>
    
       4:          <NUnitExe>&quot;C:\Program Files\NUnit V2.1\bin\nunit-console.exe&quot;</NUnitExe>
    
       5:          <NUnitArgs>/nologo</NUnitArgs>
    
       6:      </PropertyGroup>
    
       7:  &nbsp_place_holder;
    
       8:      <PropertyGroup Condition="!Exists('$(Configuration)')">
    
       9:          <Configuration>Debug</Configuration>
    
      10:      </PropertyGroup>
    
      11:  &nbsp_place_holder;
    
      12:      <ItemGroup>
    
      13:          <TestAssembly Include="Microsoft.Practices.ComponentModel.Tests.dll">
    
      14:              <WorkingDirectory>$(MSBuildProjectDirectory)\UnitTests\ComponentModel
    
                           \bin\$(Configuration)</WorkingDirectory>
    
      15:          </TestAssembly>
    
      16:          <TestAssembly Include="Microsoft.ApplicationBlocks.CompositeUI.Tests.dll">
    
      17:              <WorkingDirectory>$(MSBuildProjectDirectory)\UnitTests
    
                           \CompositeUI\bin\$(Configuration)</WorkingDirectory>
    
      18:          </TestAssembly>
    
      19:      </ItemGroup>
    
      20:      
    
      21:      <Target Name="BuildAll" DependsOnTargets="Clean;Compile;UnitTest" />
    
      22:  &nbsp_place_holder;
    
      23:      <Target Name="Clean">
    
      24:          <MSBuild Projects="CompositeUI-CS.sln" Properties="Configuration=$(Configuration)"
    
                       Targets="Clean" />
    
      25:      </Target>
    
      26:  &nbsp_place_holder;
    
      27:      <Target Name="Compile">
    
      28:          <MSBuild Projects="CompositeUI-CS.sln" Properties="Configuration=$(Configuration)" />
    
      29:      </Target>
    
      30:  &nbsp_place_holder;
    
      31:      <Target Name="UnitTest" DependsOnTargets="Compile">
    
      32:          <Exec ContinueOnError='true' Command='$(NUnitEXE) $(NUnitArgs) @(TestAssembly)'
    
                       WorkingDirectory='%(WorkingDirectory)' />
    
      33:      </Target>
    
      34:  </Project>

Pretty cool, eh?

The "trick" is in the UnitTest target. The @(TestAssembly) tells MSBuild to do that task once for each item named "TestAssembly" in the above <ItemGroup>. The %(WorkingDirectory) says to pull the WorkingDirectory metadata element from the specific TestAssembly item that is being used for that task.

That is very cool. I think I may be able to find all kinds of interesting uses for this kind of custom metadata. I certainly don't think I could have written the same funtionality in NAnt with a script this short.

Also, there is a bunch of built-in, so called "[Well Known Metadata](http://msdn2.microsoft.com/library/ms164313(en-us,vs.80).aspx)" documented over in MSDN. Check it out.
