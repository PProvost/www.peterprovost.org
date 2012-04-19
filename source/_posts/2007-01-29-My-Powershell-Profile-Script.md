---
layout: post
title: "My Powershell Profile Script"
comments: false
date: 2007-01-29 19:25:00
updated: 2008-07-06 10:44:15
categories:
 - Technology
tags:
 - powershell
subtext-id: 78e692a1-796d-45e9-b082-fbd82101e1f0
alias: /blog/post/My-Powershell-Profile-Script.aspx
---


The other day a friend asked me for my Powershell profile script. It reminded me of when we used to pass csh/ksh/bash scripts around... but now I'm showing my age. 

So, here is mine. Unlike Brad Wilson, I decided to put most of my stuff in this file and not to separate out things into separate .ps1 files. To each his own. There is basically no difference. 

(Download link is at the bottom) 
    
    
    ########################################################
    # Peter's PowerShell Profile (peter@provost.org)
    #  v2.0 (2007-01-13)
    ########################################################
    ########################################################
    # Aliases
    set-alias grep select-string;
    set-alias wide format-wide;
    ########################################################
    ########################################################
    # Environment variables
    set-content env:\VISUAL '"C:\Program Files\Vim\Vim70\gvim.exe"';
    ########################################################
    ########################################################
    # Helper Functions
    function ff ([string] $glob) { get-childitem -recurse -include $glob }
    function osr { shutdown -r -t 5 }
    function osh { shutdown -h -t 5 }
    function rmd ([string] $glob) { remove-item -recurse -force $glob }
    function whoami { (get-content env:\userdomain) + "\" + (get-content env:\username); }
    function strip-extension ([string] $filename) { 
    [system.io.path]::getfilenamewithoutextension($filename)
    } 
    ########################################################
    ########################################################
    # Prompt
    function prompt {
    $nextId = (get-history -count 1).Id + 1;
    $promptText = "[" + $nextId + "] ?";
    $wi = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $wp = new-object 'System.Security.Principal.WindowsPrincipal' $wi
    if ( $wp.IsInRole("Administrators") -eq 1 )
    {
    $color = "Red"
    $title = "**ADMIN** - " + (get-location).Path;
    }
    else
    {
    $color = "Green"
    $title = (get-location).Path;
    }
    write-host $promptText -NoNewLine -ForegroundColor $color
    $host.UI.RawUI.WindowTitle = $title;
    return " "
    }
    ########################################################
    ########################################################
    # Custom 'cd' command to maintain directory history
    if( test-path alias:\cd ) { remove-item alias:\cd }
    $GLOBAL:PWD = get-location;
    $GLOBAL:CDHIST = [System.Collections.Arraylist]::Repeat($PWD, 1);
    function cd {
    $cwd = get-location;
    $l = $GLOBAL:CDHIST.count;
    if ($args.length -eq 0) { 
    set-location $HOME;
    $GLOBAL:PWD = get-location;
    $GLOBAL:CDHIST.Remove($GLOBAL:PWD);
    if ($GLOBAL:CDHIST[0] -ne $GLOBAL:PWD) {
    $GLOBAL:CDHIST.Insert(0,$GLOBAL:PWD);
    }
    $GLOBAL:PWD;
    }
    elseif ($args[0] -like "-[0-9]*") {
    $num = $args[0].Replace("-","");
    $GLOBAL:PWD = $GLOBAL:CDHIST[$num];
    set-location $GLOBAL:PWD;
    $GLOBAL:CDHIST.RemoveAt($num);
    $GLOBAL:CDHIST.Insert(0,$GLOBAL:PWD);
    $GLOBAL:PWD;
    }
    elseif ($args[0] -eq "-l") {
    for ($i = $l-1; $i -ge 0 ; $i--) { 
    "{0,6}  {1}" -f $i, $GLOBAL:CDHIST[$i];
    }
    }
    elseif ($args[0] -eq "-") { 
    if ($GLOBAL:CDHIST.count -gt 1) {
    $t = $CDHIST[0];
    $CDHIST[0] = $CDHIST[1];
    $CDHIST[1] = $t;
    set-location $GLOBAL:CDHIST[0];
    $GLOBAL:PWD = get-location;
    }
    $GLOBAL:PWD;
    }
    else { 
    set-location "$args";
    $GLOBAL:PWD = pwd; 
    for ($i = ($l - 1); $i -ge 0; $i--) { 
    if ($GLOBAL:PWD -eq $CDHIST[$i]) {
    $GLOBAL:CDHIST.RemoveAt($i);
    }
    }
    $GLOBAL:CDHIST.Insert(0,$GLOBAL:PWD);
    $GLOBAL:PWD;
    }
    $GLOBAL:PWD = get-location;
    }
    ########################################################
    ########################################################
    # Custom PS-only path settings
    #   use this for directories that contain PS1 
    #   files since they generally can't be run 
    #   outside of PowerShell
    #
    function script:append-path {
    $oldPath = get-content Env:\Path;
    $newPath = $oldPath + ";" + $args;
    set-content Env:\Path $newPath;
    }
    append-path (resolve-path '~/PowerShell Scripts').Path
    ########################################################
    ########################################################
    # Custom format filters
    filter Format-Bytes {
    $units = 'B  ', 'KiB', 'MiB', 'GiB', 'TiB';
    $ln = [Int64]0 + $_;
    $u = 0;
    if($ln -eq 0) {
    return '0    ';
    }
    while(($ln -gt 1024) -and ($u -lt $units.Length)) {
    $ln /= 1024;
    $u++;
    }
    '{0,7:0.###} {1}' -f $ln, $units[$u];
    }
    ########################################################
    ########################################################
    # 'go' command and targets
    if( $GLOBAL:go_locations -eq $null ) {
    $GLOBAL:go_locations = @{};
    }
    function go ([string] $location) {
    if( $go_locations.ContainsKey($location) ) {
    set-location $go_locations[$location];
    } else {
    write-output "The following locations are defined:";
    write-output $go_locations;
    }
    }
    $go_locations.Add("home", "~")
    $go_locations.Add("dl", "~\Desktop\Downloads")
    $go_locations.Add("dev", "C:\Development")
    $go_locations.Add("scripts", "~\PowerShell Scripts")
    $go_locations.Add("addons", "C:\World of Warcraft\Interface\Addons")
    ########################################################
    

&nbsp_place_holder;

[Download Microsoft.PowerShell_profile.ps1.txt here](/Files/Microsoft.PowerShell_profile.ps1.txt). You will need to rename the file and put it where $profile is set. 
