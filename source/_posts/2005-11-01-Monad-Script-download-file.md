---
layout: post
title: "Monad Script: download-file"
comments: false
date: 2005-11-01 20:42:00
updated: 2008-07-06 19:38:21
categories:
 - Technology
tags:
 - powershell
subtext-id: 1a0e3b5b-65a8-45f8-9384-e3415b68f68a
alias: /blog/Monad-Script-download-file.aspx
---


Have you ever found a something on the web and wanted to download it but there isn't a link? If you have the URL but don't have a link that you can right-click to save, you can use this little MSH script: 

Put the following into a file called download-file.msh: 

.csharpcode { font-size: 0.85em; color: black; font-family: Courier New , Courier, Monospace; background-color: #ffffff; /*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt { background-color: #f4f4f4; width: 100%; margin: 0em; } .csharpcode .lnum { color: #606060; } 
    
    
    $webclient = new-object System.Net.WebClient
    $start = $args[0].LastIndexOf("/") + 1
    $len = $args[0].LastIndexOf("?") - $start
    if( $len -lt 0 ) { $len = $args[0].Length - $start  }
    $target = [System.IO.Path]::Combine( $(get-location), $args[0].Substring( $start, $len ) )
    $webclient.DownloadFile($args[0], $target)
    

Now from a MSH prompt you can typeΓÇª

MSH:1> download-file "http://www.peterprovost.org/Skins/peter2/Images/Title.png"

ΓÇªand it will download the header image from my blog to your current directory. You can use it with just about anything. 

Enjoy! 
