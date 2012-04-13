---
layout: post
title: "Nine Months of WoW UI Modding"
comments: false
date: 2006-09-07 21:22:00
updated: 2008-07-06 19:43:18
categories:
 - Games and Other Fun Stuff
tags:
 - warcraft
subtext-id: a2c13fa0-19f3-4217-a89e-86062e81b72d
alias: /blog/Nine-Months-of-WoW-UI-Modding.aspx
---


A little over nine months ago, much to the dismay of my wife,&nbsp_place_holder;my addiction to [World of Warcraft](http://www.worldofwarcraft.com/) began. At first it was just another game to play in my spare time, but I quickly fell in love with the teaming aspects of playing in an online world with dozens of my friends and thousands of other people. 

Shortly after that I discovered that the WoW client isn't just a game shell, but is a fully customizable smart client environment. I started downloading mods from sites like [WorldOfWar.net](http://ui.worldofwar.net/) and [WoWInterface.com](http://www.wowinterface.com/). I started out simply with a set of addons called [CTMod](http://www.ctmod.net/) and slowly progressed into more and more addons. 

Feb 08, 2006:  
[![](http://img399.imageshack.us/img399/1351/WoWScrnShot_020806.th.jpg)](http://img399.imageshack.us/my.php?image=WoWScrnShot_020806.jpg)
Mar 31, 2006:  
[![](http://img399.imageshack.us/img399/2875/WoWScrnShot_031506.th.jpg)](http://img399.imageshack.us/my.php?image=WoWScrnShot_031506.jpg)
Apr 01, 2006:  
[![](http://img399.imageshack.us/img399/4683/WoWScrnShot_040106.th.jpg)](http://img399.imageshack.us/my.php?image=WoWScrnShot_040106.jpg)

After that I discovered how amazingly configurable the environment can be when I discovered a set of addons called [Discord Mods](http://www.discordmods.com/). DiscordFrameMover let me move, hide&nbsp_place_holder;or resize any visual element on the screen. DiscordUnitFrames let me create very rich frames of information about my players, my targets and the members of my group. DiscordActionBars let me create button bars that change as the environment changed around me. This was amazing stuff. 

Apr 04, 2006:  
[![](http://img399.imageshack.us/img399/1562/WoWScrnShot_040406.th.jpg)](http://img399.imageshack.us/my.php?image=WoWScrnShot_040406.jpg)
Apr 06, 2006:  
[![](http://img399.imageshack.us/img399/5392/WoWScrnShot_040606.th.jpg)](http://img399.imageshack.us/my.php?image=WoWScrnShot_040606.jpg)
Apr 16, 2006:  
[![](http://img399.imageshack.us/img399/7025/WoWScrnShot_041606.th.jpg)](http://img399.imageshack.us/my.php?image=WoWScrnShot_041606.jpg)

Then I decided I was ready to see how these addon things really worked. I started exploring the [Lua language](http://www.lua.org/home.html), the [WoW API](http://www.wowwiki.com/World_of_Warcraft_API) and the [XML-based widget language](http://www.wowwiki.com/XML_User_Interface). I started working on my first Addon: a simple reminder to tell me when my rogue's poisons expired. What I found was that writing well designed modular code was frighteningly hard using the out-of-the box tools and API. Frustrated, I started looking around for alternatives and finally stumbled on the [Ace libraries](http://www.wowace.com/). 

Using these libraries I was able to recreate my poison addon with a dozen or so lines of code and I didn't come away feeling dirty from all the spaghetti in my Lua files. I felt like my code was nice and modular. The object-oriented nature of the Ace approach felt good. 

As I explored Ace I learned that these folks had spent a LOT of time thinking about performance and memory consumption in their addons and had rewritten a number of important addons using their framework and thereby consuming&nbsp_place_holder;a lot less resources. Another thing I liked that aligned well with my philosophically was the Ace attitude about using more small single minded addons instead of a few large monolithic addons. I immediately started systematically trying to replace all of my non-Ace addons with Ace replacements. 

I also continued to expand my Rogue poison addon eventually turning it into a full blown ItemBuff management addon for all classes called FuBar_PoisonFu. When I finished that I realized that even though Ace is easier than stock WoW, there wasn't really enough tutorial information to help people get started, so I wrote [WelcomeHome - Your first Ace2 Addon](http://www.wowace.com/index.php/WelcomeHome_-_Your_first_Ace2_Addon) over on the Ace wiki. I'm also working on two or three other addons that I will be publishing to WoWInterface.com via my [authors portal](http://provost.wowinterface.com/). 

Aug 21, 2006:  
[![](http://img399.imageshack.us/img399/3909/WoWScrnShot_082106.th.jpg)](http://img399.imageshack.us/my.php?image=WoWScrnShot_082106.jpg)
Aug 29, 2006:  
[![](http://img399.imageshack.us/img399/8076/WoWScrnShot_082906.th.jpg)](http://img399.imageshack.us/my.php?image=WoWScrnShot_082906.jpg)
Sept 06, 2006:  
[![](http://img399.imageshack.us/img399/6432/WoWScrnShot_090606.th.jpg)](http://img399.imageshack.us/my.php?image=WoWScrnShot_090606.jpg)
Sept 07, 2006:  
[![Free Image Hosting at www.ImageShack.us](http://img463.imageshack.us/img463/9048/wowscrnshot090706hw9.th.jpg)](http://img463.imageshack.us/my.php?image=wowscrnshot090706hw9.jpg)

This is where I am today. That last screenshot has changes I made to the Unit Frames today. I still use DiscordUnitFrames and DiscordActionBars, but most of my other mods are Ace addons. My framerates are up, my memory consumption is down and I'm having as much fun being an addon author as I am playing the game. 

Since I know people will ask, here is my Addons list at this point: 

!!Warmup  
!BugGrabber  
!Layout  
Ace  
ag_UnitFrames  
ArcHUD2  
Atlas  
Auctioneer  
AuldLangSyne  
BeanCounter  
BonusScanner  
BugSack  
CT_MailMod  
CT_MapMod  
DamageMeters  
Detox  
DiscordActionBars  
DiscordActionBarsOptions  
DiscordLibrary  
DiscordUnitFrames  
DiscordUnitFramesOptions  
Enchantrix  
EnhTooltip  
FinderReminder  
FishingBuddy  
FlightMap  
ForAllIndentsAndPurposes  
FuBar  
FuBar-compat-1.2  
FuBar_AmmoFu  
FuBar_BagFu  
FuBar_ClockFu  
FuBar_CorkFu  
FuBar_DamageMetersFu 
FuBar_DPS  
FuBar_DurabilityFu  
Fubar_EmoteFu  
FuBar_ExperienceFu  
FuBar_FriendsFu  
FuBar_FuXPFu  
FuBar_GreedBeacon  
FuBar_GroupFu  
FuBar_GuildFu  
FuBar_KungFu  
FuBar_LocationFu  
FuBar_MailFu  
FuBar_MoneyFu  
FuBar_PerformanceFu  
FuBar_PoisonFu  
FuBar_QuestsFu  
FuBar_Speed  
FuBar_SummonFu  
FuBar_tcgTradeskills  
FuBar_TopScoreFu  
FuBar_Transporter  
FuBar_VolumeFu  
FuTextures  
idChat2  
idChat2_Buttons  
idChat2_ChannelNames  
idChat2_DisableFade  
idChat2_Editbox  
idChat2_EditboxArrows  
idChat2_PlayerNames  
idChat2_Scroll  
idChat2_StickyChannels  
idChat2_TellTarget  
idChat2_Timestamps
Informant  
LazyDruid  
LazyRogue  
LazyScript  
LFGSpam  
LifeTapWarn  
LitheSystemTray  
LuaSlinger  
MobHealth  
MobHealth3_BlizzardFrames  
MonkeyBuddy  
MonkeyLibrary  
MonkeyQuest  
MonkeySpeed  
MrPlow  
OneBag  
OneBank  
OneRing  
OneView  
OutfitDisplayFrame  
Outfitter  
QuickHeal  
Servitude  
SheepWatch  
Squeenix  
Squishy  
StoneScan  
Stubby  
tekSupport  
TheLowDown  
Visor  
VisorGUI  
WelcomeHome 

Many of these you can get from [www.wowinterface.com](http://www.wowinterface.com/)&nbsp_place_holder;or [ui.worldofwar.net](http://ui.worldofwar.net/). Others you have to dig a bit harder to find. Since most of the Ace developers use the same version control system, you can get up to the minute versions of many of the Ace mods from [www.wowace.com/files](http://www.wowace.com/files). You should assume, however, that those are betas. If you prefer stable stuff, stick with the stuff published to the main sites. 

Best of luck! If you play on Dragonblight, look me up. I'm Quaiche, Gaskett, Mirabel and Clavain in the&nbsp_place_holder;[Lithe guild](http://groups.yahoo.com/group/litheguild). 
