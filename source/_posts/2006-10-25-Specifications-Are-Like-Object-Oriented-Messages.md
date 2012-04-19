---
layout: post
title: "Specifications Are Like Object-Oriented Messages"
comments: false
date: 2006-10-25 19:00:00
updated: 2007-04-18 11:22:00
subtext-id: 126583ee-db20-41a6-9f6e-30728d93ab7e
alias: /blog/post/Specifications-Are-Like-Object-Oriented-Messages.aspx
---


I don't remember when I first came up with this metaphor, but I've used it with a few people over the last couple of months and it seems hold water.

Specifications are big in software development. Requirements specifications, design specifications, message specifications, protocol specifications, etc. They are everywhere. But when you start to explore the various agile development methodologies, you will find many people claiming that specs are dead. 

I'm not so sure. In fact, I disagree. Specs are alive and well. They never went away. But something is certainly different.

Before I go there, however, let me bring you back to the 1970s and 80s and the invention of [Smalltalk](http://en.wikipedia.org/wiki/Smalltalk) and other message passing languages. The idea was that object oriented systems weren't about functions but were instead about messages. You send a message to an object and it might give you an answer.

We now often find ourselves calling these things methods instead of messages, but ultimately they are the same thing. You send a message (call a method) on a C# or Java object and you get an answer. Interestingly, this is one of the reasons that (right or wrong) we can easily map web-service operations onto modern object-oriented implementations. Service becomes object and operation+message becomes method+parameters. What could be clearer? 

_(Please don't get all carried away attacking that part, I've been a WSDL first guy for years--search my 2003 archives if you don't believe me. I'm trying to make another point here.)_

An interesting thing about a difference between web services and object oriented programming is the "chunkiness" of the information being passed. Well-designed web services typically use very chunky method calls with very little (ideally no) state expected to be maintained between calls. You fire in all the information that the service could possibly need and you get back your answer.

Interestingly, the dominant thinkers in the object-oriented space have been reaching a conclusion that is in the other direction. Smaller, simpler objects that do **_less_** with each call. Pass&nbsp_place_holder;**_less_** information, but make a lot more calls and use a lot more objects. You may have heard this called "lots of little objects". You may not agree with it from a pragmatic standpoint, but it certainly does lead to highly cohesive (single minded) objects that can be well tested and can be easily combined together in new and exciting ways.

At the one end we have web services which use chunky protocols and are not very nearby (typically on a server somewhere out there on a LAN or WAN). On the other hand we have in-process objects that are really nearby (just a pointer reference away) with whom we communicate quickly and easily in a chatty rapid fire way.

At this point I can hear you asking, "Peter, what the hell are you talking about? I thought this was about Specifications?"

I'm coming to that.

One thing that used to attract a lot of developers to Extreme Programming (XP) was the myth about "no documentation". Yes, I said myth because it is patently untrue. There is lots and lots of documentation on an XP project. It just doesn't take the same form as people were used to on a plan-driven or waterfall project.

Remember that one of the core principles of XP is the idea that the team should be physically co-located. All in the same room if you can swing it. By being all together in the same space, they can spin off design discussions whenever they need to happen. They have index cards on the wall to track features and requirements. There are lots of whiteboards around with architecture diagrams, meeting notes and every other bit of information relevant to the team. It is a chatty environment.

But when you are working with a team that is offshore, you have to do things a bit differently (even when you are doing agile development). You don't have the whole team together all the time. Your offshore team members&nbsp_place_holder;can't swing your chair around and chat with the guy next to them. They can't look at the whiteboard with the most recent architectural sketch. They need to have more information passed to them in larger chunks.

Ultimately the reasons for the communication styles used between these people are the same as those used with web services and object oriented programming. Communication is about messages. The closer together the two parties are, the richer their discussion can be. The more frequently they can talk. The easier it is for one to ask a question. But as the distance between the two parties increases, the more you have to change the way the dialogue occurs.

Move team members out of the office and you have to write a bit more of a spec for them to make sure they know what to do. Move them to another building and the spec has to get richer and more complete. Move them across the country... or around the world... and the spec had to get even more precise.
