---
layout: post
title: "PDC - Monday Keynote"
comments: false
date: 2003-10-27 18:48:00
updated: 2004-05-01 16:32:00
categories:
 - Technology
subtext-id: f4b9e0f8-4f4d-4454-9fa7-a8e6922a5e48
alias: /blog/post/PDC---Monday-Keynote.aspx
---


Just snuck out of the keynote while Adobe was presenting... let me rehash what I saw for my five readers.

It all started with the Red vs. Blue PDC video that was released a few weeks ago. Always good for a laugh.

The BillG came out and ran through his speech. As expected, high level stuff.. good vision and all that. Bill then introduced Hillel Cooperman, PUM for the Windows User Experience team who asked, "Do you want to see Longhorn?" Of course the audience responded with a hearty yes.

Very very impressive. WinFS is very cool. The UI is beautiful (as expected). VisiCalc still works. Amazing animations and transitions. 

The coolest stuff from this demo was the WinFS demos. Open My Documents (or whatever it was called) and you see all of the documents on the system... regardless of their physical location. Start typing in the search box and the list filters as you type! He filtered it down from 1100 items to 30 as he typed "Longhorn". No waiting. Very nice. They ran a bunch of other "isn't this cool" demos, but I'm sure this info will be covered elsewhere so I'll be brief.

Jim Allchin then came out and did his "lap around Longhorn". Set up the three major components (Avalon, WinFS and Indigo) and then jumped in feet first.

Avalon:

ChrisAn and DonBox came out to do a demo after Jim described the subsystem. These two are an absolute riot. As they were setting up, they dropped a bunch of interesting non-avalon tidbits:

csc.exe ships on all builds  
msbuild.exe ships on all builds  
They started with Don (using emacs of course) creating a simple WinForms app exactly as we would right now. Empty window pops up and the world rejoices. Then they showed us XAML. XAML is like the ASPX file in a code-behind ASP.NET application. You describe the UI in the XAML file and the code goes in the CS file. Very nice. They added a quick XAML file to their app and started populating it with UI elements... buttons, text boxes, labels, a video background. They rotated it, scaled it, alpha faded it. All from the XAML file. Very cool.

Jim Allchin came back out and moved on to WinFS. After his intro, the boys came back out to do the code demos. In three lines of code they added a contact browsing common dialog to the app. The best part of all this was that Jim had to write the code. His editor of choice? gvim. :)

Before Jim could move on, Don asked his to say developer 37 times. Jim responded, "Developer thirty seven times," before moving on to his introduction to Indigo. Then the code session...

Chris and Don fired up the same app and with 3 new text boxes, one new button and about 5 lines of code made this post to Don's weblog using Indigo. Oh yeah, that's what I'm here for! They then used Indigo for some IPC by creating a side panel addin and having the weblog app post there instead. The fact that we will use the same messaging model for IPC and for web services is kick ass.

I'll post more later after I've had a chance to let this settle.
