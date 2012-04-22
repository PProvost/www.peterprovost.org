---
layout: post
title: "World of Warcraft Addon Updater in PowerShell"
comments: false
date: 2007-03-03 21:48:00
updated: 2008-07-06 19:41:36
categories:
 - Games and Other Fun Stuff
 - Technology
tags:
 - powershell
 - warcraft
subtext-id: 242810b8-b814-42cc-b656-c46b023bfb30
alias: /blog/post/World-of-Warcraft-Addon-Updater-in-PowerShell.aspx
---


**UPDATE:** I am now maintaining this script over on my [Warcraft Wiki site on pbwiki](http://quaichewiki.pbwiki.com/PowerShellAddonUpdater). Please go there for documentation and the most recent updates. 

I couldn't resist. Sometimes I don't even know why I do these things. Last night I decided to start playing with [System.Net.WebClient](http://msdn2.microsoft.com/en-us/library/system.net.webclient(VS.80).aspx) from [Windows PowerShell](http://www.microsoft.com/windowsserver2003/technologies/management/powershell/default.mspx) and four hours later I had something close. A few more hours today and now I have a PowerShell script that: 

  * Updates [Subversion](http://subversion.tigris.org/) working copies (can be disabled w/ a switch) 
  * Can be configured to check for updates from [wowinterface.com](http://www.wowinterface.com/) using a simple data file in your addons folder called addons.ps1 (see the comment header below for a sample of this file) and a nice XML endpoint provided by the guys at wowi (thanks Dolby!) 
  * Will check to see if an addon is one of the [WowAce](http://www.wowace.com/) family of addons and will try to update it from their using their [RSS feed](http://files.wowace.com/latest.xml) for information.

I know I can add more addon sites to this later, but now that [Auctioneer](http://www.auctioneeraddon.com) is up on wowi (ID: 4812) I don't know if I have any addons that I use that can't be updated by this script. Perhaps one or two, but that isn't bad given that I have 169 addons in my Addons directory. 

This script has a few dependencies for extracting ZIP and RAR files. You will need to get [unzip.exe from Info-ZIP](http://www.info-zip.org/pub/infozip/UnZip.html#Win32) and [UnRar.exe from RARLabs](http://www.rarlab.com/rar_add.htm)&nbsp_place_holder;and put them both on your path. Both are free. 

Anyway, here is the script. There is a download at the bottom of this post for those of you who just want to have it. 

DISCLAIMER: This script is supplied without warranty or support. If you play WoW and don't know anything about PowerShell, this might be a bit much for you. Take a look at [WowAceUpdater](http://sf.net/projects/wowaceupdater) or [WUU](http://sourceforge.net/projects/wuu) instead. 
    
    
      1 #########################################################################
      2 # Name: update-addons.ps1
      3 # Version: 1.0
      4 # Author: Peter Provost <peter@provost.org>
      5 #
      6 # Usage: update-addons [-skipSvn]
      7 #
      8 # Remarks: This is a simple powershell script for updating your
      9 #   World of Warcraft addons. It will autodetect SVN working copies
     10 #   and update them. It will look for a file called addons.ps1
     11 #   in your Addons folder to define special locations for downloading
     12 #   addons (see below for a sample addons.ps1). After that it will test
     13 #   if the addon can be updated from [http://files.wowace.com](http://files.wowace.com). Any addon
     14 #   still unmatched will be skipped.
     15 #
     16 #   This sample addons.ps1 hows how to configure updates from 
     17 #   wowinterface.com:
     18 #
     19 #   $wowiAddons = @{
     20 #     'FlightMap' = 3897;
     21 #     'Clique' = 5108;
     22 #   };
     23 #
     24 #   At this point only wowinterface.com is supported in this data file
     25 #   but more may be added later.
     26 #
     27 #########################################################################
     28 
     29 **param** (
     30     **[switch]** $skipSvn
     31 );
     32 
     33 # Configuration - change these as needed
     34 $wowAddonDir = "C:\World of Warcraft\Interface\Addons";
     35 $stateFile = "PSUpdateAddons.state";
     36 
     37 **function** update-addon($addonSource, $downloadUrl, $remoteVersion, $fileName)
     38 {
     39     **if** ( $remoteVersion -**ne** $localVer) {
     40       **write-host** "$_ : ($addonSource) Update required: Current ver=$localVer, Remote ver=$remoteVersion";
     41 
     42       $tempFilePath = **join-path** $tempDir $fileName;
     43       **downloadextract-addon** $downloadUrl $tempFilePath;
     44 
     45       **write-host** "`tUpdating state file..." -noNewLine;
     46       $remoteVersion > $stateFilePath;
     47       "done." | **write-host**;
     48     } **else** {
     49       **write-host** "$_ : ($addonSource) Addon up-to-date. Skipping.";
     50     }
     51 }
     52 
     53 # Helper function for updating a single addon]
     54 **function** downloadextract-addon (**[string]** $uri, **[string]** $tempFile)
     55 {
     56   **write-host** "`tDownloading $uri to $($tempFile)..." -noNewLine;
     57   $wc.DownloadFile( $uri, $tempFile );
     58   **write-host** "done.";
     59 
     60   $ext = **[System.IO.Path]**::GetExtension($tempFile);
     61   **switch** ($ext) {
     62     ".rar" {
     63       **write-host** "`tExtracting RAR Archive..." -noNewLine;
     64       & unrar x -o+ $tempFile $wowAddonDir;
     65     }
     66     ".zip" {
     67       **write-host** "`tExtracting ZIP Archive..." -noNewLine;
     68       & unzip -o $tempFile -d $wowAddonDir;
     69     }
     70     **default** { **write-host** "UNKNOWN EXTENSION TYPE!" }
     71   }
     72   **write-host** "done.";
     73 
     74   **write-host** "`tDeleting zip file..." -noNewLine;
     75   **remove-item** $tempFile;
     76   **write-host** "done.";
     77 }
     78 
     79 **function** test-wowaceaddon( **[string]** $addonName )
     80 {
     81   **return** ((**get-wowaceaddon** $addonName)-**ne** $null)
     82 }
     83 
     84 **function** get-wowaceaddon( **[string]** $addonName )
     85 {
     86   $xpath = ("//item[title='ADDON']" -**replace** 'ADDON', $_.Name);
     87   **return** $indexXmlDoc.SelectSingleNode($xpath);
     88 }
     89 
     90 # Setup a few things before we get started
     91 $wc = **new-object** System.Net.WebClient;
     92 $tempDir = **join-path** (**get-content** env:\temp) "PsWowUpdater";
     93 **if** (-**not** (**test-path** $tempDir)) { **new-item** -type directory -path $tempDir; }
     94 
     95 # Load in the WowAce Index file
     96 **write-host** "Downloading latest.xml from [http://files.wowace.com](http://files.wowace.com)";
     97 $uri = "[http://files.wowace.com/latest.xml](http://files.wowace.com/latest.xml)";
     98 $rssData = $wc.DownloadString($uri);
     99 $indexXmlDoc = **[xml]** $rssData;
    100 
    101 # Load in the WOWI config database
    102 . (**join-path** $wowAddonDir "addons.ps1")
    103 
    104 (**get-childitem** $wowAddonDir | ? { $_.PSIsContainer }) | % {
    105 ## SVN UPDATE
    106   **if** (**join-path** $_.Fullname ".svn" | **test-path** ) {
    107     **if** ($skipSvn.isPresent) {
    108       **write-host** "$_ : Skipping SVN working copy";
    109     } **else** {
    110       **write-host** "$_ : Updating SVN working copy";
    111       svn up -q $_.Fullname;
    112     }
    113   }
    114 
    115 ## WOWINTERFACE.COM
    116   **elseif** ($wowiAddons.Contains($_.Name)) {
    117     $stateFilePath = **join-path** $_.Fullname "PSUpdateAddons.state";
    118     $localVer = "";
    119     **if** (**test-path** $stateFilePath) { $localVer = (**get-content** $stateFilePath); }
    120 
    121     $uri = ("[http://www.wowinterface.com/patcherXXXX.xml](http://www.wowinterface.com/patcherXXXX.xml)" -**replace** "XXXX", $wowiAddons[$_.Name]);
    122     $wowiXml = **[xml]** $wc.DownloadString($uri);
    123 
    124     $downloadUrl = $wowiXml.UpdateUI.Current.UIFileURL;
    125     $remoteVersion = $wowiXml.UpdateUI.Current.UIVersion;
    126     $fileName = $wowiXml.UpdateUI.Current.UIFile;
    127     $addonSource = "WowInterface.com";
    128 
    129     **update-addon** $addonSource $downloadUrl $remoteVersion $fileName
    130   }
    131 
    132 ## WOWACE FILES
    133   **elseif** (**test-wowaceaddon** $_.Name) {
    134     $stateFilePath = **join-path** $_.Fullname "PSUpdateAddons.state";
    135     $localVer = "";
    136     **if** (**test-path** $stateFilePath) { $localVer = (**get-content** $stateFilePath); }
    137 
    138     $elt = **get-wowaceaddon** $_.Name;
    139 
    140     $downloadUrl = $elt.enclosure.url;
    141     $remoteVersion = $elt.version;
    142     $fileName = $downloadUrl.Substring($downloadUrl.LastIndexOf("/")+1);
    143     $addonSource = "WowAce.com";
    144 
    145     **update-addon** $addonSource $downloadUrl $remoteVersion $fileName
    146   }
    147 
    148 ## Unknown addon source
    149   **else** {
    150     **write-host** "$_ : Can't figure this one out. Skipping.";
    151   }
    152 }
    

Download [update-addons.zip](/Files/update-addons.zip) (2KB). And here is my [addons.ps1 data file](/Files/addons.ps1.zip) to update my wowi addons. Create a file like that in your Addons folder and the script will find it. 
