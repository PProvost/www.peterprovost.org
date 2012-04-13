---
layout: post
title: "Specifying Requirements w/ C# Generics"
comments: false
date: 2003-08-15 15:29:00
categories:
 - Technology
subtext-id: c4323f0c-b2c3-4a5e-bbfb-16065bf96a90
alias: /blog/Specifying-Requirements-w-C-Generics.aspx
---


In my post&nbsp_place_holder;More Tricks w/ C# Generics, I re-posted [Don Box's sample](http://www.gotdotnet.com/team/dbox/default.aspx?key=2003-08-12T06:11:19Z) that demonstrated the use of the where clause in a generic definition.

Don's code was:

public delegate void EventHander<S, T>(S sender, T args) where T : EventArgs;

Brett&nbsp_place_holder;Knights [asked in the comments](http://www.peterprovost.org/weblog/CommentView.aspx?guid=11b9894c-6f46-4b3e-b10c-4b341f75a789) of my post what the difference is between Don's code and this:
    
    public delegate void EventHander<S>(S sender, EventArgs args);&nbsp_place_holder;&nbsp_place_holder;

I'm not 100% sure of this, but based on my experience with C++ templates I would suggest that there is&nbsp_place_holder;a significant difference between Brett's example and Don's. In the former example, you are saying that T should be derived from EventArgs, but within your method T is still "untyped". In other words you can access any public method on T, not just those defined in EventArgs.

In Brett's example you would only be able to call the public methods defined in the EventArg class.

Am I right here? Anyone who actually has Whidbey care to comment?
