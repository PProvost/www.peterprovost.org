---
layout: post
title: "Speeding Up Vista Boot Time"
comments: false
date: 2008-06-20 12:06:00
updated: 2008-10-02 16:00:26
categories:
 - Technology
tags:
 - vista
subtext-id: 2ebd9c76-1366-4ded-be9c-56e4612f324d
alias: /blog/Speeding-Up-Vista-Boot-Time.aspx
---


_UPDATE Oct-02 2008:_   
Apparently this is misleading at best, and at worst wrong. Here is what has been explained to me: The setting adjusted in Step 3 below can only LIMIT the number of processors available to Windows. And if the box is unchecked, it will use the default which is ALL of your processors. Makes sense when I think about it. **So as long as that box is unchecked, you are using all your procs.** As was said to me: "You can easily check this by setting all those things, rebooting the machine and looking at the performance tab in task manager. It will show you how many cores the system sees." Thanks to everyone who cleared this up!

Found this little gem while looking for something else... thought I'd share it. 

> When you have a computer with a recent model CPU, chances are it's a dual-core CPU. Both Intel & AMD have been producing dual core CPU's for a few years now. By default, Windows Vista will only use a single core during boot-up. You can easily change this from the System Configuration utility: 
> 
>   1. In Vista's Start Search type msconfig & hit the [Enter] key on your keyboard 
>   2. Once System Configuration has started, select the Boot tab and click the Advanced Options button   
[![image](http://www.peterprovost.org/Files/SpeedingUpVistaBootTime_C506/image_thumb.png)](http://www.peterprovost.org/Files/SpeedingUpVistaBootTime_C506/image.png)
>   3. In the BOOT Advanced Options dialog, check the "Number of processors" check box, and choose 2 (or 4 if you have quad core) for the number of processors.   
[![image](http://www.peterprovost.org/Files/SpeedingUpVistaBootTime_C506/image_thumb_4.png)](http://www.peterprovost.org/Files/SpeedingUpVistaBootTime_C506/image_3.png)
>   4. Click OK twice. 

Done and done. :) 
