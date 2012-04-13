---
layout: post
title: "TDD with PowerShell - Mocking Things"
comments: false
date: 2007-11-12 08:04:00
updated: 2008-07-06 10:44:49
categories:
 - Agile Software Development
 - Technology
tags:
 - tdd
 - powershell
 - agile development
subtext-id: e14d0590-fafc-46c1-bd73-1e695dee1295
alias: /blog/TDD-with-PowerShell---Mocking-Things.aspx
---


Recently, I've been dabbling with doing TDD in PowerShell. I think there may be a TDD Framework brewing in my head, but at this point I haven't done enough to figure out what such a framework would look like. Often I find that the functions I'm writing depend heavily on built-in cmdlets and BCL types and there can be issues mocking them out when the underlying .NET type isn't easy to mock out. This isn't so much an issue with PS as it is an issue with .NET, but since PS is very close to the edge of the world (where the code touches the user), it can be hard to mock. 

That said, as with most dynamic scripting evnironments, you can mock out a lot of things. Suppose you want to test a function that depends on get-childitem. Because functions evaluate before cmdlets, you can actually replace it by defining a function with that name: 
    
    
    function get-childitem() 
    { 
    return @()
    } 
    

Now you have a naked stub get-childitem that returns an empty array. All is good so far. Next you need a gci that returns a single FileInfoObject and for your test you want to have the "archive" bit set on this file. You try to create a new replacement function for get-childitem: 
    
    
    function get-childitem() 
    { 
    $fi = new-object System.IO.FileInfo("bogus.txt") 
    $fi.Attributes = [System.IO.FileAttributes]::Archive 
    } 
    

But at this point you discover that you can't set the Archive bit, because the file doesn't exist. 

This is actually a common problem we run into when we TDD up against another API that isn't mock friendly. In an OO language like C#, I will typically wrap it up in another class & interface that I own and then mock out the interface for my code. This is do-able in PS, but a little more complicated because you may have to implement a fair amount of extra code to create and return a PSObject that has the interface you expect to find in your calling code. (This code can be a lot smaller, but less clear if you wantΓÇª I opted for clarity): 
    
    
    function get-childitem() 
    { 
    $fi = new-object PSObject 
    $getter = { return [System.IO.FileAttributes]::Archive } 
    Add-member -inputObject $fi -memberType ScriptProperty -name Attributes -value $getter $secondValue $setter 
    Return $fi
    } 
    

The challenge with this approach is the amount of code it takes to mock out all of the parts that you need. For example, if you need the Mode script property that comes built in to PowerShell for DirectoryInfo and FileInfo, then you will have to add them to your mock. If you also need to support the setter for the Attributes property, then you will need to add that (and possibly a Note member to hold the data). 

As with all mocking exercises, this gets complicated when interacting with real things and since PowerShell is really about interacting with real things, it is hard. 

Enjoy! 

Technorati Tags: [Agile](http://technorati.com/tags/Agile/) , [TDD](http://technorati.com/tags/TDD/) , [Powershell](http://technorati.com/tags/Powershell/) , [Mock Objects](http://technorati.com/tags/Mock%20Objects/)
