---
layout: post
title: "My Latest Powershell/XML Hack"
comments: false
date: 2007-02-09 20:30:00
updated: 2008-07-06 10:50:39
categories:
 - Technology
tags:
 - powershell
subtext-id: 87198009-51fa-4b25-a3ae-7f0b24be9481
alias: /blog/My-Latest-PowershellXML-Hack.aspx
---


I have a little text file I keep quotes and silly quips in. I've been collecting it for years. I recently installed a little program called Messenger Plus Live that lets you run scripts and do all kinds of other interesting things to Live Messenger. 

Long story short, there is a script for Messenger Plus that lets you have a database of quotes that rotate in your tagline in Messenger. I wanted my little text database in there, but it had its own XML file format. 

Powershell to the rescue: 
    
    
    $lines = gc 'quotes.txt'
    $dom = [xml] (gc 'quotes.xml')
    $lines | % { 
    $elt = $dom.CreateElement("sentence")
    $elt.set_InnerText($_)
    $dom.root.AppendChild($elt)
    }
    $dom.Save('quotes.xml')
    

God I love this thing! Who needs perl anymore? Not me. 
