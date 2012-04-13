---
layout: post
title: "OpenPGP.NET - Part 2 - FxCop"
comments: false
date: 2003-09-17 22:09:00
updated: 2004-05-02 09:36:00
categories:
 - Technology
subtext-id: 18511996-9415-4002-bf5e-521a07cf1979
alias: /blog/OpenPGPNET---Part-2---FxCop.aspx
---


As I stated yesterday, one of the requirements that I've set for myself is that the library should pass the default FxCop rules. (Okay, I didn't actuall day which rules, but this is what I meant.)

I've been aware of FxCop for a while but haven't actually used it much. So I downloaded it from [GotDotNet](http://www.gotdotnet.com/team/fxcop/)├é and fired it up.

I created an FxCop project that referenced my Debug assembly and clicked "Analyze".

I got the following report:

  1. Error - 99% - Assemblies are marked CLSCompliant 
  2. Error - 99% - Assemblies should have the ComVisible attribute 
  3. Error - 95% - Assemblies have strong names 
  4. Error - 75% - Namespace acronyms of three or more characters are Pascal-cased 
  5. Warning - 50% - Avoid having a namespace with a small number of types

I then went through these one at a time and tried to make the error/warning go away.

The first error is "Assemblies are marked CLSCompliant"

When you read the rule details on this rule it says:

_Assemblies should explicitly state their CLS compliance using the CLSCompliant attribute. An assembly without this attribute is not CLS-compliant._

This one was relatively easy to fix and since I actually wanted to be CLS compliant, I added the attribute and rebuilt. Got it. One to├é the next one...

The second error is "Assemblies should have the ComVisible attribute". The rule details on this say:

_The ComVisible attribute indicates whether COM clients can use the library. Good design dictates that assemblies explicitly indicate COM visibility. _

Again, this sounds like a pretty good idea, so I fixed that one too. Next...

The third error was "Assemblies have strong names". This is one that I am familiar with. Here is the gist of strong names from the SDK:

_A├é strong name consists of the assembly's identity -- its simple text name, version number, and culture information (if provided) -- plus a public key and a digital signature. It is generated from an assembly file (the file that contains the assembly manifest, which in turn contains the names and hashes of all the files that make up the assembly), using the corresponding private key. Microsoft┬« Visual Studio┬« .NET and other development tools provided in the .NET Framework SDK can assign strong names to an assembly. Assemblies with the same strong name are expected to be identical._

Basically the idea is to create a guaranteed way of referencing exactly this assembly and not another. This is the solution to DLL hell that we experienced in Win32 and COM. Because it is my intention to ship this DLL to people for their use someday, I will certainly be strong naming it. I don't know of any particularly bad reason to strong name it now, so I went ahead and created a strong name key by running
    
    C:\Projects\OpenPGP\Core> sn -k OpenPGP.snk

This created the file but I also need to attach it to the assembly. I opened up AssemblyInfo.cs and scrolled to the bottom of the file and updated it to look like this:
    
    [assembly: AssemblyDelaySign(false)]
      
    [assembly: AssemblyKeyFile("..\\..\\OpenPGP.snk")]
      
    [assembly: AssemblyKeyName("")]

Compiled and re-ran FxCop. Bang. Another one bites the dust. Two more to go.

The next one is "Namespace acronyms of three or more characters are Pascal-cased". The rule details say:

_Acronyms of three or more letters should be Pascal-cased. For example, use System.Xml rather than System.XML._

While I understand and agree with this rule in general, I just don't like the look of "OpenPgp". It bugs me. So I decided to use FxCop's "Exlude Message" feature to basically say that I want this particular message exluded, but I want to leave the rule in place. A nice feature that is designed specifically for this reason.

The last one is "Avoid having a namespace with a small number of types." This is a rule that I wholeheartedly agree with, but honestly I don't care about it right now. My OpenPGP.Core.Packets namespace has only one class in it, UserIdPacket, but I know it will have more as time goes on so I will just leave this message unaddressed.

One additional thing that I did was have FxCop save a .fxcop file into my project folder. Then I added it into the VS.NET project and set the IDE to open FxCop when I double-click the file. This makes it very easy to run the FxCop checks periodically. I suppose I could add a Post-Build step too, but I'll think about that some other day.

Tonight if I can find time, I'll continue my TDD adventure by implementing a more complicated Packet type: LiteralMessage. (Still no crypto, but that is coming.)
