---
layout: post
title: "Annoying COM Interop Problem"
comments: false
date: 2003-08-30 02:15:00
categories:
 - Technology
subtext-id: c816185a-ad03-47a9-ad1a-5dbcb3f0a722
alias: /blog/post/Annoying-COM-Interop-Problem.aspx
---


Yesterday I discovered something annoying about COM Interop from C# (I don't know if this applies to VB.NET or not).

I was working my way through one of the Office 2K3 [Smart Documents tutorials](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/odc_wd2003_ta/html/odc_smartdocovw.asp), which was written for VB6, when I ran across this line on VB code:

> Dim strText As String  
strText = objDoc.SmartTags.Item _  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; (Index:=SMARTDOC).SmartTagActions.Item _  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; (Index:=SMARTDOC & _  
&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; SMARTDOC_TEXTBOX).TextboxText

Now, I assumed that I would be able to type the following C# code:

> string text = TheDocument.SmartTags[SMARTDOC].SmartTagActions[SMARTDOC + SMARTDOC_TEXTBOX].TextboxText;

The most interesting thing is that the VS.NET Intellisense actually liked it when I typed it that way. It kept prompting me with the members lists as I worked my way through the object model.

But when I compiled it, I got a nasty error:

> error CS1546: Property, indexer, or event 'this' is not supported by the language; try directly calling accessor method 'Microsoft.Office.Interop.Word.SmartTags.get_Item(ref object)'

Bummer. I popped over to the VS.NET object browser and it looked alright, but no dice. After digging around on Google Groups, I saw somebody mention that some VB-focused COM code will expect a ByRef Variant, hence the 'ref object' in the error message.

So the only way to fix that is to pass a ref object to the actual getter method, which isn't the array indexer but is a method called get_Item. Here is the code I ended up with:

> object temp = SMARTDOC;  
string text = ThisDocument.SmartTags.get_Item(ref temp).SmartTagActions.get_Item(ref temp).TextboxText;

The get_Item method isn't shown in the object browser, but it is really there so you can call it. Crazy, eh? But it works.

If you ever see that "not supported by the language" error, remember this.
