---
layout: post
title: "CTS200 - Connected Systems: Service Orientation and the Windows/.NET Developer"
comments: false
date: 2004-05-24 14:13:00
updated: 2004-05-27 18:14:00
subtext-id: fdefb73d-4b04-40ff-803c-ae8f20dd246c
alias: /blog/CTS200---Connected-Systems-Service-Orientation-and-the-WindowsNET-Developer.aspx
---


Much like Don Box and Chris Anderson did during the MVP Summit, he and Doug Purdy opened this session with the Questions part and then spent the entire session answering those questions.

The question list was long and good and generally focused on COM+, MSMQ, and SO (no longer SOA... just SO).

Here are the primary points (bold is the title of the slide, comments are mine unless quoted.)

**There Is Only One Program and It Is Still Being Written**

> This is one of those things that, like much of Don's most important statements, is more philosophical than practical. But it did certainly ring true for me.
> 
> This program is the IT environment taken as a whole. When we write a "program" we are just adding to the Program (yeah... like the Matrix). Whether or not our program survives is really an issues of Darwinian natural selection within in the context of The Program.

**Choice Is an Illusion**

> This point was a bit of a ramble, but the key point was...
> 
> Don Box: "We all like to think that the statement, "Grant me the courage to change the parts that I can change. Grant me the patience to deal with the parts that I can't change. I grant me the wisdom to know the difference. But let me tell you... you can't actually make significant change to the Program."

**Objective Interpretation is an Oxymoron**

> Doug Purdy asked us all to close our eyes and think about when we saw when he said... "Car".
> 
> I saw my car. Some people say a Porche. Some saw a Corvette. The point was made.
> 
> Doug Purdy: "What does car mean? There is no such thing as objectivity when we talk about the exercise of interpretation."

**Good Contracts Make For Good Neighbors**

> Don used an analogy I haven't heard him use before. He said that when people put up fences between their houses it actually improved neighborly relations, because there is no dispute over where the boundary is. The application of that analogy to the SO world is pretty obvious.

**First Do No Harm**

> This one is pretty clear, right?

**Innovate Locally, Interop Globally**

> Again, this is a consistent message with what Don said back at PDC. If The Program is a heterogeneous collection of little programs all interoperating, then the obvious area where one can innovate is within your local domain. You can't expect to influence The Program at large.

**How much COM Does The Program Need?**

> Quite a bit. We will always have unmanaged systems and COM is the best way to interop with local unmanaged resources.

**How Much Remoting Does The Program Need?**

> Some. Remoting is still and will continue to be the best way to interoperate across App Domains within a single managed application.

**How Much ES Does The Program Need?**

> Lots. ES (aka Com+) is the most efficient way to communicate across machine boundaries when you know that both ends are managed .NET code. Unlike remoting, you can secure it.

**How Much ASMX Does The Program Need?**

> Lots and lots and lots. More to come. ASMX is the best way to proceed unless it won't work for you.
> 
> Don Box: "Unless you can't do what you need using ASMX, you should be using it. Use the model (ed. SOAP) and the implementation (ed. performance and such) will catch up."

**How Much WS-* Does The Program Need?**

> Less. Use only what you need to get your job done.

**How Much WSE Does The Program Need?**

> Use it when SOAP isn't good enough. A specific example is when you know you need to deal with message routing and forwarding and need to maintain security and trust expectations. If you are just point-to-point without any of those needs, then why not just use channel security (e.g. HTTP AUTH)?

So as expected it was a good talk, with lots of good guidance, but very little technical details.
