---
layout: post
title: "Regex Static Methods"
comments: false
date: 2004-12-23 10:10:00
updated: 2004-12-29 11:00:00
categories:
 - Technology
subtext-id: e05df55d-5270-4934-9005-30e1d96d178a
alias: /blog/Regex-Static-Methods.aspx
---


In [this post](http://www.jasonbock.net/JB/Default.aspx?blog=entry.20041222T195604), Jason Bock says...

> Today a co-worker pointed out the following line in the documentation for Regex: 
> 
> _Using a static method is equivalent to constructing a Regex object, using it once and then destroying it. _
> 
> Um...what?? 

Jason then shows a bunch of code that compares a type initializer (aka static constructor) with an instance constructor. He concludes with...

> The key point to see is that the type initializer for StaticMethodApproach is only called once. The constructor for InstanceMethodApproach is called every time you invoke CallMe(). In other words, the type is only loaded once, but you get three instances of InstanceMethodApproach. That doesn't seem "equivalent" to me. 
> 
> Instead of "equivalent", I would go with "analogous", although even that seems to be too strong of a connection between the concepts. Also, I checked the .NET 2.0 docs and it hasn't changed. I don't know, this just doesn't feel like the right wording to me.   


I think Jason is missing the point of the documentation. If we take a look back at the [Regex Class docs on MSDN](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfSystemTextRegularExpressionsRegexClassTopic.asp), it says this:

> The Regex class contains several static methods that allow you to use a regular expression without explicitly creating a Regex object. Using a static method is equivalent to constructing a Regex object, using it once and then destroying it.

This isn't making any statements about type initializers. It also isn't making a general statement about static methods vs. instance methods.&nbsp_place_holder;It is instead giving you a hint about the implemetation of the _these particular _static fa├â┬ºade methods. 

Take the static (Shared for you VB folks) Match method, for example, it has the following signature:
    
       1:  public static Match Match(
    
       2:     string input,
    
       3:     string pattern,
    
       4:     RegexOptions options
    
       5:  );

Now combine that with the documentation that says this method is "equivalent to constructing a Regex object, using it once and then destroying it." We can predict that Match will be implemented something like the following code. (A quick experiment with Reflector confirms it.)
    
       1:  public static Match Match( string input,
    
       2:                             string pattern,
    
       3:                             RegexOptions options )
    
       4:  {
    
       5:      return new Regex(pattern,options).Match(input);
    
       6:  }

So I would say that the phrase "is equivalent to" is completely accurate here. Wouldn't you agree?
