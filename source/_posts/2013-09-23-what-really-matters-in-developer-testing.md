---
layout: post
title: "What Really Matters in Developer Testing"
date: 2013-09-23 10:07
comments: true
categories: 
- agile software development
- technology
tags:
- tdd
- agile development
- unit testing
- developer testing
---

Last month I wrote an article for Visual Studio Magazine called, "What Really
Matters in Developer Testing" that I wanted to share with my readers here.

Note: They changed the title and made a few other tweaks here and there, so this
is my original manuscript as opposed to the edited and published version. Enjoy!

If you'd prefer, you can read the published article here:  
<http://visualstudiomagazine.com/articles/2013/08/01/what-really-matters-in-developer-testing.aspx?m=1>

<!-- More -->

## What Really Matters In Developer Testing

**It isn’t about the tests, it is about the feedback**

*by Peter Provost – Principal Program Manager Lead – Microsoft Visual Studio*

### Introduction

Recently someone asked me to provide guidance to someone wanting “convince
development teams to adopt TDD”. I wrote a rather long reply that was the seed
leading to this article. My answer was simple: you cannot convince people to do
Test-Driven Development (TDD). In fact, you should not even try because it
focuses on the wrong thing.

TDD is a technique, not an objective. What really matters to developers that
their code does what they expect it to do. They want to be able to quickly
implement their code, and know that it does what they want. By focusing on
this, we can more easily see how developers can use testing techniques to
achieve their goals.

All developers do some kind of testing when they write code. Even those who
claim not to write tests actually do. Many will simply create little command
line programs to validate expected outcomes. Others will create special modes
for their app that allow them to confirm different behaviors. Nevertheless, all
developers do some kind of testing while working on their code.

### What Test-Driven Development Is (and Isn’t)

Unlike ad-hoc methods like those described above, TDD defines a regimented
approach to writing code. The essence of it is to define and write a small test
for what you want before you write the code that implements it. Then you make
the test pass, refactor as appropriate and repeat. One can view TDD as a kind
of scientific method for code, where you create a hypothesis (what you expect),
define your experiment (the tests) and then run the experiment on your subject
(the code).

TDD proponents assign additional benefits to this technique. One of the most
important is that it strongly encourages a highly cohesive, loosely coupled
design. Since the test defines the interface and how dependencies are provided,
the resulting code typically ends up easy to isolate and with a single purpose.
Object-oriented design defines high cohesion and loose coupling to be essential
properties of well-designed components.

In addition, TDD provides a scaffold for when the developer is unsure how to
implement something. It allows the developer to have a conversation with the
code, asking it questions, getting answers and the adjusting. This makes it a
great exploratory tool for the understanding something new.

Test-driven development is not a panacea, however. While the tests produced can
serve to protect from regressions, they are not sufficient on their own to
assess and ensure quality. Integration tests that combine several units
together are essential to establish a complete picture of quality. End-to-end
and exploratory testing will still be required to evaluate the fitness of the
entire system.

In short, TDD is another tool that the developer can use while writing code. It
has benefits but it also has costs. It can help you define components with very
little upfront definition. However, it will add to the time required to create
the code. It has a strong, positive impact on the design of your code, but it
requires practice and experience to learn, and can be frustrating for the
novice.

### Short-cycle Mode

When we think about test-driven development as a tool, we recognize that like
all tools, it has times when it is effective and times when it is not. As my
father used to tell me, “You can put in a screw with a hammer, but it probably
isn’t the best choice.”

There are times that the developer begins with a clear picture of how a
component should work. There is a clear mental model of what is should do and
how to code it. Trying to baby-step into that design using a test-fist
technique would be tedious and time consuming. Nevertheless, the design
benefits from the TDD approach are still desirable. In these cases, it would be
nice if we could get the best of both worlds.

Test-driven development leads to these design benefits primarily by forcing the
developer into a rapid back-and-forth between consuming code (tests) and the
system under test. This, I believe, is where the real benefit comes from TDD.
Write a small amount of code, then a small amount of tests. Cycle back and
forth between them frequently. I call this short-cycle testing.

Tests are a tool that let you ask questions of your code. By asking questions
frequently, you can fine-tune the thing you are building. Sometimes you will
write a test first, sometimes after. Avoid staying in more mode too long. Keep
the back-and-forth fluid and frequent.

Even when you know what you want, switching to a test lets you confirm your
thinking. You will often find that the test tells you something you unexpected,
letting you correct it earlier. The tests will also help you find dependencies
and coupling you never realized were there. Trying to write tests after an
extended free-coding period will also tell you these things, but by then it
will be significantly harder to do anything about it.

### Conclusion

I said at the beginning that developers really want to be able to quickly write
the correct code

and know it does what they think it does. I have highlighted a few words in
that sentence that I think are the key elements. Developers want to be
efficient and do their work quickly. They also want to create the right thing.
Moreover, they need to be sure that the code they write does what they think it
does. This is the essential goal of developer testing and is what
differentiates it from other kinds of testing. 

Developer tests are an effective tool that deliver quality and design benefits.
Test-driven development provides this result, but the biggest benefit comes not
from dogmatic application of TDD, but from using a short-cycle mode where you
write tests and code at almost the same time.
