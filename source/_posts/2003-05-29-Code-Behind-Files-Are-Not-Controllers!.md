---
layout: post
title: "Code Behind Files Are Not Controllers!"
comments: false
date: 2003-05-29 09:31:00
categories:
 - Technology
subtext-id: af518101-7311-4e39-a75a-9289275d7c5d
alias: /blog/Code-Behind-Files-Are-Not-Controllers!.aspx
---


In [this post](http://radio.weblogs.com/0106747/2003/05/29.html#a322), [Scott Hanselman](http://radio.weblogs.com/0106747/) writes:

> One interesting thing, I'm running into a bit of trouble with number formatting, which I would have preferred to relegate entirely to the ASPX page...as if the ASPX page were truly the "View" to my Code-Behind "Controller."&nbsp_place_holder; While that's the dream, it's hardly the reality.&nbsp_place_holder; This kind of formatting creeps into my code-behinds, and leaps in to them when dealing with culture-specific data _input._
> 
> Things get so mixed up between ASPX and Code-Behind on a moderately complex ASP.NET page (considering a multi-lingual site and multi-currency-in-one-grid situation), once you factor in DataBinding Eval() statements, Totals in Footers, Sorting and Filtering, _it really makes me question the whole ASP.NET code-behind paradigm._

When I first read Scott's post, I was confused. Then I realized the problem: I don't think of Code Behind pages as controllers. I think of them as 'pre-compiled' code files for the ASPX front end. In fact, some of my ASPX don't have ANYTHING other than the <@Page> statement. I often put all of my view code in the Code Behind file.

But, [as you know](http://www.peterprovost.org/wiki/ow.asp?Test%2DDriven%5FDevelopment%5FIn%5F%2ENET), I am a big fan of MVC-like architectures. But unlike the PAG, I've never thought of the Code-Behind as an appropriate place for controller code. Let me explain a little...

The code behind file ends up being the base class for your ASPX file. It has fields that correspond to the controls layed out on the ASPX file. This level of coupling is far too great for my tastes. I get little or no code re-use of the controller and I certainly can't re-use a controller with a different view.

My preference is to use the Code Behind as place to map a View interface to the controls in the ASPX file. For example, if I have a login screen, I have my Code Behind file implement this interface:
    
    public interface ILoginView  
    {  
    &nbsp_place_holder; string Username { get; set; }  
    &nbsp_place_holder; string Password { get; set; }  
    }

Then my Controller class (e.g. LoginController) can be setup to talk to any class that implements ILoginView. It doesn't care if the view is an ASP.NET form or a Windows Form.

The other thing that I use Code Behind for is for doing the inevitable translations that need to occur. I don't just mean localization issues, but sometimes you will present a value to the user in a strange way that the Controller doesn't care about. Take Dates for example. Sometimes in an ASP.NET page, you will present a date as 3 separate dropdown lists, one each for month, day and year. Sometimes you will use the Web Forms Calendar control. Regardless, the Controller should just set the Date property on the view.

I hope all of this makes sense and helps explain things...
