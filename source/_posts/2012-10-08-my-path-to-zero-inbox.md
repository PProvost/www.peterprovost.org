---
layout: post
title: "My path to Zero Inbox"
date: 2012-10-08 10:38
published: false
comments: true
categories: 
---

*I know this post is probably going to make a lot of people say, "Holy crap, man.
If you need that much of a system, you get too much email." All I can say is
"Guilty as charged, but I know I'm not the only one with this problem." So if you
find this useful, great. If not, move on.*

{% img right /images/blog/2012-10-08-my-path-to-zero-inbox.jpg %}

I've long been a fan of the whole [Inbox Zero][1] idea. While the concept of
using other kinds of task lists (e.g. Outlook Tasks, Trello or Personal Kanban)
is nice, in my experience the Inbox is a much more natural place to keep track
of the things I need to do. Like it or not, a large number of us in the tech
sector use email as our primary personal project management system. I don't
think this is just a "Microsoft PM" thing, but certainly the amount of email
that happens here, in this role, makes it more the case.

<!-- more -->

Scott Hanslelman has written a few times about his rule system on his blog. In
[his most recent post on this topic][2], he classifies emails into four big
buckets:

1. Most Important - I am on the To line
2. Kind of Important - I am CC
3. External - From someone outside the company
4. Meeting invites

I tried his system for a while, but I found that I still ended up with too
many emails in my Inbox that weren't high priority for me to read, but that
I may need to find later via search.

This brings up a good point: My system depends on the idea that I will
[TRAF][3] (Toss, Refer, Act, File) the things in my Inbox quickly. Any email
which doesn't meet certain criteria (more on that in a second) will be
**F**iled by default, and if I need to I can find them later with search.

## Naming rules

My system leverages the power of Inbox rules. I use Outlook, but most email
clients (web or local) have something like them, but you may need to adjust the
specifics to your client. This system also ends up with a lot of single purpose
rules. I like this because it lets me see in the rules management UI what I
have. I tried the great big "Mailing Lists" rule before and it was difficult to
keep track of. 

Naming the rules is an important part of keeping track of it all. My general
rule naming pattern is like this:

`<action> - <criteria>`

Action is typically things like "Move" or "Don't move". Criteria is typically
things like "to:(some mailing list)". I tend to use the descriptive name of
things in the rule name rather than the email address or alias name. This,
again, helps me see at a glance my rules and the priority stack.

## How does it work?

As I said, I do this in Outlook, so it is important to understand that Outlook
will process the rules in order, from top to bottom, only stopping if a rule
says explcitly to stop.

The essence of this system is the final rule in the stack which moves
everything to an archive folder, and then the rules before which pick out what
they care about and stop the processing chain.

In Outlook, I do this with the "Stop Processing More Rules" action that has no
conditions (i.e. it matches all arriving email). To make this rule, you can't
use the simple rules creation UI. Instead click Advanced Options. Leave
everything in the conditions section blank and click Next. It will warn you
about the rule being applied to all messages, and since this is what we want,
click Yes. Then in the Actions section (2nd page) near the bottom, check "stop
processing more rules". It should look something like this:

{% img center /images/blog/2012-10-08-my-path-to-zero-inbox/Stop-Processing.png 'Outlook Rules Example Showing Stop Processing Action' %}

## Rule Priorities

Over time I've learned that my rules come in a prioritized set of groups. 

Each rule takes a look at the mail and makes a simple decision: keep it in the
Inbox, move it somewhere, or pass and let the next rule give it a try. This
means that it is worth putting a bit of thought into the priority of the rules
so you get expected outcomes from the tool.

My groups, in priority order and with an example or two, are listed below. The
final "group" only has the catch-all move rule I mentioned above. 

### 1. Pre-processing

These rules are about classification and other modifications to emails as they
come in. Unlike all the other rules, these typically **do not** end with the
"Stop Processing More Rules" instruction, but apply things like Tags,
Categories, Importance, etc.

Examples:

* **Tag Personal - from:(family)** - I don't use this right now, but if I
  wanted to color code, tag or categorize mails from my family, I would do this
  here. 
* **Tag Important - from:(my management)** - Same idea, but maybe you want
  emails from your bosses to be red.

### 2. High Priority - Always read these

These rules are the first set that actually make a decision on an email, in
this case looking for emails that I will always see in my Inbox. Any criteria
that I come up with which means to me "always read these, no matter what" goes
in this bucket. Currently, I have only two rules in this bucket. 

Examples:

* **Don't move - to:(me)** - This is the most important rule in my system, and
  typically is the second rule you create after the ending catch-all.  If I'm
  on the To: line explicitly, don't move it and stop processing more rules.
* **Don't move - Meeting invites** - I added this one after I realized that
  sometimes in my working group people will send meeting invites to one of the
  distribution or security groups I'm in, which would cause them to be caught
  by rules in the next category, and I would miss them.

### 3. Low Priority - Move mailing lists

I like to have my mailing lists taken out of my Inbox and I will scan them, 
search them, or read them when I have the time or inclination.

To do this, I have a root folder called "Mailing Lists" with subfolders
underneath. The rules in this section typically look for something in the To
line to figure out where it was sent and then move it to the appropriate
folder.  (Note that some lists may need you to look in the From or the Subject
to identify it.)

I create one rule for each target folder, which means that sometimes they may
combine different lists together because they mean the same thing (logically)
to me. An example might be if there was a TDD list and a Unit Testing list.
Odds are I would move those both to the same target folder.

Depending on how many mailing lists you subscribe to, this section may be big
or small. 

Examples:

* **Move - to:(Internal Agile Dscussion Lists)**
* **Move - to:(Some other discussion list)** 

### 4. Special CC handlers

If an email gets this far down in the rule chain, I was likely on the CC or BCC
or it was sent to a distribution list that I am on, that I don't have a rule
for. There are actually a number of cases where I do want to see an email that
gets this far, so I have special rules for those which each result in "Stop
Processing More Rules" to keep the message in the Inbox.

* **Don't move - from:(my management chain)** - This rule includes all of the
  people I consider in my management chain, all the way up to Mr. Ballmer. It
  also includes people who aren't directly in my chain of command, but who I
  consider to have equivalent importance in my email triaging. I've often
  struggled with whether to put this one in the upper Don't Move section or
  not. However, since we have a few managers here who can be VERY active on
  some of the mailing lists, putting it up there can cause it to fill your
  Inbox with stuff you might not really need to read. Most of these managers
  have learned, however, that if you really want someone to read something, you
  explicitly list them on the To line, so the rule I already have up there
  works.
* **Don't move - from:(my direct reports)** - Now that I'm a manager again, I
  like to see what my folks are saying (not as Big Brother, more as a coach).
  This rule lets me see mails where they CC me. If I wanted to see everything
  they sent, I would move this one up to the upper "Don't Move" section.
* **Don't move - from:(me)** - This is a weird one, and I'm not sure I really
  need it, but it does sometimes help me find distribution lists that I need a
  rule for.
* **Don't move - from:(family)** - My wife, kids, sister, brothers- and
  sisters-in-law, parents, etc.
* **Don't move - from:(friends)** - Other friends and colleagues whose messages
  I will read even if I'm on the CC.
* **Don't move - from:(other lists)** - A few other low-frequency mailing lists
  used internally that don't warrant their own folder.

### 5. Catch-all move

* **Move everything to archive** - This is the catch-all rule discussed above.
   It should always be last in the list.

## The results

This system has allowed me to regain control of my Inbox, and only occasionally
do I miss something important.  I have 32 rules in my system right now.  Most
of them are split evenly between #3 and #4, mostly because I like the
granularity of having each different thing in its own rule.

The downside to this is that I really depend on people to know the different
between To (read this) and CC (FYI) when they send an email.  A lot of people,
and a lot of email clients (e.g. Gmail), really don't get this and love to put
everyone but the specific person you're replying to on the CC line. This is
really a bummer because it takes a field which has meaning and degrades it to
being the same thing as the To field.

Anyway, I'm not sure if this will be useful to anyone else but those of us who
regularly get hundreds of emails a day, but if you do find it useful let me
know!

[1]: http://inboxzero.com/
[2]: http://www.hanselman.com/blog/TheThreeMostImportantOutlookRulesForProcessingMail.aspx
[3]: http://www.peterprovost.org/blog/2006/07/03/My-Outlook-TRAF-System/
