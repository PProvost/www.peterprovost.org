---
layout: post
title: "Typed Data Sets"
comments: false
date: 2003-05-05 09:55:00
categories:
 - Technology
subtext-id: 807b6683-1d93-4297-89e0-3167911452be
alias: /blog/Typed-Data-Sets.aspx
---


I've been avoiding comment on the Typed Data Set argument that has been bouncing around a few weblogs, but this article on Roy's ISerializable weblog combined with this one from Clemens Vasters weblog brings it all to a nice conclusion.

  * DataSets are XML Infosets. I like this. As soon as I read it, it made sense to me.
  * You can pass Typed Data Sets (TDS) around without having references. I guess I knew this all along (after all they are just XML Infosets, right?)&nbsp_place_holder; but again, seeing it written down cleared up a few things in my mind.

I tend to be a Domain Model kind of guy, but I have done projects that use TDSs instead. The only problem, one that Roy mentions, is that you have to recreate them every time your schema changes.
