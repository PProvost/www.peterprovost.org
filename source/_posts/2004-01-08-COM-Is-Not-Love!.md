---
layout: post
title: "COM Is Not Love!"
comments: false
date: 2004-01-08 21:09:00
updated: 2004-05-01 14:41:00
categories:
 - Opinions, Politics, Rants
 - Technology
subtext-id: b85b318f-88fb-47fb-b922-efac1afbef45
alias: /blog/COM-Is-Not-Love!.aspx
---


Maybe [COM Is Love](http://c2.com/cgi/wiki?ComIsLove) was valid back when we didn't have anything better, but having spent the last two years working in managed code land, I fucking hate it. 

We are creating an Outlook AddIn in C++. For a while there, the primary developer was worrying more about figuring out how to make Extended MAPI work than he was worrying about managing his COM pointers properly. No big deal, we probably had some COM leaks, but we would find them later. 

So I spent half the day today fixing all the COM references and now my addin won't unload. Outlook doesn't ever close. I'm sure I'm leaving a ref count up, but I hate having to chase this crap down. The tools for finding these leaks are pathetic. About the only way to really do it is by carefully tracing the code and watching the ref counts. It absolutely blows. 

There... now that I have that off my chest, I'll go to sleep and in the morning I'll find the extra AddRef. 
