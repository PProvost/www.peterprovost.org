---
layout: post
title: "CAB Sample Visualizations Now Available for Download"
comments: false
date: 2005-12-07 13:15:00
updated: 2008-07-06 19:11:42
categories:
 - Technology
tags:
 - patterns & practices
 - cab
subtext-id: 33a920ae-76d6-4410-b078-d1cac1170c44
alias: /blog/CAB-Sample-Visualizations-Now-Available-for-Download.aspx
---


If you've been playing with the Composite User Interface Application Block, you may have found that it can be challenging to figure out what is going on inside your application at runtime. Since the entire application assembles itself dynamically using our ObjectBuilder dependency injection framework, how do you figure out what went wrong when your app doesn't come up correctly? 

We knew this would be a challenge for people so we included support inside of CAB for a thing called a Visualizer. A CAB Visualizer is a tool that runs alongside your application letting you peek under the covers of your app, **_while it is running_**. The Visualizer is a little CAB application in its own right to which you can add your own views, called Visualizations. 

Perhaps I can best illustrate this with a screenshot of our BankTeller QuickStart running with the Sample WorkItem Visualization: 

![CAB_Visualizer](/Files/CAB_Visualizer.png)

&nbsp_place_holder;As you can see, the Visualizer pops up a separate window that basically has&nbsp_place_holder;a TabbedWorkspace in it. Each visualization listed in the app.config file is loaded into its own tab. 

Once loaded, the Visualization has access to anything that is exposed in the Root WorkItem of the running CAB application. This means you can inspect the WorkItem heirarchy (as shown in this sample), subscribe to Event Broker messages, or do special domain specific things things that only make sense within your application. It doesn't matter. 

We're hopeful that the CAB community will eagerly adopt this stuff and start producing a d sharing all kinds of interesting Visualizations. 

You can [download the CAB Sample Visualizations from our codegallery site](http://www.gotdotnet.com/codegallery/releases/viewuploads.aspx?id=22f72167-af95-44ce-a6ca-f2eafbf2653c). Many thanks to [Brad Wilson](http://www.agileprogrammer.com/dotnetguy) who worked hard to get this sample done and published. 
