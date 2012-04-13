---
layout: post
title: "Command Line Parser using XmlSerializer"
comments: false
date: 2003-04-10 19:05:00
categories:
 - Technology
subtext-id: 88c484b3-e676-4e95-8fd8-900f2e9cae6e
alias: /blog/Command-Line-Parser-using-XmlSerializer.aspx
---


This is an interesting approach. I've been using XmlSerializer for a number of interesting things lately, but this one is very interesting. Here Jamie parses the command string using regex, then uses XmlWriter to create the XML infoset. Then using XmlSerializer, he can populate a custom class that exposes a nice, easy-to use interface. Very cool.

And, of course, as Jamie suggests, this could also work for parsing URLs and query strings.
