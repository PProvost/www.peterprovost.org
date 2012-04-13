---
layout: post
title: "Depending on Undefined Behavior"
comments: false
date: 2003-04-29 20:56:00
categories:
 - Technology
subtext-id: 8bcb6c39-3696-4469-a79f-75d39230df5f
alias: /blog/Depending-on-Undefined-Behavior.aspx
---


It is interesting how often we see [this ](http://dotnetweblogs.com/savanness/posts/6139.aspx)in software development. A developer tries something and it works. Subsequently, in his mind, that is how the system works. Little does he know, that he is actually now dependent on a behavior that is documented as undefined.

Undefined == unpredictable

**What can we learn from this?**

> If it isn't documented, don't use it. Just because you haven't seen it change doesn't mean it won't. Plan on it.

It reminds me of something a professor said in one of my philosophy classes (I was a philosophy minor). He was talking about how people try something once and make huge generalizations about the results. In his story a woman's (sic) car breaks down. She doesn't know what to do, so she gets out and opens the hood. She pokes around for a minute or two... gets frustrated and kicks the tire. She then closes the hood and tries to start the car. When it starts, she has "learned" that opening the hood and kicking the tires will fix the car. Little does she know that she actually had a vapor lock.
