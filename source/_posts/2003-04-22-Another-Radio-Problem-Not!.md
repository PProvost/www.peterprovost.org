---
layout: post
title: "Another Radio Problem... Not!"
comments: false
date: 2003-04-22 18:34:00
categories:
 - Technology
subtext-id: b69380c8-63a8-4cbd-82d0-a9219409fdae
alias: /blog/Another-Radio-Problem-Not!.aspx
---


I spent part of yesterday and today fighting what I thought was a problem with Radio Userland on my new Windows Server 2003 laptop. I would try to bring up the Desktop using [http://127.0.0.1:5335](http://127.0.0.1:5335) like normal, but it wouldn't go anyway. Even weirder than that was if I was at another page, it would just stay at the page I was on before I entered the loopback address.

Finally today I tried two new things. The first thing I did was to telnet to 127.0.0.1 port 5335. It didn't do anything until I pressed a key. Then it responded with the following HTTP Response:
    
    HTTP/1.0 200 OK  
    Content-Type: text/html
    
    <html><body onload="javascript:history.go(-1)"></body></html>
    
    Connection to host lost.

Hmmm. What the hell is sending that back? Is this some weird new tcpwrapper thingy in Server 2K3? How can I find out?

If you read my blog often, you probably saw me comment on the wonderful tools at [SysInternals.com](http://www.sysinternals.com). I went over there and downloaded their TcpView tool. Launched it and almost immediately saw that Radio.exe didn't have 5335 open at all. But another process did... it was [SharpReader](http://www.hutteman.com/weblog/2003/04/17.html#000067)!

Apparently while I was browsing through the options in SharpReader, I accidentally turned on the "Listen for Subscriptions on port 5335" option. Depending on which process grabbed 5335 first, sometimes Radio would work and sometimes it wouldn't. I turned off that option and everything is fine.
