---
layout: post
title: "Design Guidelines for Class Libraries... TDD Anyone?"
comments: false
date: 2003-07-02 11:13:00
categories:
 - Technology
subtext-id: 902a7443-0cd1-4f35-8c68-36e8d77c50d3
alias: /blog/post/Design-Guidelines-for-Class-Libraries-TDD-Anyone.aspx
---


In this post, Brad Abrams writes a list of some excellent guidelines on designing good libraries. If you've used FxCop, you'll see some patterns here, especially in the naming conventions and such. One thing that really caught my eye was this:

> First Principles
> 
>   * What does your library look like to program against?
> 
>   * Design in reverse
> 
>     * Write the 3 lines of code the developer will have to write then model the APIs around making that possible
> 
>     * Example:&nbsp_place_holder; Console.WriteLine()
> 
>   * Understand what it is like from other languages as well

Could it be that someone inside of MS is pushing [Test-Driven Development](http://www.peterprovost.org/wiki/ow.asp?Test%2DDriven%5FDevelopment%5FIn%5F%2ENET)? I sure hope so. A full suite of unit tests for the CLR would be a wonderful thing to have. First of all it would make implementing ports (like [Mono](http://www.go-mono.com/)) much easier. Secondly, it would influence the design a bit and make future application and system testing easier too.
