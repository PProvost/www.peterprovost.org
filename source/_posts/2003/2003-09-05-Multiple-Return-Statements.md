---
layout: post
title: "Multiple Return Statements"
comments: false
date: 2003-09-05 19:44:00
updated: 2004-05-02 14:36:00
categories:
 - Technology
subtext-id: 9b593149-b1eb-4d69-8bf7-d1c86349223a
alias: /blog/post/Multiple-Return-Statements.aspx
---


I was involved in a code review the other day with a colleague and we got into a discussion about having multiple return statements in a method. He felt that it was almost always bad, and I felt that it depended on the code in question. My goal is to produce code that is easy to understand and has a minimal amount of duplication.

I think I know where this rule came from, and in some languages it makes sense. In C, C++, and COM, for example, you often have a method structure that looks something like this:
    
    function DoSomething()
    {  
        // Allocate some stuff  
      
        // Do something  
        // Release the stuff  
        // Return a value
    }

In this case, you want to make sure that you always release the memory that is allocated at the top. So by having developers always drop through to the return statement at the end, you help them to not forget. This actually makes the code easier to understand. It also produces code with less duplication.

But in languages with garbage collection (like C# and Java), you don't often need to do this. Notice I didn't say never. Even in GC systems, we still sometimes have to clean up after ourselves (e.g. IDisposable and COM proxies) but for the most part you don't have to.

So remember, a rule like this was originally created for a reason. But that doesn't mean you should follow it like a religious fundamentalist. Use your brain and decide when it is appropriate and when it isn't.

PS. If you run across code that was written with massively nested if statements to enforce this rule, take a look at the [Replace Nested Conditional With Guard Clauses](http://www.refactoring.com/catalog/replaceNestedConditionalWithGuardClauses.html) refactoring.
