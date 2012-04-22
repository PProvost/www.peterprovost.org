---
layout: post
title: "Software Development Karate Belts"
comments: false
date: 2004-05-19 12:24:00
updated: 2004-05-19 12:36:00
categories:
 - Technology
subtext-id: ab65aa19-466a-466e-baca-c6fa2a6d0ebe
alias: /blog/post/Software-Development-Karate-Belts.aspx
---


Today [Kris](http://weblogs.ilg.com/KSyverstad/) and I were talking about comments. He used to believe that making your development teams write lots of comments in the code produced a better end product, while I felt that all the comments meant either:

> The code isn't clear enough and needs to be refactored.

Or

> The comment is in the way of perfectly clear code and makes it harder to read.

Well, Kris is starting to come around to my way of thinking. Today he used this metaphor...

> It reminds me of the test cards for color blindness...
> 
> "What does the code say?"
> 
> "Huh? I can't see any code."

What he is saying, of course, is that when all of the comments are there, (including the 'XML' comments at the top of the method) they often get in the way of the code. If&nbsp_place_holder;the code&nbsp_place_holder;is written clearly enough, you shouldn't need the comments.

Another way that I like to explain it is:

> Comments should answer the **why** question and not the **what** or **how** question.

So I wouldn't say that comments are a code smell per se, but they are, as Martin Fowler said, "often used a deodorant."

And that brings me to the real point of this post. I think we should have belt levels&nbsp_place_holder;like karate (White, Yellow, Orange, Green, Blue, Brown, Black) or Cub Scout ranks (Bobcat, Wolf, Bear Webelos, Arrow of Light). Only when you have reached a certain level are you allowed to do certain things.

Like it or not, the open-source community has had something like this for a long time. You can't just join an OSS project and expect to get commit rights to the repository. You have to prove yourself but participating in the community, submitting bugs and (more importantly) fixes. In effect, you have to prove yourself.

I'm thinking of something like this (I'm just picking on comments and source commits, but there are many many other activities that would be controlled this way.)

  * If you are a white belt, you can write code and send it in, but you don't get commit rights. 
  * Yellow belts can commit code that has been reviewed by someone else to the repository but they still have to comment their code 
  * Orange belts can commit without review, but they still have to comment 
  * Green belts don't have to comment their code 
  * Etc...

I know that the various certification programs are trying to set a baseline for skillsets, but really we are talking about a different thing here. I'm talking about a progression of skills from the bottom (we don't know who you are and probably don't trust you to touch our code) to the top (you are a god... do what you will).

&nbsp_place_holder;
