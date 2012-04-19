---
layout: post
title: "Solved: Bluetooth Missing from My PocketPC Phone"
comments: false
date: 2006-01-03 21:10:00
categories:
 - Technology
subtext-id: 46929803-c5d8-46cf-8b26-70ef7109ab78
alias: /blog/post/Solved-Bluetooth-Missing-from-My-PocketPC-Phone.aspx
---


Over the weekend I bought a [D-Link DBT-120 Bluetooth USB Adapter](http://www.amazon.com/exec/obidos/redirect?link_code=as2&path=ASIN/B00006B7DB&tag=peterprovosto-20&camp=1789&creative=9325) for my laptop so I could sync up my [Samsung i730 PDA Phone](http://www.amazon.com/exec/obidos/redirect?link_code=as2&path=ASIN/B000A6TRRG&tag=peterprovosto-20&camp=1789&creative=9325) with my latop without a cable. I mean, what's the point of having Bluetooth in your phone if you don't use it for things like this, right?

Once I got that working, it became much easier to install software. Immediately, I installed a few games, [Microsoft Pocket Streets and Trips](http://www.amazon.com/exec/obidos/redirect?link_code=as2&path=ASIN/B000AOBSTS&tag=peterprovosto-20&camp=1789&creative=9325),&nbsp_place_holder;and of course, [Microsoft Voice Command](http://www.amazon.com/exec/obidos/redirect?link_code=as2&path=ASIN/B0007A5XDM&tag=peterprovosto-20&camp=1789&creative=9325). (Voice Command is a _must have_ application for PocketPC Phones and SmartPhones. Seriously. Get it.)

Then today, while I was driving home, I tried to enable BT on the phone so I could use my headset and it wouldn't enable. At a stop light, I went into Settings | Connections and when I chose Bluetooth, it gave me this error:

**_There is no bluetooth hardware installed on this device._**

"Ummm. What?" I thought. I started getting a little concerned that my new phone was broken already, only slightly reassured by the insurance that I bought with it. But I'm a geek and I'm male, so I didn't go to the store to ask for help... I went home.

I tried soft resetting the device and that didn't help. I was pretty sure a hard reset would fix it, but I really didn't want to do that quite yet, as that would mean starting from scratch, reconfiguring and reinstalling everything. No thanks.

Tonight, after the kids were in bed, I started digging a little further and found [the answer over on pdaPhoneHome.com](http://srvsys.com/~pph/forums/showthread.php?s=&postid=358811). It turns out the problem has to do with Voice Command. 

Fixing it is actually pretty straightforward:

  1. Go to Settings | Personal | Voice Command and disable Voice Command by unchecking the box
  2. Soft reset the phone. When the phone comes back up, BT will be working fine.
  3. Go back into Settings | Personal | Voice Command and re-enable Voice Command
  4. From what I can tell, it should stay working until the phone is hard cycled again (battery dead or battery switch)

From what people have said online, it may have to do with VC loading before BT. I've seen other people say that it is caused by having too many DLLs in memory. Even others have said that it happens when you have too many plug-ins installed in the Today screen, but I only have the stock ones that came with the phone.

Regardless, this worked for me. So if you're having this problem, give it a try and see if it helps.
