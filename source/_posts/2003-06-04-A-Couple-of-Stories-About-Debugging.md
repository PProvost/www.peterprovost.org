---
layout: post
title: "A Couple of Stories About Debugging"
comments: false
date: 2003-06-04 19:26:00
categories:
 - Technology
subtext-id: 8f1b9475-ef22-4be1-a4c5-d88f9d03ab28
alias: /blog/A-Couple-of-Stories-About-Debugging.aspx
---


**_Story #1:_**

This is a true story about something that happened to me last week. My car had been close to overheating for a couple of days. I immediately assumed the worst and was preparing to take it into the shop, where I'm sure they would have found a few hundred bucks of work to do. But then I had a phone call with my dad.

"Did you check the antifreeze level?" he asked.

"No," I said, "but I haven't seen any green stuff under the car, so it isn't leaking."

"Let it cool down and open the radiator cap. It should be full. If it isn't, fill it up and give it another day."

In the morning I opened the cap and couldn't see any fluid. I bought some premixed coolant and it took almost a gallon before it was full. On my drive to work the temp didn't rise up past where you would expect.

Problem solved. And all it tool was a $5 bottle of antifreeze.

**_Story #2_**

Remember the movie Sling Blade? In my opinion this film, directed by and starring Billy Bob Thornton, was a great film.

Thornton plays Karl Childers, a retarded man who has spent most of his life in jail for mudering his mother and her lover. After his release, he gets a job working at a mom-and-pop lawmower repair shop. He has a nack for fixing engines.

In one scene a co-worker of Karl is working on an engine and can't figure out what is wrong. He's about to give up when the owner says to let Karl look at it.

Karl comes over and gives it a look. While the other men stand around arguing about whether Karl will be able to fix it or not, Karl opens the gas cap and says, "It's out of gas."

Problem solved. And all it took was a look in the gas tank.

**_Conclusion_**

What's the moral of these tales? Always check the simplest things first. Many is the time that I've seen novice programmers fighting a bug get stuck by this.

They make an assumption about what they think the problem is and then, like an amoral research scientist, they do whatever it takes to prove their hypothesis. They often end up chasing a bug all the way down to the OS code and then proclaim, "There is a bug in the API!"

So my advice is this: When you are chasing a bug, look at the simplest things first. Did you initialize your variables? Are you crossing a boundary condition? Is it a simple picket-fence problem? You will find that it is almost always that simple.
