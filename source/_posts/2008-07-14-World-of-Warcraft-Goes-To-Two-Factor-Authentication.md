---
layout: post
title: "World of Warcraft Goes To Two-Factor Authentication"
description : "Warcraft,Cryptography"
comments: true
date: 2008-07-14 10:37:07
categories:
 - Games and Other Fun Stuff
 - Technology
subtext-id: 9ffc197c-06b0-4282-a1d8-045c5d762230
alias: /blog/World-of-Warcraft-Goes-To-Two-Factor-Authentication.aspx
---


[![smartcard](/images/blog/WindowsLiveWriter/WorldofWarcraftGoesToTwoFactorAuthentica_A298/smartcard_thumb.jpg)](/images/blog/WindowsLiveWriter/WorldofWarcraftGoesToTwoFactorAuthentica_A298/smartcard_2.jpg) At Microsoft we've been using SmartCards for remote and building access for quite a while. This kind of authentication is called two-factor authentication because you use two different things to prove who you are, instead of just one (e.g. a password).

[Two-factor Authentication](http://en.wikipedia.org/wiki/Two-factor_authentication) on Wikipedia:

> An [authentication factor](http://en.wikipedia.org/wiki/Authentication_factor) is a piece of [information](http://en.wikipedia.org/wiki/Information) and [process](http://en.wikipedia.org/wiki/Process) used to authenticate or verify a person's [identity](http://en.wikipedia.org/wiki/Identity) for [security](http://en.wikipedia.org/wiki/Security) purposes. **Two-factor authentication (T-FA)** is a system wherein two different factors are used to authenticate. Using two factors as opposed to one delivers a higher level of authentication assurance. Using more than one factor is sometimes called **strong authentication**.

Recently the game of World of Warcraft has been plagued by a rash of accounts getting hacked. Typically this is caused by a combination of things:

  * The user is probably running as an administrator on their machine (I don't do this)
  * They probably doesn't have all their security software up-to-date (I do this constantly)
  * They were probably browsing websites that have either been compromised by a hacker or are specifically there to attract WoW players (I don't do this)

The end result is that they get a keylogger trojan installed on their machine. Apparently, this costs Blizzard a huge amount of money to address, so recently they announced a new two-factor system that uses a One Time Password token that the user must use with their regular password.

[One-time Password](http://en.wikipedia.org/wiki/One-time_password) on Wikipedia:

> The purpose of a **one-time password** (OTP) is to make it more difficult to gain unauthorized access to restricted resources, like a computer account. Traditionally [static passwords](http://en.wikipedia.org/wiki/Static_password) can more easily be accessed by an unauthorized intruder given enough attempts and time. By constantly altering the password, as is done with a one-time password, this risk can be greatly reduced.
> 
> There are basically three types of one-time passwords: the first type uses a mathematical algorithm to generate a new password based on the previous, a second type that is based on time-synchronization between the authentication server and the client providing the password, and a third type that is again using a mathematical algorithm, but the new password is based on a challenge (e.g. a random number chosen by the authentication server or transaction details) and a counter instead of being based on the previous password.

[![wow-keyfob](/images/blog/WindowsLiveWriter/WorldofWarcraftGoesToTwoFactorAuthentica_A298/wow-keyfob_thumb.jpg)](/images/blog/WindowsLiveWriter/WorldofWarcraftGoesToTwoFactorAuthentica_A298/wow-keyfob_2.jpg) Blizzard's token system is based on the time-synchronization method. The token is a small USB keyfob with an LCD display and a button. To use it, you first configure your account using the token's serial number. Then when you login, after providing your username and password, you press the button on the token and enter the number displayed on the screen.

Is this kind of thing foolproof? No, of course not. But since most WoW hackers were having their keyloggers post the username and password to a server somewhere for illicit use later, the number will most likely have expired before they get to it. (See Bruce Schneier's article [The Failure of Two-Factor Authentication](http://www.schneier.com/blog/archives/2005/03/the_failure_of.html) for more information about the vulnerabilities in these kinds of systems.)

Even though I've never had issues with my account security, I ordered mine the day they became available. Apparently so did many other WoW players... Blizzard sold out in an hour. Mine came on Friday and it works great.
