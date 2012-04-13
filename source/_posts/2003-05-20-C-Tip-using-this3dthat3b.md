---
layout: post
title: "C# Tip: using this=that;"
comments: false
date: 2003-05-20 19:43:00
categories:
 - Technology
subtext-id: 6cb76380-d726-4b6a-b918-6ab73aecdf09
alias: /blog/C-Tip-using-this3dthat3b.aspx
---


Here's something I didn't know I could do in C#:
    
    using webctrls = System.Web.UI.WebControls;  
    ...  
    protected webctrls.Label label1;

Cool. Don't need it much with the BCL, but sometimes you can get an occasional name ambiguity with 3rd party libraries and this can make it a little easier to deal with.
