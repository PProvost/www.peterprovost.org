---
layout: post
title: "External Config Files in .NET"
comments: false
date: 2003-04-13 21:34:00
categories:
 - Technology
subtext-id: dd88d403-42e3-447e-99d9-6f61e1476fbd
alias: /blog/post/External-Config-Files-in-NET.aspx
---


Thanks to Paul Wilson for this. You can partition your app.config or web.config file into two separate files. This is a very interesting idea, but I'm not sure what I would use it for.

The problems are that you can only use two files. The primary config file can't reference more than one external file and apparently (I haven't confirmed this) the "child" config file can't reference another. The second problem is that edits to this new config file aren't automatically detected by your application, so you must restart the app to have your changes take effect.

Paul suggests that this could be useful for keeping separate config entries for development, testing, production, etc.,&nbsp_place_holder;I suppose this could work but I would have to edit the primary config anyway. It might be nice to keep each config in source control, so perhaps this could be useful. I'll have to think about it.

If you were able to have multiple config files all referenced from the main app.config (or web.config), I would be singing a completely different tune. I could certainly see where a config file like this could be very nice:
    
    <configuration>
    &nbsp_place_holder; <appSettings file="YourSettings.config">  
      
      
      
      
        <ref src="logging.config" />  
        <ref src="database.config" />  
        <ref src="security.config" />  
    &nbsp_place_holder; </appSettings>
    </configuration>
    
