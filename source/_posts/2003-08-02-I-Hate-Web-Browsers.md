---
layout: post
title: "I Hate Web Browsers"
comments: false
date: 2003-08-02 20:26:00
categories:
 - Technology
subtext-id: 8e2782e5-74c2-4fe1-9ecf-f2aecfff5cc8
alias: /blog/post/I-Hate-Web-Browsers.aspx
---


Just when I thought things were getting better in browser land, I'm pissed off again.

I wanted to create a javascript/css weblog layout that looks like Outlook 2003. It took me about an hour to code it and test it using IE6. Then I decided to test it in Mozilla.

That's when all hell broke loose. I thought Mozilla and IE6 were pretty darn close in how they render CSS, but apparently I was wrong. Simple things are still complicated by all kinds of stupid browser checking code.

For example, this is the only _safe_ way to get the height of the document:
    
    function getDocumentHeight()  
    {  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;d = document ? document : 0  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;db = d.body ? d.body : 0;  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;de = d.documentElement ? d.documentElement : 0;  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;winHeight = (de && de.clientHeight) ? de.clientHeight : (db && db.clientHeight) ?   
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; db.clientHeight : (window.innerHeight) ? window.innerHeight : 0;  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;return winHeight;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;  
    }

You've got to be kidding me! Does the W3C DOM standard define this? Honestly I don't care if I have to use one way (document.body.offsetHeight for IE) or the other way (document.body.clientHeight for Mozilla). I just don't want to have to play these stupid games anymore.

Once I had solved that problem, I ran into a problem with sizes. I still havent' solved this one, but it is really pissing me off.

I have a DIV inside of another DIV. The parent DIV is positioned correctly. The child has its position style attribute set to relative. Then from script I set the inner element to be slightly smaller and centered in the parent. According to the style, it is correct. But according to the offsetHeight and offsetWidth property, Mozilla is using something else!

What the hell is going on here? I fucking hate web browsers. Just when you think you can do something cool, you end up spending all your time fighting stupid crap like this.
