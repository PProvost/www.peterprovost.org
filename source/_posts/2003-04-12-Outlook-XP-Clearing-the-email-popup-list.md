---
layout: post
title: "Outlook XP: Clearing the email popup list"
comments: false
date: 2003-04-12 07:26:00
categories:
 - Technology
subtext-id: ee017197-5e5b-4b50-a047-66d2d0f887e3
alias: /blog/Outlook-XP-Clearing-the-email-popup-list.aspx
---


Have you ever accidentally sent an email to the wrong person? Maybe you have a guy in your office named Jim but sometimes when you try to send him email it goes to some other Jim that you once sent email to? If you look closely, you may even notice it when you type Jay in the To: field in your Outlook XP email message.&nbsp_place_holder;A little popup window comes up that shows all of the people who match what you've typed. 

This has proven very annoying for me at least twice. So I hunted the registry, hoping to find where this list is... no luck. Then after much digging on Google, I found the answer. It is called the Outlook Nicknames file. Somewhere on your drive, probably in the same folder as your profile file, there is a file called <profilename>.NK2. All you have to do to clear that popup list is shutdown Outlook, delete (or rename) this file, and restart Outlook.

It works like a charm.
