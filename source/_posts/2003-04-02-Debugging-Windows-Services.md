---
layout: post
title: "Debugging Windows Services"
comments: false
date: 2003-04-02 23:37:00
categories:
 - Technology
subtext-id: 2bb2102c-d812-4c0e-8e65-17298181076f
alias: /blog/Debugging-Windows-Services.aspx
---


I have to say that debugging Windows Services in VS.NET is certainly much easier than it was in VC++, but I still wish it was easier. If you need to do it, here are a few tricks:

  1. You can't use F5 to run it. Bummer. Makes debugging the startup code a bitch.
  2. Make sure the Server Explorer window is available. You will use it a lot when working with services and the event log.
  3. In Server Explorer, expand the Services Node and right click on your service. Choose Start.
  4. Use Debug | Processes to attach to your service. You may have to check the "Show system services" checkbox depending on how your service is installed.
  5. Any breakpoints you've set in your service should work now.
  6. Remember to Stop your service before building the project or it won't be able to overwrite the .EXE.
  7. You can view the event&nbsp_place_holder;log from the Server Explorer. One thing that is really nice is that the tree automatically has one node per Event Source, so if you used your own (and you should), it makes your messages easy to find. The bad thing is that is doesn't have a very nice view for seeing the message text. If it is long, you'll get annoyed and launch Event Viewer.

Playing Now: Chevelle - Point #1
