---
layout: post
title: "Sharing Fakes between projects"
date: 2012-10-11 00:55
comments: true
published: false
categories: 
---


From my email to Brian Randell:

Yes there is. It isn’t something special really, just taking advantage of how VS builds and references work.

1.	Create a class library project to hold the Fakes, e.g. SharedFakesLib.
2.	In that project take references on what you want to fake, and the generate the fakes assembly.
3.	Create your unit test project.
4.	Add a reference from the test project to the generated assembly in the Fakes folder
5.	Add a reference to MS.QualityTools.Testing.Fakes in the test project (when you add a Fakes assembly we do this for you, but since you didn’t do it that way you have to do this part yourself to get the base types and the ShimsContext, etc.)

That’s the gist of it. Of course since we typically recommend that you do not check in the Fakes assemblies, you will need to ensure that the project dependency is handled properly by VS, so you should right click on the test project, choose Project Dependencies and tell it that the SharedFakesLib has to be built first.

In your case, since this is for a demo and you are trying to save yourself the generation time, you can check the Fakes assemblies into version control if that helps. We just recommend against it in the general case (and you should too).

I make a sample project and put it up at http://vs2012unittesting.codeplex.com/. The solution is called SharedFakesLibDemo.

Since you’re the second person to ask about this, I will probably write a blog post to go along with it, but not tonight. 

BTW, you should also talk to Joshua Weber (cc) about other options coming in the future for SharePoint unit testing. That is really the right way to go, not hand rolling Shims for SharePoint.
