---
layout: post
title: "System.Web.UI.WebControls.Style Problems"
comments: false
date: 2003-05-20 10:18:00
categories:
 - Technology
subtext-id: 1ac74f8b-1645-4da5-baee-bfa49f99d5d3
alias: /blog/SystemWebUIWebControlsStyle-Problems.aspx
---


I am very annoyed with the implementation of System.Web.UI.WebControls.Style. It seems like it wasn't thought through very carefully. And it isn't any better in 1.1 than it was in 1.0. Let me explain...

Suppose you want to create a new ASP.NET control. Like the built-in controls, you want to use Style properties to allow the user to modify the appearance of your control. Since your control actually is just a table down under the skin, you figure that you can use the TableItemStyle class. It looks like it does everything you want, so why not?

The problem comes when you try to call SaveViewState() or LoadViewState() on your TableItemStyle fields. They are marked as "internal protected" which prevents you from calling them. TrackViewState() has the same problem.

So to get around this, I have to derive my own Style class from TableItemStyle so that I can create "protected internal new" accessors for each of these methods. These new methods just delegate to the base class, but I still have to jump through this hoop.

WHY?
