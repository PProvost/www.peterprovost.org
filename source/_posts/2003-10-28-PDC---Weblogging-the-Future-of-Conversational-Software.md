---
layout: post
title: "PDC - Weblogging the Future of Conversational Software"
comments: false
date: 2003-10-28 18:18:00
updated: 2004-05-01 16:31:00
categories:
 - Community
 - Technology
subtext-id: cfac2862-9eb0-41ad-9365-1ae37647b876
alias: /blog/PDC---Weblogging-the-Future-of-Conversational-Software.aspx
---


At 10pm, [Jamie](http://weblogs.asp.net/NUnitAddin/), [Paolo](http://weblogs.asp.net/pmarcucci/) and I headed to the Weblogging BOF being hosted by [Robert McLaws](http://weblogs.asp.net/rmclaws/). This was without a doubt the most lively BOF I've been in yet. I shouldn't have been surprised... the room was full of extroverted tech bloggers!

On stage were Robert, [Clemens Vasters](http://staff.newtelligence.net/clemensv/default.aspx) ([dasBlog](http://www.dasblog.net/documentation/)), and [Scott Watermasysk](http://scottwater.com/blog/default.aspx) ([.TEXT](http://scottwater.com/DotText/default.aspx)), and occasionally [Robert Scoble](http://radio.weblogs.com/0001011/). Sitting around me were [Chris Hollander](http://objective.mine.nu/), [Harry Pierson](http://www.devhawk.net/) (aka DevHawk), and many other bloggers whose names I should remember this morning, but I can't (sorry).

This discussion covered a number of topics during its official hour. There was a significant discussion about [ATOM](http://bitworking.org/rfc/draft-gregorio-06.html) vs RSS. The general consensus was that the committe based design that is going on now needs to stop and someone needs to commit. In that regard, I said to the floor, "I move that Clemens and Scott implement it as written and let's move on." The motion was moved and seconded, and passed anonymously.

Yeah, right. :)

There was also a heated discussion about how to best categorize content. [Mark Canter](http://blogs.it/0100198/) (the father of Macromedia Director) was loud and opinionated about how he felt that central servers will solve all the problems. Most of the rest of us rejected this idea. One of the things that I (and many others) like about blogging is that I have control over my content.

Clemens threw out the idea that cross-posting (a new feature in dasBlog that lets you post the same entry to multiple blog servers) would solve this problem. I think Clemens was saying that we would have servers for specific topical areas (e.g. [Longhorn Blogs](http://longhornblogs.com/)). Then if you post to that server, you are effectively categorizing your content.

Again, I'm not a big fan of this. After the meeting ended, a number of us stayed for another hour talking through the issues. Harry, Chris and I spent a lot of time thinking about how the Feed Aggregator could categorize for you. My idea is to use Bayesian filters as the engine behind what amounts to Search Folders (ala Outlook 2K3).

Say you subscribe to 2000 feeds (or if you're Scoble... 6000). You should be able to create a new filter folder called "Longhorn". Then you start dragging blog entries into it. Everytime you drag a message into the folder, the bayesian filter adds that to the good list for that folder. Conversely, if you drag a message out of a filter folder, it adds that message to the bad list. Simple to work with, easy to train and it should let you have a nice user-controlled way of organizing content. Filter folders are basically virtual views onto the actual feeds themselves, so these drag and drop operations don't cause things to move physically. They just cause the rules to update.

I think Chris and Harry liked my idea, but Chris had an even crazier idea. Can we use the links in a post to categorize it. In other words, the fact that this post links to Scoble could make your feed aggregator show you this post. You may not even subscribe to my feed. This really becomes a way of analyzing the edges of the graph instead of the nodes. My graph theory is a bit rusty, so I'll leave it to someone else to figure this out.

I'm going to play around with the Bayesian search filters. Since [SharpReader](http://www.sharpreader.net/) isn't open source, I guess I'll have to start from scratch (although I may try to do it with RSS Bandit). We'll see.

I ran out of there at 12:05am and just made the last bus at 12:15am. Fell into bed and just barely remembered to set my alarm for 6:30.

Whew. This is tiring.
