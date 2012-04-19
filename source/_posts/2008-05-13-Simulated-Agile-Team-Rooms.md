---
layout: post
title: "Simulated Agile Team Rooms"
comments: false
date: 2008-05-13 11:32:00
updated: 2008-07-04 22:59:27
categories:
 - Agile Software Development
tags:
 - disbursed development
 - team rooms
subtext-id: 55f164e1-00fe-491f-b23a-ca839933b784
alias: /blog/post/Simulated-Agile-Team-Rooms.aspx
---


_Today on an internal agile alias, a discussion came up about simulating agile team rooms for disbursed teams. I've played around with this for years and had some suggestions for them:_

* * *

It can be simulated, but it is hard and requires extra discipline by the team. A few key things: 

  1. Think about how to simulate the "in the room" experience where you can overhear and participate in conversations going on around you? Team void chat software like Ventrilo, Team Speak or our own Corporate Conference Calling system can work. Can you have an "open mic" in the team room? You also can give up on audio and use team room chat software like IRC. I've used them all. There are plusses and minuses to each. 
  2. Think about the changes you may need to make to development practices. Do you use Pair-Programming and TDD? If so, you may want to take a look at [Micro-pairing](http://www.peterprovost.org/archive/2006/08/07/18053.aspx) as a technique for coordinating the TDD/Pair handoffs. (Micro-pairing was actually created in response this exact scenario. I was pairing with another developer who was remote.) 
  3. In addition to practice changes, think about how to deal with remote desktop sharing. Live Meeting works, but can be a bit heavy. Virtual Server and the standalone Virtual Server client actually let two people connect to the same desktop. I know that VNC, an open source remoting tool, also allows this, but I would recommend you to be cautious with that tool. It has some known security bugs and your network admins may not allow it. Check with them first.
  4. Make sure everyone on the team has all the necessary access they need to be a full team member. Access to version control, portals, file shares, email aliases, etc. all must be available. 
  5. Think carefully about how you do your team meetings. When you have only 1 or 2 people who are remote and the rest of the team is in a room, the person on the far side WILL feel out of the loop unless you run the meeting as if everyone were remote. One thing I've heard of is to actually have everyone go into their individual offices and dial-in to the meeting so everyone is on an equal footing. 
  6. Drastic time zone differences can make this very very hard on some team members. Ultimately this can be make-or-break for successful disbursed teaming. If people are 8 hours apart, when do you schedule standups and IP meetings? My rule of thumb is that more than 3-4 hours apart will kill you and you should split it into two teams that are closer in time to each other. 

These are based on 3-4 years of playing around with these concepts at P&P. YMMV. 
