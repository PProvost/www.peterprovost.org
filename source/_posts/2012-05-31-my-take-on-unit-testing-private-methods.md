---
layout: post
title: "My Take on Unit Testing Private Methods"
date: 2012-05-31 00:29
comments: true
categories: 
- Code
- Agile Software Development
tags:
- unit testing
- tdd
---

## The simple answer: Just Say No&trade;

{% img right /images/blog/2012-05-31-my-take-on-unit-testing-private-methods/Rodin-The-Thinker-180x240.jpg The Thinker %}

Every now and then I get an email, see a forum post, or get a query at a
conference about this topic. It typically goes like this:

*"When you're doing TDD, how do you test your private methods?"*

The answer of course, is simple: You don't. And you shouldn't.

This has been written up in numerous places, by many people smarter than I, but
apparently there are still people who don't understand our point.

## Private Methods and TDD

I do create private methods while doing TDD, as a result of aggressive
refactoring. But from the perspective of the tests I'm writing, these private
methods are entirely an implementation detail. They are, and should remain,
irrelevant to the tests.  As many people have pointed out over the years,
putting tests on internals of any kind inhibits free refactoring. 

They are internals, they are private... Keep them that way.

{% img right /images/blog/2012-05-02-the-only-way-to-learn-tdd-kata/Red-Green-Refactor-Bunny.png %}

What I like to do every now and then, when I'm in the green phase of the TDD
cycle, is stop and look at the private methods I've extracted in a class.  If I
see a bunch of them, it makes me stop and ask, "What is this code trying to
tell me?" 

More often than not, it is telling me there is another class needed.  I look at
the method parameters. I look at the fields they reference. I look for a
pattern.  Often, I will find that a whole new class is lurking in there.

So I refactor it out. And my old tests should STILL pass.

Now it is time to go back and add some new tests for this new class. Or if you
feel like being really rigorous, delete that class and write it from scratch,
using TDD. (But I admit, I don't really ever do that except for practice when
doing longer kata.)

At the risk of repeating myself, I'll say it one more time: **Just Say
No&trade;**

## What about the public API?

{% img right /images/blog/2012-05-31-my-take-on-unit-testing-private-methods/Book.jpg An old book %}

I most often hear this from people who've grown up creating frameworks and
APIs. The essence of this argument is rooted in the idea that making something
have private accessibility (a language construct) somehow reduces the supported
public API of your product.

I would argue that this is a red herring, or the fallacy of irrelevant
conclusion.  The issue of "supported public API" and "public method visibility"
are unfortunately related only by the use of the word **public**. 

Making a class or method public does not make it a part of your public API. You
can mark is as "for internal use only" with various attributes or code
constructs (depending on your language). You can put it into an "internals
only" package or namespace. You can simply document it in your docs as being
"internal use only".  

All of these are at least as good, if not better, than making it private or
internal. Why? Because it frees the developers to use good object-oriented
design, to refactor aggressively and to TDD/unit test effectively. It makes
your code more flexible and the developers are more free to do what they are
asked to do.

## But customers will use it anyway!

{% img right /images/blog/2012-05-31-my-take-on-unit-testing-private-methods/Just_Say_No.jpg Just Say No %}

Consider the answer to these questions:

1.	You have an API that has public visibility, and it is marked *Internal use
   only* in any of the ways I mentioned above. A customer calls you up and says
   "When I use this API it doesn't work as expected." What is your response?
2.	You have an API that has public visibility, and it is marked *Internal use
   only* in any of the ways I mentioned above. You changed the API between
   product versions. The customer complains that the API changed. What is your
   response?

In each case, I would argue that the answer is the same. You simply say, "That
API is not for public consumption. It is for internal use only, which is why it
was marked & documented as such. Do not use it. Go away."

If you feel that you wouldn't do that. Consider these slightly revised versions
of the same questions:

1.	You have an API that has private visibility. A customer calls you up and
   says, "When I used private reflection to call this API, it didn't work as
   expected." What is your response?
2.	You have an API that has private visibility. You changed the API between
   product versions. The customer complains that the API changed. What is your
   response?

If you are working in a language like C# (or Java or Ruby or any other that
supports reflection), you know that making a method, property or field have
private accessibility does not ever prevent a user from calling it. So don't
delude yourself into thinking that it will prevent them from using it. Trust me
on this, I've been doing "privates hacking" since the good old days of C++ and
pointer offset math. 

## Other arguments

{% img right /images/blog/2012-05-31-my-take-on-unit-testing-private-methods/179px-Aristotle_Altemps_Inv8575.jpg Artistotle %}

If you think it is about security, that argument doesn't hold water either. If
you spend just a little bit of time researching how hackers create aimbots and
other cheats for popular online games, you will see that even in C++, making
things private doesn't protect you. A little pointer arithmetic and structure
mapping, and you can do whatever you want.

A very interesting argument I've heard on this one had to do with IntelliTrace
in Visual Studio. It went something like this: "When you make it public, it
will show up in the statement completion drop-down, and we don't want to confuse
people with all that noise."

When I pointed out that with some simple refactoring (e.g. use a sub-namespace
called Internal and actually do the Extract Class refactoring I mentioned
above), they realized that they were designing for the wrong thing.

A final one I get at about this point goes something like this: "Information
hiding and encapsulation are fundamental to good object-oriented design." Let
me say that I believe in information hiding. I think fields should be private.
And I think external actors should only manipulate them through public methods.
If you look at languages like Smalltalk and Ruby, this is just the way the
language works.  (Yes, yes, I know... `private` in Ruby means something
different. But the point is still the same.)

## Conclusion

You can make a well-factored design that doesn't require private methods.  You
can design an easy to understand API that is usable and not too noisy by
applying well-targeted refactorings and design patterns. You can remove the
support burden by clearly documenting what is meant to be used and what is not.
And it doesn't help with security.

Focus on what matters. Let the tests drive the code and let the code tell you
when it needs to be refactored. You don't need to make everything private.
