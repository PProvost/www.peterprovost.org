---
layout: post
title: "NUnit Assert.AreEquals Parameter Ordering"
comments: false
date: 2005-01-27 11:46:00
categories:
 - Technology
subtext-id: a0479d97-656f-469a-ae11-3259fc8055f9
alias: /blog/post/NUnit-AssertAreEquals-Parameter-Ordering.aspx
---


I regularly take jabs at my boss [Jim Newkirk](http://blogs.msdn.com/jamesnewkirk/)&nbsp_place_holder;(original author of NUnit 2.x), telling him, "I think you put the parameters to AreEqual in the wrong order. It should be&nbsp_place_holder;actual, expected and not the other way 'round."

To which he consistently replies, "Well, you would be wrong." ![](http://www.peterprovost.org/Files/smile2.gif)

But all kidding aside, I still find myself writing code that assumes the AreEqual method has the opposite ordering.

It comes from the way I write if() statements. I write them like this:
    
    if( myVariable == 4 )
    {
      // Do something
    }

&nbsp_place_holder;I have seen C/C++ programmers do thisΓÇª
    
    if( 4 == MyVariable )
    {
      // Do something
    }

ΓÇªas a way to protect themselved from forgetting the second = symbol (in fact I used to do it too).&nbsp_place_holder;But as the C# compiler won't let me make that mistake, I don't do it anymore.

Which is why I want to writeΓÇª
    
    Assert.AreEqual( myVariable, 4 );

...instead of...
    
    Assert.AreEqual( 4, myVariable );

But apparently, I'm wrong. But I still type it the other way more often than not.

**Now playing:** [Bob Marley & The Wailers](http://phobos.apple.com/WebObjects/MZSearch.woa/wa/advancedSearchResults?artistTerm=Bob Marley & The Wailers) - [Misty Morning](http://phobos.apple.com/WebObjects/MZSearch.woa/wa/advancedSearchResults?songTerm=Misty Morning&artistTerm=Bob Marley & The Wailers)
