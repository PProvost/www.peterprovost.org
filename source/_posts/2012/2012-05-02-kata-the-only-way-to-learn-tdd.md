---
layout: post
title: "Kata - The only way to learn TDD"
date: 2012-05-02 23:34
comments: true
categories: 
- Agile Software Development
tags:
- TDD
- agile development
- unit testing
- kata
---

{% img right /images/blog/2012-05-02-the-only-way-to-learn-tdd-kata/Emmanuelle-Fumonde-Demonstration.jpg 'Source: &#104;&#116;&#116;&#112;&#58;&#47;&#47;&#101;&#110;&#46;&#119;&#105;&#107;&#105;&#112;&#101;&#100;&#105;&#97;&#46;&#111;&#114;&#103;&#47;&#119;&#105;&#107;&#105;&#47;&#70;&#105;&#108;&#101;&#58;&#69;&#109;&#109;&#97;&#110;&#117;&#101;&#108;&#108;&#101;&#45;&#70;&#117;&#109;&#111;&#110;&#100;&#101;&#45;&#101;&#110;&#45;&#100;&#37;&#67;&#51;&#37;&#65;&#57;&#109;&#111;&#110;&#115;&#116;&#114;&#97;&#116;&#105;&#111;&#110;&#46;&#106;&#112;&#103;'  %}

Lately I've been asked by more and more people inside Microsoft to help them
really learn to do TDD. Sure, they've read the books, and probably some blog
posts and articles, but they are struggling to figure it out.

But with so many people talking about how good it is they are frustrated that
when they try to apply it at work, in their day job, it just doesn't seem to
work out.

My guidance to them is simple. Do a TDD kata every morning for two weeks. Limit
yourself to 30 minutes each morning.  Then pick another kata and do it again.

<!-- More -->

## What is a TDD Kata?

{% img left /images/blog/2012-05-02-the-only-way-to-learn-tdd-kata/Red-Green-Refactor-Bunny.png %}

Kata is a Japanese word meaning "form", and in the martial arts it describes a
choreographed pattern of movements used to train yourself to the level of
muscle memory. I study Kenpo myself and have a number of kata that I practice
regularly both in training and at home.

The idea of kata for software development was originally coined by Dave Thomas,
co-author of one of my favorite developer handbooks 
[The Pragmatic Programmer: From Journeyman to Master][10].
The idea is the same as in martial arts, practice and repetition to hone
the skills and lock in the patterns.

One of the reasons TDD is hard for newcomers is that it is very explicit about
the baby-step nature of the changes you make to the code. You simply are not
allowed to add anything more than the current tests require. And for
experienced developers, this is very hard to do, especially when working on
***real code***.

By using the small but precise nature of the kata to practice these skills, you
can get over this roadblock in a safe way where you understand that the purpose
for the baby steps is to learn the movements.

## Every day for two weeks? Really?

{% img right /images/blog/2012-05-02-the-only-way-to-learn-tdd-kata/Wristwatch.jpg '30 minutes a day' 'Source: &#104;&#116;&#116;&#112;&#58;&#47;&#47;&#101;&#110;&#46;&#119;&#105;&#107;&#105;&#112;&#101;&#100;&#105;&#97;&#46;&#111;&#114;&#103;&#47;&#119;&#105;&#107;&#105;&#47;&#70;&#105;&#108;&#101;&#58;&#84;&#105;&#109;&#101;&#120;&#95;&#84;&#53;&#69;&#57;&#48;&#49;&#95;&#73;&#114;&#111;&#110;&#109;&#97;&#110;&#95;&#84;&#114;&#105;&#97;&#116;&#104;&#108;&#111;&#110;&#95;&#51;&#48;&#95;&#76;&#97;&#112;&#95;&#70;&#76;&#73;&#88;&#46;&#106;&#112;&#103;' %}

Actually, I would encourage you to do one every day for the rest of your
programming career, but that might be a bit extreme for some people. In my
martial arts training, we warm up with forms and kata, so why not have a nice
regular warm-up exercise to do while your morning coffee takes hold?

My recommendation to people is to do a 30-minute kata every morning for two
weeks. Then pick another one and do it every day for two weeks. Continue on.

I don't recommend people start using at work, on their actual work projects
until they feel like they are ready. I can't tell you when that will be, but
you will know. It may be after one week or six, but until you feel like you are
very comfortable with the rhythm of the TDD cycle, you should wait. To do
otherwise is like entering into a martial arts tournament with no skills.

Oh and did I mention that kata are actually fun?

## Using a kata to learn

I still do kata all the time, although I don't do them every day.  Sometimes I
do one that I have already memorized and sometimes I go hunt down a new one.
Sometime I make one up and do that over and over for a few days.

Most commonly, when I do a kata these days, it is to learn a new technology. As
an example, a while back I wanted to learn more about [SubSpec][8] and [Shouldly][9],
which are a nice way to do BDD style development on top of xUnit.net. I could
have just played with it for five minutes, but instead I did the string
calculator kata every day for a week.

By doing that I actually learned a lot more about SubSpec than I would have
learned otherwise. It really helped me understand the different between their
Assert and Observe methods, for example.

I've also used Kata to learn new underlying technologies. When WPF and
Silverlight were first getting attention, and the Model-View-ViewModel (MVVM)
approach appeared, I developed a quick kata where I create a ViewModel from
scratch for a simple but imaginary system. I did it the same way every day for
a week and MVVM became very internalized for me.

Then when XAML-based Metro Style app development appeared for Windows 8, I did
them again, but this time entirely within the constraints of Windows 8
development. I reused my existing practice form to learn a new way of
developing apps. And it worked great.

## What katas are there? Which should I do first?

I generally recommend one of two different kata for getting started: The
Bowling Game or the String Calculator. Most recently, I've been demonstrating
the String Calculator over the Bowling Game because for people who didn't grow
up in the US, 10-pin bowling can be a bit weird to describe.

### The Bowling Game Kata

If you live in the US or Canada, this one is easy to describe. If not, you
might want to look at the next one.

{% img right /images/blog/2012-05-02-the-only-way-to-learn-tdd-kata/bowling.jpg '10-pin Bowling' 'Source: &#104;&#116;&#116;&#112;&#58;&#47;&#47;&#101;&#110;&#46;&#119;&#105;&#107;&#105;&#112;&#101;&#100;&#105;&#97;&#46;&#111;&#114;&#103;&#47;&#119;&#105;&#107;&#105;&#47;&#70;&#105;&#108;&#101;&#58;&#66;&#111;&#119;&#108;&#105;&#110;&#103;&#95;&#45;&#95;&#97;&#108;&#98;&#117;&#114;&#121;&#46;&#106;&#112;&#103;' %}

The essence of this kata, popularized by Uncle Bob Martin, is to create a
scoring engine for 10-pin Bowling. In 10-pin bowling you have ten frames where
you can roll one, two (or three) balls and score the pins that you knock down.
Sounds simple right?

Except the scoring is weird. You'd think 10 pins and ten frames would yield a
highest possible score of 100, but you'd be wrong.  The lowest possible score
(all misses) is zero, but the highest possible score is 300. For more
information about 10-pin bowling scoring I suggest reading the 
[Wikipedia page][1]. But this is exactly why it is a fun system to model for our kata.

Uncle Bob breaks this kata down into the following five tests:

1. Gutter game scores zero - When you roll all misses, you get a total
   score of zero.
2. All ones scores 20 - When you knock down one pin with each ball, your
   total score is 20.
3. A spare in the first frame, followed by three pins, followed by
   all misses scores 17.
4. A strike in the first frame, followed by three and then four pins,
   followed by all misses, scores 24.
5. A perfect game (12 strikes) scores 300.

He has some very explicit refactorings that you are to perform while
implementing the third and fourth tests, and doing these is important.
I've always found it weird that the final test just passes when you do
the first four right (this smells a bit of over-implementing test four)
but I've never really found a way to do #3 and then #4 that didn't result
in #5 just passing. Oh well.

You can read [Uncle Bob's wiki page][2] on the topic for the canonical definition.

### The String Calculator Kata

Like the Bowling Kata, this kata, made popular by Roy Osherove, comes with a
precise set of steps to follow. The essence is a method that given a delimited
string, returns the sum of the values. I've always preferred my kata to define
the tests I will follow every time through the exercise, so here are the tests
I use for this one:

{% img right /images/blog/2012-05-02-the-only-way-to-learn-tdd-kata/HP_65.jpg 'HP 65 Calculator' 'Source: &#104;&#116;&#116;&#112;&#58;&#47;&#47;&#101;&#110;&#46;&#119;&#105;&#107;&#105;&#112;&#101;&#100;&#105;&#97;&#46;&#111;&#114;&#103;&#47;&#119;&#105;&#107;&#105;&#47;&#70;&#105;&#108;&#101;&#58;&#84;&#105;&#109;&#101;&#120;&#95;&#84;&#53;&#69;&#57;&#48;&#49;&#95;&#73;&#114;&#111;&#110;&#109;&#97;&#110;&#95;&#84;&#114;&#105;&#97;&#116;&#104;&#108;&#111;&#110;&#95;&#51;&#48;&#95;&#76;&#97;&#112;&#95;&#70;&#76;&#73;&#88;&#46;&#106;&#112;&#103;' %}

1. An empty string returns zero
2. A single number returns the value
3. Two numbers, comma delimited, returns the sum
4. Two numbers, newline delimited, returns the sum
5. Three numbers, delimited either way, returns the sum
6. Negative numbers throw an exception
7. Numbers greater than 1000 are ignored
8. A single char delimiter can be defined on the first line (e.g. `//#` for a
   '#' as the delimiter)
9. A multi char delimiter can be defined on the first line (e.g. `//[###]` for
   '###' as the delimiter)
10. Many single or multi-char delimiters can be defined (each wrapped in square
    brackets)

I rarely bother with Test #10 when I do it, because it feels like a big step
to take all at once, but Roy does include it in his definition, and I have 
it in my kata notebook.

To read Roy's original post describing the kata, or to see a bunch 
of video demonstrations (in just as many languages) visit [his page
on the topic][3].

## More katas to choose from

A couple of others that I've used when training or for my own fun and
benefit are:

* The Prime Factors Kata - another by Bob Martin
* Fizz Buzz Kata - the crazy (drinking?) game where you replace certain numbers
   or multiples of numbers with nonsense words

Most kata share a few key attributes. First they are simple to describe (well
maybe not 10-pin bowling). The problem is intentionally simplified to one
thing. Secondly, they should come with the set of tests you are to use to drive
the design. Sometimes they will also come with specific or recommended
refactorings to perform at certain steps.

There are many sites out there that have catalogs of kata to dig through, but
I really do recommend doing them one at a time for at least a week before
picking up another one. Here are a few of those lists, and I'm sure there are
many more:

* [Dave Thomas' list of katas][4]
* [CodingDojo.org Kata Index][5]
* [TDDKatas @ CodePlex.com][6]
* [CodingKata.net][7] - all C#, in browser, no IDE required

## What are you waiting for?

I've been doing kata for a very long time and I really do recommend them
as a tool for learning what TDD really feels like. Give it a try, and use
my guidelines: every morning, time-boxed to 30 mins, the same kata for one
or two weeks, then pick a new one and repeat.

Hopefully you will get as much value from them as I do.

[1]: http://en.wikipedia.org/wiki/10-Pin_Bowling#Scoring
[2]: http://www.butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata
[3]: http://osherove.com/tdd-kata-1/
[4]: http://codekata.pragprog.com/codekata/
[5]: http://codingdojo.org/cgi-bin/wiki.pl?KataCatalogue
[6]: http://tddkatas.codeplex.com/
[7]: http://codingkata.net/
[8]: http://subspec.codeplex.com/
[9]: http://shouldly.github.com/
[10]: http://www.amazon.com/gp/product/020161622X/ref=as_li_ss_tl?ie=UTF8&tag=peterprovosto-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=020161622X
