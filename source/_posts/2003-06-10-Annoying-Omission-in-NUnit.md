---
layout: post
title: "Annoying Omission in NUnit"
comments: false
date: 2003-06-10 14:08:00
categories:
 - Technology
subtext-id: 2139bed9-0b49-4912-b852-3d50e4bb826f
alias: /blog/post/Annoying-Omission-in-NUnit.aspx
---


NUnit doesn't handle the C# decimal type properly. So if I do this:
    
    Assertion.AssertEquals( 10.0M,   
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; myClass.InchesToCentimeters( 3.937007874015748031496062992126M ) );

It fails, telling me
    
    expected:<10.0>  
    but was:<10.000000000000000000000000000>

Bummer. Apparently they forgot to add an override for decimal.
