---
layout: post
title: "A Few Final Comments About the Unit Testing Thing..."
comments: false
date: 2004-06-14 22:43:00
updated: 2008-07-06 14:17:37
categories:
 - Technology
 - 
tags:
 - tdd
 - vsts
subtext-id: 2fe62787-ad22-46f2-aa2f-71f55371ac06
alias: /blog/A-Few-Final-Comments-About-the-Unit-Testing-Thing.aspx
---


So this thing got a lot more traction that I thought it would. It started out as [a discussion between friends](http://dotnetguy.techieswithcats.com/archives/004174.shtml) on the sidewalk. Then I made a blog post, and now I've got almost 100 comments on my blog and other people posting about it on their own. 

A lot of people are saying a lot of interesting things, and I want to address some of them directly. But before I do, I want to say a few things about my motivations here. 

**_My Motivations_**

I love Visual Studio. I have been a user since the first version of a product with that name. I used Microsoft QuickC and VB before that. I've always liked the developer tools that MS has produced. 

And I still do. 

In fact, **_I absolutely love what I see in Team System_**. That is why I have such strong feelings about this. I want it to be even better. To me, the things that really make Team System amazing are not that they are integrating unit testing tools, static analysis tools or performance testing tools. We have all of these tools now, and thanks to [Jamie Cansdale](http://weblogs.asp.net/nunitaddin), we have many of them integrated into the IDE. That isn't what makes Team System great. 

What makes Team System great is the **_TEAM_** part of it. The workflow. The methodology integration. The Project Manager stuff. The integration with the Whitehorse designers. That it includes components for thinking about how the infrastructure works. That is has issue tracking and routing. That it has an enterprise-class version control system (regardless of what I think about lock-edit-commit). That is has an amazing looking data warehouse and reports to tell you what is going on inside your team. 

That is what makes Team System great. Not integrated unit testing. Or static analysis. Or performance testing. 

And I would completely expect to pay more for all of those wonderful features. I would probably expect to pay a lot for all of those features. And while I may want to get them for free in my MSDN subscription, I can understand why that may not be reasonable from a cost center perspective. 

But as so many commenters and posters have said, unit testing is a core development activity. It is something that a single college kid working at 2am in his dorm room should be doing. It is also something that a large team of developers working on an enterprise sized business application should be doing. The latter group could probably use some of the interesting reports and workflow, while the former just needs a test runner. And I firmly believe that for unit testing to be as pervasive as it needs to be, we have to have a consistent toolset shipping with all versions of the product. 

A final motivation for me in all of this is that I strongly believe that unit testing is hard. It is misunderstood. It is not actually used by the majority of developers in the world. I do a lot of speaking and training in the Rocky Mountain region, and you would be amazed how often I have to show people what unit testing is. They haven't even heard of NUnit. And these people are making mission critical business applications! So the core of this final motivation is that I want everyone to see unit testing in front of them from the moment they start programming in .NET. It may not save the world, but it should at least help lots of developers write better code. 

Now let me address some of the comments I've seen out there in the past 24 hours... 

**_Is Unit Testing Enough?_**

[Scott Densmore writes](http://blogs.msdn.com/scottdensmore/archive/2004/06/13/154829.aspx): 

> Peter Provost has started a grass roots movement (aka petition) here to include Unit Testing in all the versions of Visual Studio. 
> 
> Now seeing that I am an Microsoft Employee, I feel I must put in my 2 cents to defend the position of only including this in Visual Studio Team System.&nbsp_place_holder; Programming is hard, I don't think anyone disagrees.&nbsp_place_holder; Unit Testing is one way to increase code confidence and reduce bugs.&nbsp_place_holder; There are many other practices to help us (developers) make our code / products better.&nbsp_place_holder; This is the goal of Team System: integrate these practices (Unit Testing, Stress Testing, Static Analysis, Work flow, Source Control, Code Coverage) so we can me more productive and better developers.&nbsp_place_holder; So if all you want is Unit Testing is it because that is all you are doing? I doubt it.&nbsp_place_holder; The integration is what makes Team System the price of admission. 

I hear you Scott, unit testing is not a panacea. But it is an important tool that all developers should have. We have it now. We will have it later (one way or another). 

But in fact you and I agree on your last point too... the integration of all of that (developer tools + team and workflow process tools + data warehousing/reporting + version control) is what makes Team System cool. That very integration and reporting and traceability is what makes me willing to pay for Team System. Not everyone needs all of that team process&nbsp_place_holder;stuff, but I think everyone does need good unit testing and static analysis tools. 

**_But Why?_**

[Philip Reick posts](http://philiprieck.com/blog/archive/2004/06/13/258.aspx): 

> Now, don't get me wrong, I want it there for all versions too.&nbsp_place_holder; But saying "Microsoft should put this feature in all versions" is like saying "Macromedia should include flash mx with dreamweaver". 

Actually, Philip I have to disagree with you there. I think your analogy is broken. I think it would be more accurate to say that this is like "Macromedia should include a script debugger for ActionScript in FlashMX," which is, of course, a valid statement. You can't really do efficient development in Flash without a good debugger (trust me... I tried in some of the older versions). And you can't be expected to do good development in Visual Studio without integrated unit testing&nbsp_place_holder;(hence the success of NUnitAddin). 

Philip continues: 

> So, let's give them actual reasons that they can use to justify it to the bean counters and shareholders that expect them to make more and more money.&nbsp_place_holder; Here's mine: 
> 
>   1. Adding unit test capabilities to VS2005 (all versions) will help reduce software bugs in applications running under windows.&nbsp_place_holder; Anytime an application crashes under windows, customer perception of Windows' stability is reduced, and a possible support call to MS' PSS can occur.&nbsp_place_holder; Fewer problems caused by third-party applications means higher customer satisfaction and reduced support costs. 
>   2. Higher community good will will encourage defectors from the Java camp to .net (yes, they happen regularly, really!) More .net development means more software that runs on Microsoft platforms.&nbsp_place_holder; More microsoft platforms means a higher chance of more Microsoft applications as well. (Office&nbsp_place_holder;2003 on OSX? but what about Office&nbsp_place_holder;2003 on Windows XP?)&nbsp_place_holder;&nbsp_place_holder; Adding unit tests to all versions of VS2005 will help community goodwill.

Damn straight! Now we agree again. 

**_What Will You Give Up?_**

[Mike Gunderloy posts](http://www.larkware.com/Articles/TheDailyGrind396.html): 

> ΓÇªit doesn't seem to me that anyone is asking the right question: what are you willing to give up to get this? Microsoft doesn't have unlimited resources, and they can't just shove more stuff in the sack without something spilling out the other end. The Team System people aren't even going to have all their bits in the next VS 2005 beta, which says to me that they're already overloaded. So: are you willing to have all of VS 2005 slip to get unit testing in the base packages? Are you willing to give up X other new sexy feature so resources can be reallocated? Do we even know enough about the architecture of Team System to know how much work would be involved in pulling out just the unit testing portion? Having unit testing everywhere is a nice thing, but I don't think a petition in advance of the facts is really all that productive. 

If this whole thing does nothing more that raise awareness of unit testing, then I will consider it a success. I am planning to use Team System regardless of whether unit testing is included in the lower versions or not. For me, and the teams of developers I work with, the **Team Development Tools** that make Team System powerful are worth it.! 

But I have to take issue with your question about how much work would be involved in pulling out the unit testing portion. There really would be no good reason to assume that the test attributes are all that different from the NUnit ones. There also is no good reason to assume that the test runner is all that complicated either, although this argument is a little less strong. We have heard the product team say that the static analysis tool is effectively just an integrated FxCop, so that isn't a big deal either. I could be wrong, but since the Team System team was effectively building on top of the Whidbey IDE and not working as a part of that team, I would expect that it is all pretty modular. 

**_Conclusion_**

That's enough. I think I'm done with my bitching and complaining about the tool that I love. I'm sure I will love whatever they ship. I know I will use all that wonderful stuff. If they don't listen to what all of my commenters have said, then so be it. Some people will still have to use NUnit and FxCop. Oh well. Things could be worse. 
