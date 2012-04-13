---
layout: post
title: "New Machine Up and Running!"
comments: false
date: 2003-04-20 18:43:00
categories:
 - Technology
subtext-id: 96a94a55-c602-44c2-bab6-230b65c68591
alias: /blog/New-Machine-Up-and-Running!.aspx
---


I spent the weekend installing Windows Server 2003 on my Dell Inspiron 8200 laptop. The initial install was wonderfully short. Once the system came up I started taking a look around.

I played with the new "Manage Your Server" screen. I have to say, this one is at least useful. I'll probably leave it enabled on actual servers, but since this laptop is actually my personal workstation, I don't really need it. I did use it to setup File Sharing and to install IIS and .NET, but that is about it.

I also considered jumping on the "don't run as an administrator" bandwagon, but given all the posts I saw a few weeks ago about certain applications not working, I decided against it.

During my first look around, I started finding things that I needed to change. Sound wasn't enabled, performance was optimized for background processing, and other fairly obvious things. Then during my hunt for the solution to the "Shut Down Tracker" problem, I found the article "[How to convert your Windows Server 2003... to a Workstation!](http://www.msfn.org/win2k3/index.htm)"

I had already found about half of the "fixes" discussed in this article, and I don't know if I ever would have found the rest. It sure made it easier to get my system back the way I was used to it in XP. But now I'm running Server, so I should be able to install/test/demo apps that require server, like Commerce Server, BizTalk Server, etc.

In addition to the many things listed in that article, I would add...

  * WinZip or WinRAR
  * AntiVirus - I was able to install Norton AntiVirus Corp. Ed. 7.51, but as with XP, I had to update the symevent file. You can get the updated file [here](http://www.symantec.com/techsupp/files/symevnt/symevnt.html). Even though it doesn't list Windows Server 2003 as supported, it worked for me. Remember to reboot after installing symevent, you should reboot.
  * Windows Messenger - If you use it, you'll have to get it from [http://messenger.msn.com](http://messenger.msn.com).&nbsp_place_holder;
  * Turn off "Reuse windows for launching shortcuts" setting in Internet Explorer | Options Advanced.

As far as applications go, I haven't had any problems yet. At this point, I have the following additional apps installed:

  * SQL Server 2000 + Analysis Services + SP3
  * Office XP + SP2 + Updates
  * SharpReader 0.9.0.1
  * Radio UserLand 8.08&nbsp_place_holder;

I'm still waiting for VS.NET 2003 to download again. I have it installed on my XP image, but like an idiot I threw away the installer. Since I'm going to make CDs for my other developers anyway, I needed to get the ISO images. Hopefully I can get them downloaded and installed tonight so I can start using this full time. So far so good...
