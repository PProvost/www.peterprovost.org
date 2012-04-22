---
layout: post
title: "My Outlook TRAF System"
comments: false
date: 2006-07-03 15:16:00
categories:
 - Opinions, Politics, Rants
 - Personal
 - Technology
subtext-id: e47ab62e-5912-44d6-b2a6-b4482cb172b7
alias: /blog/post/My-Outlook-TRAF-System.aspx
---


Back when I was in the consulting world, I got a lot of email. Or so I thought. Then I came to Microsoft.

The amount of email I get here--and I'm not talking about junk mail--is unbelievable. Microsoft is an email driven culture. And that is fine, it works for the most part, but it does require adjustments to how you deal with it.

Somewhere along the way my wife taught me a system for organizing stuff that she called FAT: File, Act, Toss. It was about focusing your attention on the right things, but it always felt slightly lacking.

When I was involved in a startup, one of my business partners loaned me one of those "personal productivity" courses on CD (sorryΓÇª I don't remember which one). I spent a month or so listening to them in the car, but only some of it stuck. One of the two things that really stuck was a thing called TRAF, which re-ordered the FAT system a bit and introduced Refer as the second option in the workflow.

Putting Toss at the front felt very right to me. I'm kind of famous as a development lead for saying "nothing makes me happier than deleting code", so it shouldn't be all that surprising to find that I also enjoy deleting email.&nbsp_place_holder; So, I loosely applied it to my email, but didn't really get aggressive about&nbsp_place_holder; it. I basically kept my old way of doing things in place--lots of folders, rules, etc.--with a little bit of a prioritization system on top. And for the most part it worked.

But as my responsibilities here at Microsoft have grown, so has the volume of email I receive. As a result, the system I've been using is starting to show scaling problems. Too many folders that aren't actually helping me find things, too many items in my Inbox, and most importantly a feeling that I'm losing control of it. So I've been spending a lot of time over the past month or so talking to different people about how they organize their email.

Many people just keep a giant Inbox folder with no real plan, and depend on search and sort to find what they want. If something scrolls of the top page, it may get lost and not dealt with, but that is just how they work it. Others have very complex folder structures where every thing has a special place. [Brad Wilson](http://www.agileprogrammer.com/dotnetguy/) and I used to have frequent discussions about this stuff. Folders or no folders? Search folders or a good search engine? Categories? Unread flagging? The options are endless.

But I kept coming back to TRAF. After Brad left the patterns & practices team, he started similar discussions with a PM on his team named [George Bullock](http://blogs.msdn.com/gbullock/default.aspx). George had also spend a lot of cycles thinking about how to solve this problem and had come to his own conclusions. Apparently Brad shared some of my TRAF ideas with him and it sounds like it influenced his thinking based on [this recent blog post](http://blogs.msdn.com/gbullock/archive/2006/06/28/649950.aspx).

After reading George's post, I've been putting together a new system for myself. Unlike George, who replaces File with Follow-up, I stick with the literal definition of TRAF: Toss, Refer, Act, File. I use TRAF as a preprocessing system for managing my Inbox.&nbsp_place_holder; It is about triage--the act of sorting things into a priority list in an efficient and effective manner. From [wikipedia](http://en.wikipedia.org/wiki/Triage):

> Simple triage is used at the scene of a mass casualty incident to choose patients who require immediate transport to the hospital to save their lives as opposed to patients who can wait for help later. First aiders performing field triage on the battlefield or at a disaster site usually do not need to assess resources until transportation becomes available.

As George points out, the challenge comes with dealing with the Act part of the process. Even with this pre-processing approach there is still too many things that are in the "Act" category. So much of my process (and his) is about dealing with that problem. 

So let me show you how I have decided to implement my email triage system...

When an email arrives, it starts as an unread message in the Inbox folder. Periodically during the day, I execute the following process on the Inbox, focusing primarily on the Unread ones.

  1. Toss: Can this message be deleted? If so, then delete it. Yes, I mean deleted. As I mentioned above, I'm not one of those people who thinks I need to keep every email that is ever sent to me.
  2. Refer: Can this message be handed off to someone else? As George rightly points out in his post, this is different than having something that you must act on that requires help. This is about actually giving this problem to someone else.
  3. Act: This is my problem. I have to deal with it. There are two alternatives:
    * Immediate: It must be dealt with now. Do it and then mark it as read and move it to the Archive folder.
    * Not Immediate: Flag it with a priority flag and mark it as read. Leave it in the Inbox. Since I'm using Outlook 2007 for my email, I have the nice new Priority flags labeled Today, Tomorrow, This Week, Next Week or Custom. I don't know if I need custom or not, we'll see.
  4. File: I can't delete it, it isn't someone else's problem and I don't need to do anything, so file it away by marking it as read and moving it to the Archive folder.

That is pretty much it.

A couple of times in there I mentioned the Archive folder. Here at Microsoft we have a policy that only allows a very small amount of stuff on the Exchange server. Whether this is to encourage us to get rid of old mail or because the guys in IT don't want to deal with the disk space, I don't know. Regardless, this makes us use the Outlook Auto Archive feature aggressively.

But this system really depends on the Inbox being the place where I keep my TODO list. I don't want Auto Archive coming along and grabbing stuff that I haven't done yet and moving to my Archive.pst file. So, I introduce an Archive folder underneath the Inbox and move items there when they are ready to be filed. I configure my Auto Archive rules to process this Archive folder and to ignore the Inbox.

Astute readers will see that I don't describe any other folders in this system. That is correct. No folders. For non-mailing list mail, I've given up on folders. (For mailing lists I use Inbox Rules to move them into folders, one-per-list.)

The next part of this whole new process is about metadata tagging. If you think about the problem I was trying to solve with&nbsp_place_holder; folders, it was about having a way other than searching to find things when I need them. Search is good, but sometimes you have other information you can apply and you should be able to apply it.

New in Outlook 2007 is a unified Categories system shared between the components where items can have more than one category assigned to them easily and clearly. Just as you can easily right click on an email and assign it a flag, you can right click and assign one or more categories. So my intent is to create a set of categories to use to help me when I want to do this kind of searching.

My straw-man category list looks like this right now, but I suspect I will make changes to it once I figure out how I use it. I do know that I probably want it fairly short, but I also want it to be fairly inclusive.

  * Personal
  * Family
  * Friends
  * Projects
  * Dev Team
  * Group (p&p)
  * Division
  * Corporate
  * Public Speaking
  * Training
  * Legal
  * OOF Me
  * OOF Others

One thing to remember, and a thing that is challenging me to get this category list right, is that the category list is shared between the all the components in Outlook (mail, appointments, contacts, etc.). So it is hard to get this right. Things like the two OOF categories are for providing visual queues to calendar items, but may also be applied to emails by my team members when they tell me about their time off. (For that example, I would probably also have the Dev Team and Projects categories on the message as wellΓÇª I'm not sure.)

The thing that worries me about these categories is that I'm worried that I won't actually use them. But the plus side of this possibility is that I think the new Outlook 2007 search is very good and will suffice. Again, only time will tell. I hope I use them and I hope they help.

One other technique that I like from George's system (I'm not sure he mentioned this in his blog post) is to use Search Folders to help with all of this. Again, I'm not sure exactly what folders I'll use, but this looks like a reasonable starting point:

  * Act Today
  * Act Tomorrow
  * Act This Week
  * Act Next Week

I'm considering a search folder per category, but I'm going to hold off on that until I see if Search is good enough. I know you can do it, I just don't know if I need it.

So, this is the system I'm going to use this year. It probably seems a bit insane to use less organization for more email, but I actually think it is going to work quite well. One thing that I already see that would&nbsp_place_holder; be a nice feature (perhaps I'll write an Addin for this) is to be able to easily do a search & replace on categories. I use this in Quicken all the time when I reorganize my finances, and I suspect that will be the feature that enables me to be a bit more agile about my category list.

Questions? Comments? Fire away. I'd love to hear what you think.
