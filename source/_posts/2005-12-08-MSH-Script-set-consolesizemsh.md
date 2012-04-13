---
layout: post
title: "MSH Script: set-consolesize.msh"
comments: false
date: 2005-12-08 08:27:00
updated: 2005-12-08 08:53:00
categories:
 - Technology
subtext-id: 66117659-0970-4062-a217-5e316532b154
alias: /blog/MSH-Script-set-consolesizemsh.aspx
---


I often find that I have to switch between a number of different resolutions as part of my work. My laptop's native resolution is too big for most projectors, so I have to switch to 1024x768. But I also like to have my MSH window pretty big... still windowed but almost full-screen.

But when you have your console window big at 1400x1050, it is too big at 1024x768.

So I wrote this little MSH script. To use it, you can pass it nothing, in which case it will set your active console to 132x45 characters, you can pass it one value which it will use as a width and calculate and appropriate height, or you can pass it both a width and a height.
    
    $size = new-object System.Management.Automation.Host.Size 
    
    [int] $width = 132 
    [int] $height = 45 
    
    switch( $args.Length ) { 
        2 { 
            $width = $args[0] 
            $length = $args[1] 
        } 
         
        1 { 
            $width = [int] $args[0] 
            $height = [int] ($width / 3) 
        } 
        0 { 
            "No args..." | out-host 
        } 
    } 
    
    "Setting to $width x $height" | out-host 
    
    $bufferWidth = $host.UI.RawUI.BufferSize.Width 
    
    if( $bufferWidth -lt $width ) { 
        $size = $host.UI.RawUI.BufferSize 
        $size.Width = $width 
        $host.UI.RawUI.BufferSize = $size 
    
        $size.Width = $width 
        $size.Height = $height 
        $host.UI.RawUI.WindowSize = $size 
    } 
    else 
    { 
        $size.Width = $width 
        $size.Height = $height 
        $host.UI.RawUI.WindowSize = $size 
    
        $size = $host.UI.RawUI.BufferSize 
        $size.Width = $width 
        $host.UI.RawUI.BufferSize = $size 
    } 
    
    

Enjoy!
