---
layout: post
title: "PDC - PreCon Session - .NET The Smart Client Perspective (Part 3)"
comments: false
date: 2003-10-26 22:19:00
updated: 2004-05-01 16:34:00
categories:
 - Technology
subtext-id: da15869b-7d0f-48b4-bf4a-99558a6d4cfa
alias: /blog/post/PDC-e28093-PreCon-Session---NET-The-Smart-Client-Perspective-(Part-3).aspx
---

Whew! I'm starting to feel like Scoble with all this damn posting. But I did
promise that I would, and it is kinda fun 'cause I'll have this record to
remind me what I saw. There is no way I'll remember it all otherwise...

For about a half hour leading into lunch, Rocky dug into ADO.NET and data
binding. He was using all the VS.NET components and wizards which isn't really
my cup of tea, but that's just my opinion. He did show something that I haven't
seen before, mostly because I haven't done much data binding in WinForms...
    
``` csharp
private void BindControl()  
{  
   Binding b = new Binding("Text", ds, "customers.custToOrders.OrderAmount");  
   Format += new ConvertEventHandler(DecimalToCurrencyString);  
   b.Parse += new ConvertEventHandler(CurrencyStringToDecimal);  
   text1.DataBindings.Add(b);  
}
```

That is cool stuff. I've done so much ASP.NET data binding with templated
controls that I didn't realize you could do this. Good stuff.

Anyway... after lunch Rocky finished up ADO.NET and Chris took over... new
topic: Threads.

Chris' threads chat was excellent (although it was basically a rehash of the
threading chapter of [his
book](http://www.amazon.com/exec/obidos/ASIN/0321116208/peterprovosto-20)).
Rather than tell you all the good stuff he talked about, I would suggest
everyone just read [the
book](http://www.amazon.com/exec/obidos/ASIN/0321116208/peterprovosto-20). It
is a must-read if you do WinForms.

As we headed into the afternoon break, Rocky took over again and introduced
client/server/n-tier programming. Started asking the audience about the
difference between Remoting and Web Services, etc.

Break time!
