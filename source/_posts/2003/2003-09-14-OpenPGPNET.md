---
layout: post
title: "OpenPGP.NET"
comments: false
date: 2003-09-14 15:31:00
updated: 2004-05-02 09:36:00
categories:
 - Technology
subtext-id: c19af66a-602b-4e7c-bfc4-d4bb2d40c348
alias: /blog/post/OpenPGPNET.aspx
---


A while back [I posted about an OpenPGP for .NET implementation](http://www.peterprovost.org/weblog/PermaLink.aspx?guid=404) called SharpPrivacy. Until recently I hadn't had much time to go over the code with a serious eye. I spent 4 or 5 hours this weekend going through it and although it is fairly complete, the code isn't structured very well. Additionally there is a bunch of copied straight├é from the mono source that is redundant with the code in System.Security,Cryptography.

So, all of that said, I decided to start my open [OpenPGP](http://www.faqs.org/rfcs/rfc2440.html) implementation in C#. I'm going to use as much CLR provided functionality as possible to minimize code size. I'm also going to be implementing it in a [test-driven fashion](http://www.peterprovost.org/Test-Driven%20Development%20in%20.NET.pdf), so it should have a nice rich set of [checked examples](http://www.testing.com/cgi-bin/blog/2003/08/27#agile-testing-project-3) (aka unit tests).

I will probably use the SharpPrivacy code base as a reference at the beginning but since that project is [GPL](http://opensource.org/licenses/gpl-license.php) (not [LGPL](http://opensource.org/licenses/lgpl-license.php)) I don't want to include any of its code in this project. I want this project to be open source, but not as restricted as GPL projects (e.g. commercial use). Anyone want to suggest [a licence](http://opensource.org/licenses/)? I kind of like the [Artistic License](http://opensource.org/licenses/artistic-license.php) and the [BSD License](http://opensource.org/licenses/bsd-license.php).

I'm thinking about naming the project OpenPGP.NET, but that domain name is taken. That isn't really too important, but it would be nice to have a place to park this project if it goes well. Suggestions?

Also, I'd love to have another person to work on this project with me. I'm not going to release the code to the public until I feel it is actually usable, but I would love to have another person or two to code with. If you're interested, [drop me an email](mailto:peter@provost.org?subject=OpenPGP.NET).
