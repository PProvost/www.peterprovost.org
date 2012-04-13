---
layout: post
title: "FTP Server in .NET"
comments: false
date: 2003-03-11 14:59:00
updated: 2004-05-05 14:38:00
categories:
 - Technology
subtext-id: 63c6e923-39e6-4132-bdfc-1d558e888461
alias: /blog/FTP-Server-in-NET.aspx
---


Has anyone out there found a complete FTP server in .NET (C# preferred)? One of my hobbies is [trading live music](http://etree.org/) (Phish, WSP, etc.) and I've been thinking about setting up an FTP server. Most people in this space use Linux to do it, but I wanted to use Win2K, since I have a few boxes handy and prefer to code in C# instead of PHP and Perl.

What I really want is a free FTP server that uses a database for login/password information. The FTP server in IIS uses AD for authentication and that doesn't work for what I want to do. I found [this one ](http://www.c-sharpcorner.com/internet/FTPServerinCSharp.asp)on [C-SharpCorner.com](http://www.c-sharpcorner.com/), but it is missing a few important things... namely REST.

My idea (and that of others in the LAMP world) is to have a website where people can sign-up for a login. Once they have a login, they can request access to download a particular show. They then have&nbsp_place_holder;n days to download the show. During that time, the ONLY files they have access to are those shows. Once the time expires, they can request another show.

This way I can give out tons of good music and not have to manage it by hand. I know that [Kael Fischer](http://www.kael.org) is working on an [Apache/Perl/Python implementation](http://www.sourceforge.net), but I really want to do one in .NET.
