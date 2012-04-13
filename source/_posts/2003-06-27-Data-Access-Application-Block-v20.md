---
layout: post
title: "Data Access Application Block v2.0"
comments: false
date: 2003-06-27 14:19:00
categories:
 - Technology
subtext-id: e5123d9d-b2e2-49ce-88fe-98d0183f3381
alias: /blog/Data-Access-Application-Block-v20.aspx
---


Another app block has shipped. This time it is an update to the very popular Data Access Application Block. If you are using the old one, you should consider switching to this one. If you aren't using the old one, YOU SHOULD BE.

New in this version:

  * Support for strongly typed **DataSets** with the **FillDataset** method
  * Support for committing updates to a **DataSet** back to the database
  * Additional helper methods with support for **DataRow** type parameters

  * Minor bug fixes

I especially like the strongly typed DataSet support. I always ended up doing an ExecuteDataSet followed by DataSet.Merge to get around this omission in V1. I don't know how much I'll use the rest... we'll see.
