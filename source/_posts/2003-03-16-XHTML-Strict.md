---
layout: post
title: "XHTML Strict"
comments: false
date: 2003-03-16 21:53:00
updated: 2004-05-05 14:45:00
categories:
 - Technology
subtext-id: 5b622acb-3337-4353-bcd4-05f75b9e05b0
alias: /blog/post/XHTML-Strict.aspx
---


I must say that I really like XHTML strict. Sure, it is a little harder to create designs layed out by graphic designers, but once you learn a few simple techniques, you can solve it.

The most important thing to understand is that XHTML Strict will not let you put **_ANY _**formatting in your markup. You must put it in CSS. So, here are&nbsp_place_holder;a few tricks:

  * Understand the [float CSS attribute](http://www.htmlhelp.com/reference/css/box/float.html)
  * Split up your stylesheets into logical modules and link then in as needed (e.g. site.css, home.css, etc.) 
  * Understand the [difference between the various CSS selectors](http://www.htmlhelp.com/reference/css/structure.html#syntax). For example, if you are used to thinking in a OO fashion, element class selectors are like setting defaults to an existing class (element or otherwise); ID selectors are like setting properties in your own class 
  * Understand [pseudo-classes and pseudo-elements](http://www.htmlhelp.com/reference/css/structure.html#pseudo). They don't all work in IE, so know which ones work for your target audience. 
  * If you are having problems check to make sure you understand [cascading order](http://www.htmlhelp.com/reference/css/structure.html#cascade).

Good luck!
