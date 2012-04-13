---
layout: post
title: "dasBlog to .Text Converter"
comments: false
date: 2004-04-12 07:42:00
updated: 2004-05-01 11:15:00
categories:
 - Technology
subtext-id: 9cbb41c9-734f-4099-9c20-cd03bbdc5d95
alias: /blog/dasBlog-to-Text-Converter.aspx
---


I've almost finished my dasBlog -> .TEXT converter. It currently handles all of the entries, plus categories├é and comments, quite nicely. Now I'm trying to decide how to handle permalinks. 

As far as I'm concerned, there are two kinds of permalinks here. Internal permalinks are the ones where I am linking from one post to another. External permalinks are where you, my readers, link to my posts. 

My first thought had been to fix the internal permalinks by looking for the pattern in the dasBlog posts and replacing them. The code for that is rather simple, but there is a problem getting .TEXT entry IDs without saving them once and I don't really want to have to hit the database twice... one to INSERT and get the ID and then a second time to update the content with the fixed permalinks. 

So instead I'm thinking about writing an HTTP handler and registering it on the original dasBlog path. This way I will solve both the internal and external permalinks problem and my converter will be simpler. 

If anyone else is going to be doing this kind of conversion and it interested in helping me test this code, drop me a line. 
