---
layout: post
title: "Comment Spam Returns"
comments: false
date: 2005-03-23 09:26:00
categories:
 - Technology
subtext-id: 1362df85-0688-4e17-8e16-c9c8262d9bf7
alias: /blog/post/Comment-Spam-Returns.aspx
---


Interestingly, my CAPTCHA solution to comment spam seems not to be sufficient any more. I've seen the probing comments for the past few weeks and then this morning I got hit by two spam messages.

I need to review my logs, but the question I need to determine is: Did they get around my CAPTCHA with an OCR solution or did they come in via the CommentAPI endpoint?

I've been wondering how long it would take for the spammers to realize that the CommentAPI is a ready-built spam API. The fact that they were using HTML forms was obviously due to their lack of understanding of the new technology. But why push to a form when you can just POST and XML document to a webservice?

Once I figure out what they're doing I'll post a follow-up. If they are coming in throught the CommentAPI endpoint, then I'll have to close it down. Sorry. I will not start moderating comments. I just don't believe in that approach.
