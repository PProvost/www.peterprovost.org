---
layout: post
title: "Cleaning Up Badly Generated Html"
comments: false
date: 2003-05-21 20:04:00
categories:
 - Technology
subtext-id: 5301ddcd-9ee5-4f60-bcd8-3531ade63b94
alias: /blog/post/Cleaning-Up-Badly-Generated-Html.aspx
---


After reading [this post by The .NET Guy](http://dotnetguy.techieswithcats.com/archives/003271.shtml), I realized that many people out there aren't using [Html Tidy](http://tidy.sourceforge.net/) to clean up nasty HTML. Outlook and Word are notoriously bad HTML generators, and if NewsGator is using the built-in editors, no one should be surprised at the quality of the markup.

I use [TidyATL](http://users.rcn.com/creitzel/tidy/TidyATL.zip), which is a COM port of the original Tidy code maintained by Charlie Reitzel. He also has some [.NET wrappers available on his site](http://users.rcn.com/creitzel/tidy.html), but since they are just wrappers around the ATL library anyway, I just let VS.NET do the Interop for me.

Using TidyATL to cleanup bad markup is a breeze. If you want, it will even convert your markup to XHTML if you want. And, it is spectacular at removing bad MS-Word markup.&nbsp_place_holder;Here is a sample:
    
    public string TidyDocument( string html )  
    {  
    &nbsp_place_holder;Tidy.Document doc = new Tidy.DocumentClass();  
    &nbsp_place_holder;doc.ParseString( html );  
    &nbsp_place_holder;doc.SetOptBool( TidyATL.TidyOptionId.TidyWord2000, 1 );  
    &nbsp_place_holder;doc.SetOptBool( TidyATL.TidyOptionId.TidyBodyOnly, 1 );  
    &nbsp_place_holder;return doc.SaveString();  
    }

In this example I am telling Tidy that I want it to clean up Word markup and that I want it to produce only the body content. If I didn't provide that last option, it would have created the required <html>, <head>, and <body> elements.

As you can see, cleaning up bad HTML is easy. I don't know why more people aren't doing it.
