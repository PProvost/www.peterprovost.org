---
layout: post
title: "Prefactoring == BUFD?"
comments: false
date: 2005-10-10 09:15:00
updated: 2005-10-10 20:24:00
categories:
 - Technology
subtext-id: e7b4aac8-c8c3-4f03-819b-2923d0dad1d3
alias: /blog/post/Prefactoring-3d3d-BUFD.aspx
---


[Darrell Norton blogged](http://codebetter.com/blogs/darrell.norton/archive/2005/10/05/132800.aspx) about a new book from O'Reilly called Prefactoring. From [the Editorial Review on Amazon](http://www.amazon.com/o/ASIN/0596008740/peterprovosto-20):

> More often than not, developers will stop a large project in the middle of the build stage to rethink and recode the software design so it's cleaner and more efficient. Known as "refactoring," this process eats up valuable time and money. To help offset refactoring, this book presents a new process called "prefactoring," the premise of which states that you're better off considering the best possible design patterns before you even begin your project.  
Prefactoring, in essence, is the art of applying the insights gleaned from previous experience (whether yours or someone else's) when developing software to new projects. Doing so will likely save you from making costly design changes midstream--and maybe even save your job!
> 
> This practical, thought-provoking guide details prefactoring guidelines in design, code, and testing, each derived from the lessons of many developers over many years. With these guidelines, you're far more likely to create more readable and maintainable code before you reach the second-guessing stage. 
> 
> To help communicate the many facets of this process, Prefactoring follows the example of a fictitious client, Sam, as he seeks to create a software system from beginning to implementation. Among the topics covered:
> 
>   * General development issues 
>   * Implementation classes 
>   * Object-oriented design 
>   * Creating reports via separation of concerns 
>   * Associations and states 
>   * Creating and testing interfaces
> 
> If you understand object-oriented design, and you want to save time and money by considering more efficient designs before you begin your project, Prefactoring will show you the way. It won't guarantee that you'll never need to refactor your design or code again, but you're sure to cut down on the amount of refactoring you do.

**Oh my lord! Where to begin?**

I've seen a few people review this book who claim that it isn't actually about Big Up Front Design (aka BUFD, BDUF, BFUD, whatever), but this editorial summary certainly is advertising a BUFD approach. It is presenting confusing FUD (Fear, Uncertainty and Doubt) about one of the most fundamental software development techniques we have: Refactoring.

I suspect that the real approach being suggested here is to use your brain and experience to avoid being an idiot. But seriously, that's what separates those who deserve to get paid and those who should change careers.

The first two lines in particular&nbsp_place_holder;bug the shit out of&nbsp_place_holder;me:

> More often than not, developers will stop a large project in the middle of the build stage to rethink and recode the software design so it's cleaner and more efficient. Known as "refactoring," this process eats up valuable time and money.

This is NOT refactoring you schmuck!

Refactoring is a tool for adjusting the design of existing code, without changing what the code does. It doesn't "eat up time" because it doesn't take a lot of time. This is another one of those problems where the consistent misuse of a word changes its meaning. I constantly hear people talking about "taking some time off and refactoring that module" or "refactoring the architecture".

These people have obviously not read Martin Fowler's book [Refactoring: Improving the Design of Existing Code](http://www.amazon.com/o/ASIN/0201485672/peterprovosto-20).

As Martin makes very clear, refactoring is about taking very controlled small steps. It is not about redesigning a whole layer or subsystem "just for fun". You do it when you need to make space for a new feature. You do it when the code you just wrote needs to be cleaned up before checking it in and moving on. You do it in 5 or 10 minutes. Anything more than that isn't refactoring. It is redesign.

Please peopleΓÇª when you mean redesign, say that. When you mean refactoring, say that. Don't ruin yet another word. As for "prefactoring", my suggesting is to just use your brain, write good code, do the right thingΓÇª and don't buy this book.
