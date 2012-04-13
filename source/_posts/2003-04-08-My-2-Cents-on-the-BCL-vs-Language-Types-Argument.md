---
layout: post
title: "My 2 Cents on the BCL vs. Language Types Argument"
comments: false
date: 2003-04-08 18:53:00
categories:
 - Technology
subtext-id: 7961197e-8f88-4b0f-b58a-341a58dc0f5c
alias: /blog/My-2-Cents-on-the-BCL-vs-Language-Types-Argument.aspx
---


Ok. Time for me sound off.

There has been a whole lot of discussion on a number of .NET blogs (too many to link to them all, but one of the most active has been [Sam Gentile](http://dotnetweblogs.com/sgentile/)). The basic argument has been whether it is better to use Base Class Library (BCL) names or language specific names for simple types.

To give you an example of what I'm talking about consider the following C# code:
    
    public void DoSomething( System.Int32 anInt, System.String aString )  
    {  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; // Do something  
    }

Here I have used the BCL names for the integer and string parameters. Since this is C#, I could have written the following equivalent code:
    
    public void DoSomething( int anInt, string aString )  
    {  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; // Do something  
    }

So the argument is about which is better. And here is my 2 cents: do whatever you want, but be consistent. If you are working on a team, then the team should make a group decision and stick with it. That is exactly what MikeG said is his response to this argument:

> _Ultimately, like many other issues of standards, I think what matters is that your company have a standard. What's in the particular standard is often no more important than whether eggs are opened at the big end or the little end. In this particular case, I think a competent .NET programmer should be able to read sample code whether it uses native types or BCL types -- or, in fact, whether it's in C# or VB .NET. So pick a standard for yourself or your company and stick to it, but put down the shotguns and back away from the feud. _

As an Extreme Programming coach and mentor, one of the things that I advocate to all teams that I work with is that they agree on a coding standard that the whole team will follow. This includes answers to questions like whether to use BCL-style types or language-specific types.
