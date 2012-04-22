---
layout: post
title: "How To Add a New Managed Path to Windows SharePoint Services"
comments: false
date: 2004-03-30 12:01:00
updated: 2004-05-01 11:19:00
categories:
 - Technology
subtext-id: 838d6a35-c09a-424c-87ca-dc74fb4bc62e
alias: /blog/post/How-To-Add-a-New-Managed-Path-to-Windows-SharePoint-Services.aspx
---


If you have used WSS and SPS before, then you have probaby created a "Team Site" or something under the "sites" folder. When you do that you get a URL like this:

[http://myportal/sites/myteamsite](http://myportal/sites/myteamsite)

But what if you want something like this?

[http://myportal/teamsites/myteamsite](http://myportal/teamsites/myteamsite)

It turns out this is fairly simple. To get started, open Windows SharePoint Services Central Admin. In the "Virtual Server Configuration" section click the "Configure virtual server settings" link. In the virtual server list, click the server that you want to configure. (Most people only have "Default Web Site" here.)

Now you are on the "Virtual Server Settings" page. In the section called "Virtual Server Management", click on "Define managed paths".

You should see this screen:

![](/weblog/content/binary/WSS.png)

Scroll down to the bottom of the screen to the "Add a New Path" section and type "/teamsites".

Click OK and you are done. You should now be able to create sites under /teamsites (or whatever other path you defined.)
