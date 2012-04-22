---
layout: post
title: "eMbedded Visual C++ in a VPC Session"
comments: false
date: 2003-12-01 20:58:00
updated: 2004-05-01 15:58:00
categories:
 - Technology
subtext-id: 69c79f7d-9755-46bc-b059-e1729ec832bc
alias: /blog/post/eMbedded-Visual-C2b2b-in-a-VPC-Session.aspx
---


Today I installed eMbedded Visual Tools in one of my VPC Development images. The installation went smoothly. The system runs fine. 

But when you try to compile a solution, after the compilation is complete it says, "Starting Emulator Startup Server" and displays a progress indicator. 

Then an error box pops up that says, "Emulator for Windows CE will not run within another copy of Emulator for Windows CE. You just had to try didn't you?" 

I click OK and then it times out with the error message, "The Emulator Startup Server connection has failed. Please make sure Emulator Startup Server is running and retry the download by Rebuild All or Update Remote Output File(s). Also make sure that you have selected the correct platform." 

So are you telling me that Emulator for Windows CE thinks VPC is another instance of itself? This is crap. 

Does anyone know what it is checking for so maybe I can find a workaround? I really want to write some code for my Smartphone but I don't want to install the dev tools on my laptop. 
