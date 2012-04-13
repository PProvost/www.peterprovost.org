---
layout: post
title: "OpenPGP.NET - Part 2.5 - CVS Problems"
comments: false
date: 2003-09-18 17:34:00
updated: 2004-05-02 09:33:00
categories:
 - Technology
subtext-id: 06997492-747e-44e9-9309-c39e0cad7c6e
alias: /blog/OpenPGPNET---Part-25---CVS-Problems.aspx
---


Shortly after writing my last OpenPGP.NET post I decided that I should probably go ahead and push the code base into my CVS repository.

An interesting thing happened that I had heard about├é but not actually seen...

I had created an empty solition called OpenPGP. Within that I created two class library projects, one called "Core" and one called "UnitTests".

All was well with this until I tried to add it to CVS. Because of CVS' UNIX heritage, it doesn't like files (or folders) named Core. (For those of you who haven't done much UNIX development, core files are dumped to the file system when an app crashes -- also known as a core dump.)

I remember reading somewhere that there is a way around this but it made me think about whether Core was really a good name for this project. 

I decided "Framework" was better so I renamed the folder, changed the name of the namespace (for consistency sake) and updated all the references.

Now CVS likes it just fine. Whew.
