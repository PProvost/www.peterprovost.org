---
layout: post
title: "Locking Down Specific Subfolders in ASP.NET Application"
comments: false
date: 2003-05-16 10:58:00
categories:
 - Technology
subtext-id: 75e2ef80-dbbf-41da-a543-0888c9d2cb42
alias: /blog/Locking-Down-Specific-Subfolders-in-ASPNET-Application.aspx
---


If you take a look in Google Groups, you will find tons of people over the last year who&nbsp_place_holder;have asked a question similar to this:

"How do I use forms authentication on a subfolder in my ASP.NET project?"

And more often than not, the answer is the same. Most people will tell you to create a separate web.config file for that directory. I don't like this for two reasons:

  1. I have to create a new Application in IIS.
  2. I have 2 web.config files to manage.

Sometimes you can't create a new web application (think shared hosting), and maintaining more than one web.config is annoying. My answer is this...

Add a <location> section to the bottom of your existing web.config like this:
    
    &nbsp_place_holder;<location path="Admin">  
    &nbsp_place_holder;&nbsp_place_holder;<system.web>  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;<authorization>  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;<allow users="Administrator" />  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;<deny users="*" />   
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;</authorization>  
    &nbsp_place_holder;&nbsp_place_holder;</system.web>  
    &nbsp_place_holder;</location>

Basically what this does is create a new little web.config for a particular folder, in this case ~/Admin/. Now you can set the same config values you would have used for the main web. In this example, we have configured the <authorization> element to allow the Administrator user, but to deny the Anonymous user (*).

Much easier to do that creating a whole new config.
