---
layout: post
title: "DasBlog To .TEXT Conversion Complete!"
comments: false
date: 2004-05-01 02:04:00
updated: 2004-05-01 02:10:00
categories:
 - Technology
subtext-id: 54270283-9d5b-4fc2-a0a4-ee23610f5784
alias: /blog/post/DasBlog-To-TEXT-Conversion-Complete!.aspx
---


Whew. Swimming lessons tomorrow morning with my 2 year old are going to be tough (it is 2am now), but I got it done. It all appears to be working. So if you were aggregating my old RSS feed, your reader should have been given a permanent redirect to the new one. Any links to the old dasBlog permalinks should redirect to the new .TEXT permalinks. And I think I got all the content, comments and yes.. even my blog roll.

I have a few things that I would like to share with anyone who is going to attempt this, and a few bugs and annoyances that I discovered along the way.

  * I really suggest you use a VPC to mock up the whole thing. Create a hosts file on the VPC that maps your URL to 127.0.0.1 and you can test it all from the local box and not have to commit to your real server. This is a good technique any time you are migrating a web app and is yet another reason that I recommend using VPCs for development. 
  * I found a strange config entry for .TEXT that you have to use if you are doing a single blog config, at the site root, with a site that has a www at the beginning. It is called <UseWWW> and without it, it won't work. Why?&nbsp_place_holder; I don't know. 
  * I finally found the logout bug in Dottext.Web.Admin.WebUI.Page.Logout(). It turns out that somewhere in there it calls HttpContext.Current.Session.Abandon() and since sessions are disabled in the web.config, that line causes a NullReferenceException. 
  * Although my imported worked like a charm, I had to move a lot of content around (and probably will continue to do more over the coming days). Boy it sure would be nice if the .TEXT Admin pages let you convert a blog entry into an Article. They are essentially the same in the DB so why not? 
  * I wrote a little command line tool (not nearly as user friendly as the blog importer) that imports OPML (aka blogroll) into a links category. Nothing fancy but it works.

Whew. That'll do for now. Like I said, I'll post the code tomorrow.

Please add a comment to this entry if you find any bugs, errors or anything you think I should know about.

Time for sleep.
