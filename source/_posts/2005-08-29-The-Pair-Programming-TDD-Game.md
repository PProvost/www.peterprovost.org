---
layout: post
title: "The Pair Programming TDD Game"
comments: false
date: 2005-08-29 21:18:00
updated: 2005-08-31 08:53:00
categories:
 - Technology
subtext-id: ec1e2818-1fc6-41be-af62-d7a44891b897
alias: /blog/post/The-Pair-Programming-TDD-Game.aspx
---


Lately, [Brad Wilson](http://www.agileprogrammer.com/dotnetguy/) and&nbsp_place_holder;I have been playing an interesting game while pair programming. [Brian Button](http://www.agileprogrammer.com/oneagilecoder/) and [Ward Cunningham](http://c2.com/~ward/) (who has moved into the [war-room](http://weblogs.asp.net/cazzu/archive/2005/07/08/PAGWarRoom.aspx)) were sitting watching us play it the other day, and they said, "Have you ever blogged that?"

"Nope," I said. "Why? Haven't you seen people play the TDD game before?"

Well, they hadn't, so I decided to write a little bit about it.

Here are the rules:

  * One person writes a test. If it passes, he must pass the keyboard to the other person who gets to write a test.
  * If it fails, he passes the keyboard to the other person and they have to implement the required code to make it pass.
  * If "the light is green," the person who has the keyboard can choose to perform a refactoring instead of writing a test. In fact, if the implementation given by the other person has some duplication that needs to be removed, they are obligated to do just that. (After which, of course, the other person gets to write a test.)

I'm sure all of you who are reading this (especially the non-techies) are now saying, "Oh my goodness. That sounds like the most fun game in the world! I can't wait to go home and play it with my grandma Josie!" (Sorry... I started channeling [Rory](http://neopoleon.com/blog/) there for a minute.)

Seriously though, there are some interesting positive things that come from playing the game.

First of all, it encourages each partner to focus on small elements of functionality. Pairing does this too, but playing the game makes it even more real because what seems to happen is that each person tries to do something that doesn't take them long, and makes the other person take longer. ![](http://www.peterprovost.org/Files/smile1.gif)

Yeah, that sounds selfish and mean, but we are human after all. 

What is really cool about this is that when the code is really well factored, as it should be if you are playing the game, then the pattern tends to end up something like this:

  * Peter writes test in 2 minutes
  * Brad writes implementation in 1 minute ![](http://www.peterprovost.org/Files/smile9.gif)
  * Peter writes test in 4 minutes
  * Brad writes implementation in 1 minute ![](http://www.peterprovost.org/Files/smile9.gif)![](http://www.peterprovost.org/Files/smile9.gif)
  * Repeat 4 or 5 more times
  * Peter does a refactoring to clean up the mess that Brad created. ![](http://www.peterprovost.org/Files/smile1.gif)
  * Brad writes a test in 2 minutes...

![Red-Green-Refactor](http://testdriven.com/programs/imtd2.gif)

As you can see, this is exactly the "Red-Green-Refactor" pattern called for by XP and TDD, but it adds the interesting twist of making it slightly competitive. But not so competitive that the code suffers, just competitive enough to keep it interesting.

So now I've blogged it and maybe you've had some fun reading about it. And hopefully you'll give it a try the next time you're pair programming. It is a blast.
