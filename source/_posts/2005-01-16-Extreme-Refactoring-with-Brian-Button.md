---
layout: post
title: "Extreme Refactoring with Brian Button"
comments: false
date: 2005-01-16 20:54:00
categories:
 - Technology
subtext-id: d558a010-bd99-4559-b742-0a8e768759ad
alias: /blog/Extreme-Refactoring-with-Brian-Button.aspx
---


For the past few weeks and months, my good friend [Brian Button](http://dotnetjunkies.com/WebLog/oneagilecoder/) has been posting a six part series called "TDD Deep Dive" which is one of the better TDD-by-example explanations you can read in less than an hour. If you haven't read it yet, go read it now. (Links: Part [1](http://dotnetjunkies.com/WebLog/oneagilecoder/archive/2004/10/25/29610.aspx), [2](http://dotnetjunkies.com/WebLog/oneagilecoder/archive/2004/11/07/31298.aspx), [3](http://dotnetjunkies.com/WebLog/oneagilecoder/archive/2004/11/15/32245.aspx), [4](http://dotnetjunkies.com/WebLog/oneagilecoder/archive/2004/11/25/33603.aspx), [5](http://dotnetjunkies.com/WebLog/oneagilecoder/archive/2004/12/02/34742.aspx), [6](http://dotnetjunkies.com/WebLog/oneagilecoder/archive/2004/12/04/35123.aspx).)&nbsp_place_holder;Then come back here and continueΓÇª

Done? Good.

&nbsp_place_holder;Well, Brian has done it again. This time with a very cool post titled ["Extreme" Refactoring - The Video Store Revisited](http://dotnetjunkies.com/WebLog/oneagilecoder/archive/2005/01/15/44622.aspx). In this essay--almost 1,800 words of text, plus just under 1,000 lines of code--he takes the example used in [Martin Fowler's Refactoring book](http://www.amazon.com/o/ASIN/0201485672/peterprovosto-20) and takes it through a truly extreme refactoring process.

He begins with three goals in mind:

  * Methods should be 1 line long. Anything longer than that needs to be looked at closely.
  * Aggressively eliminate all duplication, specifically duplication involved with iterating over containers several different times in similar ways.
  * Use no private methods.

And then works to make it happen. Using the baby-step approach he [used with me](http://dotnetjunkies.com/WebLog/oneagilecoder/archive/2004/12/03/34886.aspx), he works through one little piece at a time. [Extract Method](http://www.refactoring.com/catalog/extractMethod.html) here, [Extract Superclass](http://www.refactoring.com/catalog/extractSuperclass.html) there. A little of thisΓÇª a little of that.

And when he is done, the code certainly doesn't look like Martin's anymore. Is it better? Even Brian isn't sureΓÇª

> Now for the questions. Is this code more clear than the original Customer class? I'm not sure. In some senses it is. If I want to go see how the statement is generated, I can now go look at a RentalStatement class and see it. Looking ahead a bit, knowing that one of the changes Martin talks about in his book is that we need to support an HTML statement as well as a text statement, so by creating the RentalStatement class, we're well prepared to make that change. I'm never sure if the ReplaceExternalIterationWithInternalIteration ever makes code more clear, but it does eliminate duplication.
> 
> I'm not sure that I would ever go this far in real life, but it is nice to know that I could.

But the process is very cool, very educational and something we all should strive for.

<ninety-degree-turn>

This has got me to thinking about another idea that Brian and I have been talking about. Refactoring parties. Yeah, yeah. Geeky as all hell, but here is the ideaΓÇª

Get a good A/V room. We have a bunch of these on campus so we should be able to make that work. Elect someone to be the facilitator. Bring up some code on the screen. Now go around the room, round-robin-style, ad each person gets to make **_one_** refactoring to the code. Not two. One. (Hopefully you have something like [JetBrains Resharper](http://www.jetbrains.com/resharper/) installed.)

If you don't like the Extract Method that the person before you did, then you can use your turn to remove it. But you can't argue when they make their selection. You can only discuss what you're thinking when it is your turn. When you "have the conch".

Personally, I think it would be a blast. What do you think?

(Having guys like Brian there would certainly help.)

</ninety-degree-turn>
