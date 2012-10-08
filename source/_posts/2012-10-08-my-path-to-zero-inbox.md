---
layout: post
title: "My path to Zero Inbox"
date: 2012-10-08 10:38
published: false
comments: true
categories: 
---

I've long been a fan of the whole [Inbox Zero][] idea. While the concept of using
other kinds of task lists (e.g. Outlook Tasks, Trello or Personal Kanban) is
nice, in my experience the Inbox is a much more natural place to keep track of
the things I need to do. I don't think this is just a "Microsoft PM" thing, but
certainly the amount of email that happens here, in this role, makes it more
the case.

Scott Hanslelman has written about his rule system on his blog. He classifies
emails into four big buckets:

1. Most Important - I am on the To line
2. Kind of Important - I am CC
3. External - From someone outside the company
4. Meeting invites

I tried his system for a while, but I found that I still ended up with too
many emails in my Inbox that weren't high priority for me to read, but that
I may need to find later via search.

This brings up a good point: This system depends on the idea that I will TRAF
(Toss, Refer, Act, File) the things in my Inbox, otherwise I will let them 
get **F**iled, and if I need to, I can find them later with search.

## Naming rules

My system ends up with a lot of different rules. I like this because it lets me
see in the Outlook Rules Manager what I have. I tried the great big "Mailing
Lists" rule before and it was difficult to keep track of.  This is, of course,
me adapting to the capabilities of my tool, but so be it.

Naming the rules is an important part of keeping track of it all. My general
rule naming pattern is like this:

`<action> - <criteria>`

Action is typically things like "Move" or "Don't move". Criteria is typically
things like "to:(some mailing list)". I tend to use the descriptive name of
things in the rule name rather than the email address or alias name. This,
again, helps me see at a glance my rules and the priority stack.

## What makes this work? Understanding the Priorities

I do this in Outlook (I can't speak for other tools), so it is important to
understand that your list of rules is executed in order, from top to bottom,
only stopping if a rule says explcitly to stop.

The essence of this system is the final rule which moves everything to an
archive folder, and then the rules before which pick out what they care about
and stop the processing chain.

The other thing is recognizing that these rules really do come in some very
natural priorities. If the last rule is the catch all, then all the previous
ones need to do the right thing at the right time. You have to pretend to be
the computer for a minutes and mentally run a mail down the stack seeing where
it gets caught (or doesn't).

This means that it is worth putting a bit of thought into the priority of the
rules so you get expected outcomes from the tool.

Generally my rules fall into a few prioritized buckets. Here are the buckets
with a few examples of the kinds of rules that are in each one.

### 1. Classification

* **Tag Personal - from:(family)** - I don't use this right now, but if I
  wanted to color code, tag or categorize mails from my family, I would do this
  here. Note that this kind of rule **does not** end with "Stop Processing More
  Rules".
* **Tag Important - from:(my management)** - Same idea, but maybe you want
  emails from your bosses to be red.

### 2. Don't move high priority

* **Don't move - to:(me)** - This is the most important rule in my system, and
  typically is the second rule you create after the ending catch-all.  If I'm
  on the To: line explicitly, don't move it and stop processing more rules.
* **Don't move - Meeting invites** - I added this one after I realized that
  sometimes in my working group people will send meeting invites to one of the
  distribution or security groups I'm in, which would cause them to be caught
  by rules in the next category, and I would miss them.

### 3. Move mailing lists

* **Move - to:(some mailing list)** - I have a root folder called "Mailing
  Lists" with subfolders underneath. The rules in this section typically look
  for something in the To line to figure out where it was sent and then move it
  to the appropriate folder.  (Note that some lists may need you to look in the
  From or the Subject to identify it.)
* **Move - to:(another mailing list)** - I create one for each target folder,
  which means that sometimes they may combine different lists together because
  they mean the same thing (logically) to me. An example might be if there was
  a TDD list and a Unit Testing list. Odds are I would move those both to the
  same target folder.

### 4. Don't move lower priority

* **Don't move - from:(my management chain)** - This rule includes all of the
  people I consider in my management chain, all the way up to Mr. Ballmer. It
  also includes people who aren't directly in my chain of command, but who I
  consider to have equivalent importance in my email triaging. I've often
  struggled with whether to put this one in the upper Don't Move section or
  not. We have a few managers here who can be VERY active on some of the
  mailing lists, so putting it up there can cause it to fill your Inbox with
  stuff you might not care about. Most of them have learned however that if you
  really want someone to read something, you explicitly list them on the To
  line, so the rule I already have up there works.
* **Don't move - from:(my direct reports)** - Now that I'm a manager again, I
  like to see what my folks are saying (not as Big Brother, more as a coach).
  This rule lets me see mails where they CC me. If I wanted to see everything
  they sent, I would move this one up to the upper "Don't Move" section.
* **Don't move - from:(me)** - 
* **Don't move - from:(family)** - 
* **Don't move - from:(friends)** - 
* **Don't move - from:(other lists)** - 

### 5. Catch-all move

* Move everything to archive

[Inbox Zero]: http://inboxzero.com/
