---
layout: post
title: "Cisco VPN and Windows XP SP2"
comments: false
date: 2004-08-12 00:21:00
categories:
 - Technology
subtext-id: 4da0f1fd-5154-41c5-97d9-359a01f803d8
alias: /blog/post/Cisco-VPN-and-Windows-XP-SP2.aspx
---


I spent a couple of hours yesterday and today figuring out how to get the Cisco VPN client working with Windows XP SP2.

First of all, let me say that I have been unable to get it working over TCP, but I have been able to get it to work using UDP. Perhaps someone else can figure out the TCP stuff.

To start with, I already had the Cisco VPN Client v4.0.3(f) installed and working just fine when I installed SP2. And as expected (from when I tried it with RC2), the VPN now was unable to connect, either via TCP or UDP transport.

So I did some digging, specifically in the [release notes for the client](http://www.cisco.com/univercd/cc/td/doc/product/vpn/client/rel4_0/lin_sol/install.htm). It [mentioned](http://www.cisco.com/univercd/cc/td/doc/product/vpn/client/rel4_0/lin_sol/install.htm#1001421) a number of ports and protocols that needed to be opened in a firewall for the client to work. Although the Cisco VPN is supposed to be IPSEC, according to a [USENET post I found](http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&selm=c01814%248vq%241%40canopus.cc.umanitoba.ca), they cheated a bit and used some non-standard stuff as well.

Anyway, the readme listed the following required firewall openings:

  * UDP port 500 
  * UDP port 10000 (or any other port number being used for IPSec/UDP) 
  * IP protocol 50 (ESP) 
  * TCP port configured for IPSec/TCP 
  * NAT-T (Standards-Based NAT Transparency) port 4500

Now for the long and short of it... you can do the 1st and 2nd, but as far as I can tell, you can't do the rest from the configuration tools for the SP2 firewall.

So I went ahead and did the two that I could do. In case you don't know how to do this, go to _Control Panel -> Security Center -> Windows Firewall -> Exceptions_ and click _Add Port_. Fill out the dialog once for UDP 500 and once for UDP 10000.

But, unfortuantely, this didn't work. So I tried something that was recommended by our internal support engineer. I uninstalled the 4.0.3(f) client (new as of a month or so ago) and installed the newest version, which is 4.0.5. One reboot for the uninstall, and another for the install.

And you know what? It just works. You do have to have those two UDP ports opened up and you can only connect using the UDP transport, but it does work. This makes me very happy because I was the one at our company who went ahead and installed SP2 RC2 and it completely killed my VPN. No amound of uninstalling (both Cisco and SP2) or reinstalling (Cisco) would fix it. I had to repave.

I'm very happy it worked this time. I think if someone can figure out how to open those remaining ports/protocols/etc, then we could probably get the TCP transport working.

Or we can just wait for Cisco to release a version that supports SP2.
