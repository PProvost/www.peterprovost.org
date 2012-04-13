---
layout: post
title: "csUnit and the GPL"
comments: false
date: 2003-07-01 19:42:00
categories:
 - Technology
subtext-id: f405e41c-b989-4352-a5a5-0b890b464fc7
alias: /blog/csUnit-and-the-GPL.aspx
---


Mike Gunderloy writes in [The Daily Grind 114](http://www.larkware.com/Articles/TheDailyGrind114.html):

> [csUnit](http://www.csunit.org/index.php) - GPL'd alternative to NUnit. Might bear some investigation. They certainly seem to be on a faster release schedule than NUnit. 

Hmmm... I hadn't noticed that csUnit was licensed under the [GPL](http://www.gnu.org/licenses/gpl.html). I don't know if I like this. I certainly don't like it when it comes to including tests inside of your production assemblies. The main problem is with this part of the [GPL](http://www.gnu.org/licenses/gpl.html):

> 2b. You must cause any work that you distribute or publish, that in whole or in part contains or is derived from the Program or any part thereof, to be licensed as a whole at no charge to all third parties under the terms of this License.

So if I use csUnit to test my code (particularly if I put the tests inside of the production assembly), then I MUST distribute the source of my product and I MUST license my product under the GPL. A number of people have discussed this in many places so I won't go much further that that, but I have to say GPL is a liablility to csUnit, which is otherwise an excellent product. There are a number of other open source licenses out there and I really think the authors of csUnit should consider switching to one of them... but of course they can't unless they start over. Because any new work would be derived from the GPL'd work, which would mean it has to be GPL'd too. See the problem with GPL?
