---
layout: post
title: "Inherit to Be Reused, Not to Reuse"
comments: false
date: 2008-06-30 19:26:00
updated: 2008-07-04 23:56:58
categories:
 - Agile Software Development
tags:
 - ooad
subtext-id: 2917a51b-e626-4bb6-972f-9905296cfed0
alias: /blog/Inherit-to-Be-Reused2c-Not-to-Reuse.aspx
---


I'm surprised how often I have to say this to other developers and engineers, but violations of this simple object-oriented mantra seems to be everywhere. Almost every time I look at a class inheritance hierarchy, I find this principle violated. 

Why is this use of inheritance bad? First of all, let's talk about what inheritance is good for: 

  * [Polymorphism](http://en.wikipedia.org/wiki/Polymorphism_in_object-oriented_programming) - In OOP, this means that you can treat derived classes as if you had been passed an instance of the parent. This was formalized by Barbara Liskov in her 1988 paper "Data Abstraction and Hierarchy". Another way to say is is, "Functions that use pointers or references to base classes must be able to use objects of derived classes without knowing it." [[Martin-96](http://www.objectmentor.com/resources/articles/lsp.pdf)] 
  * [Categorization](http://en.wikipedia.org/wiki/Categorization) - The process in which ideas and objects are recognized, differentiated and understood. Categorization implies that objects are grouped into categories, usually for some specific purpose. Ideally, a category illuminates a relationship between the subjects and objects of knowledge.

Let me refer you to the wonderful book, [C++ Coding Standards: 101 Rules, Guidelines, and Best Practices](http://www.amazon.com/gp/product/0321113586?ie=UTF8&tag=peterprovosto-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=0321113586)![](http://www.assoc-amazon.com/e/ir?t=peterprovosto-20&l=as2&o=1&a=0321113586) by Herb Sutter and Andrei Alexandrescu: 

> Despite two decades of object-oriented design knowledge, the purpose and practice of public inheritance are still frequently misunderstood, and many uses of inheritance are flawed. 
> 
> Public inheritance must always model "is-a" ("works-like-a") according to the Liskov Substitution Principle: All base contracts must be fulfilled, and so all overrides of virtual member functions must require no more and promise no less than their base versions if they are to successfully fulfill the base's contract. Code using a pointer or reference to a Base must behave correctly even when that pointer or reference actually points to a Derived. 
> 
> ... 
> 
> Public inheritance is indeed about reuse, but not the way many programmers seem to think. As already pointed out, the purpose of public inheritance is to implement substitutability. The purpose of public inheritance is not for the derived class to reuse base class code to implement itself in terms of the base class's code. Such an is-implemented-in-terms-of relationship can be entirely proper, but should be modeled by composition--or, in special cases only, by nonpublic inheritance (see Item 34). 

Let me call out one of the more importance sentences in that quote: 

> The purpose of public inheritance is not for the derived class to reuse base class code to implement itself in terms of the base class's code. 

The inheritance relationship is one of the strongest coupling relationships we can have in OOP. Everyone knows that coupling is bad and cohesion is good, but we still couple like mad via inheritance. We do this for a number of reasons, but one of the big ones is that very few college grads seem to get taught this in school. It makes me wonder how many undergraduate compsci teachers actually get it. Daniel Pietraru wrote a bit about this and how he has used inheritance questions [as interview questions](http://littletutorials.com/2008/06/23/inheritance-not-for-code-reuse/). 

The other reason I think it is so common is that our languages and tools make it look so easy and so proper. Even Fowler-esque Refactoring has refactorings called "Pull Up Method/Field/etc." that seem to be all about putting shared code into the base class. There is also the [Abstract Test Pattern](http://c2.com/cgi/wiki?AbstractTest) in TDD which specifically describes using base classes as "a way to reuse test cases". 

Whenever possible, you should look to use composition instead of inheritance in your designs. The problem is that composition is harder to do, even though it results in cleaner more modular designs. Despite that, composition has a number of benefits over inheritance. Again, I'll let Messrs. Sutter and Alexandrescu tell it (remember that some of the techniques for pointers and such are very C/C++ centric and aren't relevant here, but the underlying meaning is still true): 

> Composition has important advantages over inheritance: 
> 
>   * Greater flexibility without affecting calling code: A private data member is under your control. You can switch from holding it by value to holding by (smart) pointer or Pimpl (see Item 43) without breaking client code; you would only need to change the implementations of the class's own member functions that use it. If you decide you need different functionality, you can easily change the type of the member or the manner of holding it while keeping the class's public interface consistent. In contrast, if you begin with a public inheritance relationship, it is likely that clients have already come to depend on the inheritance; you have therefore committed your class to it and cannot easily change your base class decision later on. 
>   * Greater compile-time insulation, shorter compile times: Holding an object by pointer (preferably a smart pointer), rather than as a direct member or base class, can also allow you to reduce header dependencies because declaring a pointer to an object doesn't require that object's full class definition. By contrast, inheritance always requires the full definition of the base class to be visible. A common technique is to aggregate all private members behind a single opaque pointer, called a Pimpl. 
>   * Less weirdness: Inheriting from a type can cause name lookup to pull in functions and function templates defined in the same namespace as that type. This is very subtle and hard to debug. 
>   * Wider applicability: Some classes were not designed to be bases in the first place. Most classes, however, can fulfill the role of a member. 
>   * Great robustness and safety: The tighter coupling of inheritance makes it more difficult to write error-safe code. 
>   * Less complexity and fragility: Inheritance exposes you to additional complications, such as name hiding and other complications that can arise in the presence of later changes to the base class.

In essence, inheriting for code reuse makes your design brittle. Changes in strange places manifest themselves in even stranger places. If your language doesn't support multiple inheritance (like C# and Java), then if you use an form of class-based inheritance in your code, you are effectively preventing good Liskov-style inheritance by people who consume your code. Bad bad bad bad. 

When you do use inheritance from a base class in your design, look for these gotchas: 

  * Protected methods in the base class - This is the stink that is the smell that Herb talks about above.
  * Calling public methods in the base class from the derived class - Slightly less smelly, but still not good.

Honestly, it makes me want to try to eliminate all nonabstract inheritance in my code. In languages with good duck typing, I'd say eliminate inheritance entirely, because in those systems the only good reason to use inheritance is for derived class code reuse. I know this is an over aggressive reaction but I do wonder what our code would look like if we had good composition constructs in the language (we don't) and if we either went with pure duck typing (ala Ruby) or interface-only inheritance. 

Like that's gonna happen... 
