---
layout: post
title: "Passing Around XML"
comments: false
date: 2003-05-12 11:17:00
categories:
 - Technology
subtext-id: 1d36da03-e413-4b62-b75f-5ed1e264c48d
alias: /blog/Passing-Around-XML.aspx
---


In this post on News From the Forest, the author asks:

> _This is a simple one - how do you pass XML between layers and/or tiers? I'm not looking for the philosophical answer. I'm looking for the physical answer. We can debate the philosophical later._
> 
> _Do most of you pass strings, XmlNode, IXPathNavigable, or what?_
> 
> _Does it depend on the tier? For example - from your enterprise service component to the UI -> string. From in process component one to inprocess component two -> XmlNode._

Then Richard from StonglyTyped replies:

> _I typically avoid passing around XML but when I have in the past it's been "string" or "XmlNode'. I like to do the parsing up front and pass around structs or arrays. For large documents I just pass the URL or Filename._

This is an interesting reply. To me, the idea behind passing XML between tiers is to enable a looser coupling between layers. Especially when we are talking about layers where the technology platform is different from one tier to the next (i.e. Java and .NET). In situations like that, you have to pass strings. Strings are the only common serialized format of XML that is available to us right now. Maybe someday we will have a common binary format for the XML Infoset, but right now this is all we have.

If we have layers where we control both sides of the fence, then I would have to agree with Richard. Don't bother passing XML at all. In systems where I've already converted XML (or whatever) into my domain object model, then you may as well pass those classes between the layers. Of course, this assumes that you will never be changing the technology of each layer. Once you've committed to passing .NET classes between layers, it will be impossible to convert one layer to another technology without changing the interfaces or creating a facade layer.

So I would say if you are 100% sure that you won't need to change the technology behind the layers, go ahead and pass classes. Otherwise, pass serialized XML as strings.
