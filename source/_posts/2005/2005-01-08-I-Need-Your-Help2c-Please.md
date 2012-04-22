---
layout: post
title: "I Need Your Help, Please"
comments: false
date: 2005-01-08 14:08:00
categories:
 - Community
 - Technology
subtext-id: 780d8e29-3509-4a79-a7a7-73fa00046c24
alias: /blog/post/I-Need-Your-Help2c-Please.aspx
---


Through [Keith Pleas](http://weblogs.asp.net/kpleas/), I'm trying to help the [IDEP Foundation](http://idepfoundation.org/) figure out some DNS problems that they are having. But the problem with DNS is that as a distrtibuted database of sorts, you can get different information from different places in the world.

So, your mission, should you choose to accept it, is this:

  1. Check today's date. If it is Jan&nbsp_place_holder;10, 2005 or earlier, then proceed to step 2. Otherwise, thanks for trying to help out.
  2. Assuming you are on a Windows machine, go download NetDig from [http://mvptools.com](http://mvptools.com/). If you are on another system, and know how to get and use dig, you should be able to follow this thread and get me what I want. If not, then thanks for trying to help out.
  3. Unzip it to a folder on your system and launch NetDig.exe (not NetDig.com). You do not need to "install" anything and you do not need to be an admistrator to do this. You should see something like this:  
  
![NetDig](http://www.peterprovost.org/Files/NetDig.png)  

  4. It should autodetect your local nameserver. If it doesn't, use "ipconfig /all" to figure out your local DNS server, and use that one in the box marked Server. Please don't use "204.127.198.4" unless that actually is your DNS server.
  5. Enter "idepfoundation.org" into the dropdown box under that one and select "ANY" in the type dropdown box.
  6. Click the Resolve button. After a second or two, you should see something like this:  
  
![Netdig2](http://www.peterprovost.org/Files/netdig2.png)  

  7. Notice, that in the Answer Section of that list I am being told that idepfoundation.org is using "dns1.whmserver.com" and "dns2.whmserver.com" for DNS. If you have any address **_other than that one_**, then proceed with step 8, otherwise go to step 9.
  8. Enter the NS record addresses (e.g dns1.whmserver.com and dns2.whmserver.com -- but not those ones) one at a time into the search box. Again, make sure the type dropdown says "ANY" and click Resolve. The output should append itself to the bottom of the textbox. Do this for each NS record you saw in the Answer Section of Step&nbsp_place_holder;6 that has "idepfoundation.org" to the left of it.
  9. Select all of the text in the big text box. Copy it to the clipboard and paste it&nbsp_place_holder;into the [contact form of my weblog](http://www.peterprovost.org/contact.aspx). Please make the subject be "idepfoundation dig results" so I can filter the responses in my mail client. If you don't mind using your real name and email address, I would appreciate it in case I need to contact you for more information about your DNS server or ISP. Also, if you can tell me where you are located (city and country), that could help as well. I promise this information will be kept in the strictest confidence and will only be used to help solve this problem.

Thanks in advance to everyone who can help. It will only take 5 minutes of your time, but may really help this group out.
