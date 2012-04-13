---
layout: post
title: "Quick-n-Dirty PowerShell Password Generator"
comments: false
date: 2007-06-22 22:18:00
updated: 2008-07-06 10:53:24
categories:
 - Technology
tags:
 - powershell
 - cryptography
subtext-id: e9fabd4c-ad74-4f20-a838-c8cd8d4754be
alias: /blog/Quick-n-Dirty-PowerShell-Password-Generator.aspx
---


I can't even remember when or why I wrote this, but I needed to quickly and easily generate a password for something. I typically use PasswordMinder for this, but when I wrote this I just needed to generate a whole bunch of them for someone else and didn't need to keep them in my password database. 

It is a relatively simple script that uses the RNGCryptoServiceProvider class in the System.Security.Cryptography namespace to generate the random sequence. It uses a default set of characters (see the script) and a default password length of 12. 

generate-password.ps1: 
    
    
    param( 
    [int] $len = 12,
    [string] $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_!@#$%^&*()_"
    )
    $bytes = new-object "System.Byte[]" $len
    $rnd = new-object System.Security.Cryptography.RNGCryptoServiceProvider
    $rnd.GetBytes($bytes)
    $result = ""
    for( $i=0; $i -lt $len; $i++ )
    {
    $result += $chars[ $bytes[$i] % $chars.Length ]	
    }
    $result
    

DISCLAIMER: I am not a crypto expert, so this might not be a very good implementation! It is meant to illustrate how you can do this stuff in PowerShell and not anything else. 
