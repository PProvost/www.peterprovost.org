---
layout: post
title: "Tojan.QHosts"
comments: false
date: 2003-10-06 19:55:00
updated: 2004-05-01 17:23:00
categories:
 - Technology
subtext-id: f769e8b1-7c39-4537-9ba4-35a44cf55fec
alias: /blog/post/TojanQHosts.aspx
---


So I was up in Vail working through a breakout session (with a mild hangover from the night before) when my dad calls.

"I can't get to Google. I can get to a bunch of other sites, but I can't seem to get to Google? Did you mess up my networking?"

He asked this last bit because when he was at my house I had to tweak his wireless to get him on my network. But I didn't do anything other that add a SSID and WEP-key to his wireless config, and since he could get to some sites but not others, it couldn't be that.

So we went 'round and 'round and finally I had to go back to my meeting. Later in the day he found a post by someone telling him to delete the hosts file in C:\Windows\Help. This solved his problem.

This morning I discovered [what it was that was causing this](http://story.news.yahoo.com/news?tmpl=story&cid=74&e=3&u=/cmp/20031003/tc_cmp/15201201)... another damn virus/worm/trojan/malware.
