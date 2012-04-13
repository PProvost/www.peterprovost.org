---
layout: post
title: "Annoyed by Dates in RSS Feeds"
comments: false
date: 2005-07-21 23:05:00
categories:
 - Opinions, Politics, Rants
 - Technology
subtext-id: 775d43d5-46b4-4135-9d42-3188cc540c24
alias: /blog/Annoyed-by-Dates-in-RSS-Feeds.aspx
---


I've wanted to complain about this before, but I didn't. But then today I lost my Omea Reader database and had to start over with my RSS feeds.

I knew I was caught-up with my feeds as of about noon today, so after reloading my OPML file (you should always remember to keep a backup of that) and then sync-ing my feeds, I selected everything older than noon and marked them as read.

You'd think I would be done, right? No. Instead of the 26 or so posts that had come in since noon, there were more than 60 unread posts. The extra ones all had their dates set to the date when I sync-ed them.

Why? It turns out that it is caused in part by my reader ([Omea Reader](http://www.jetbrains.com/omea) 2.0 RC) and in part by people not generating very good RSS.

As far as I can tell, Omea Reader doesn't seem to grok the <dc:date> element (from the [Dublin Core Metadata Initiative](http://dublincore.org/)). Or if it does, the feeds in question aren't sending good date data. I'm not sure which. I suppose Omea should probably handle the Dublin Core stuff (I'm going to post to their newsgroup and ask), but my real question is&nbsp_place_holder;why people use it when RSS 2.0 has elements for this purpose? FWIW, [Mark Pilgrim claims he does it to respect prior art](http://diveintomark.org/archives/2003/06/21/history_of_rss_date_formats), but personally I think that is silly. (Probably not as silly as Omea not supporting Dublin Core, but silly nonetheless.)

Sure, that part can probably be blamed on my aggregator. Surprisingly, however, there are famous people out there who don't use either date element in their feeds. Why don't they take the extra time to help ensure that their feeds are complete? I don't know. The teenage girl down the street blogging about her cat has her feed set up correctly, but these gentlemen can't get it right? It doesn't seem likely given that I have books on my bookshelf, books in the "recommended reading" list on this blog in fact, that were written by the people I'm talking about. So do you. I guarantee it. 

I know this is not really important in the grand scheme of things, but it annoys me.
