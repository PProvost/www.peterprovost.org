---
layout: post
title: "Abstract ADO.NET"
comments: false
date: 2003-03-21 20:54:00
categories:
 - Technology
subtext-id: eac374ac-3d6a-490a-92b0-c0b1260b7299
alias: /blog/post/Abstract-ADONET.aspx
---


In response to [my earlier post](http://www.peterprovost.org/2003/03/21.html#a139) about database testing, [Jason](http://injektilo.org/) posted a comment directing me to [Abstract ADO.NET](http://abstractadonet.sourceforge.net/). This looks like it could be a pretty good project. It certainly is a step in the right direction. They seem to be focused on removing the problem with Exceptions (if you're using SqlConnection then you get SqlException, etc.) and providing a factory for creating connections. Now if they can only solve my CreateDataAdapter problem, we'll be in good shape.

If I have time, I'll add it to their code and send it back to them. We'll see...
