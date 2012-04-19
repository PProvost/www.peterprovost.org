---
layout: post
title: "More About Code Generation"
comments: false
date: 2003-04-23 10:18:00
categories:
 - Technology
subtext-id: 0c76243e-cb96-4463-ac7e-b18281f0b922
alias: /blog/post/More-About-Code-Generation.aspx
---


[Gordon](http://radio.weblogs.com/0106046) [commented ](http://radiocomments2.userland.com/comments?u=120155&p=246&link=http%3A%2F%2Fwww.peterprovost.org%2F2003%2F04%2F22.html%23a246)on [my post about Code Generation ](http://www.peterprovost.org/2003/04/22.html#a246)with the following:

> _I think the original C++ "Compiler" was actually a C++ preprocessor that outputs C, which then gets compiled in the ordinary way. I think that the CFront C++ compiler works this way as well. _

That is exactly what I was talking about. C++ effectively provided a new level of abstraction on top of C. We were able to write code using these new abstractions (i.e. classes). The C++ "preprocessor" then produced C code which our compiler would turn into machine code. The fact that it happened behind the scenes doesn't really change the fact that we were using&nbsp_place_holder;a code generator.

I guess we have been using code generators all along, eh?
