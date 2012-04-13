---
layout: post
title: "Dealing With Assembly Load Failure"
comments: false
date: 2003-08-19 12:37:00
categories:
 - Technology
subtext-id: 07e34c4c-3a6e-40ff-8123-06c3cc17e4ac
alias: /blog/Dealing-With-Assembly-Load-Failure.aspx
---


[Craig Andera](http://staff.develop.com/candera/weblog2) has just [posted](http://staff.develop.com/candera/weblog2/permalink.aspx/7b6ef3e1-922a-4196-917d-6ef4b76ad9c5) an excellent [article explaining how the JIT loads assemblies](http://staff.develop.com/candera/weblog2/articleview.aspx/CLR%20Workings/Dealing%20With%20Assembly%20Load%20Failure.xml) and how you can take advantage of that to trap when an assembly is unavailable (e.g. Managed DirectX). Failure of an explicit load is obvious, but it turns out that an implicit load isn't all that different.
