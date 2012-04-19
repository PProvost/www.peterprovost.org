---
layout: post
title: "ASP.NET: showModalDialog() with ASPX page"
comments: false
date: 2003-05-20 20:55:00
categories:
 - Technology
subtext-id: 35d61678-a83d-4bd4-88e1-bdaecae4243b
alias: /blog/post/ASPNET-showModalDialog()-with-ASPX-page.aspx
---


You may not be familiar with it, but the IE DOM's window object has a method called showModalDialog that is used to create a modal popup window. It can be very useful, but if you've ever tried using an ASPX page in the dialog, you may have been surprised by what happens. When the form posts back to the server, is does so in a new window.

"What the...?" you ask! ([My wife](http://www.provost.org/emily-provost.asp) says this when she is perplexed by something.)

Well, believe it or not, it is by design. So deal with it. How? Simple...

Use an iframe. You have your showModalDialog call open a plain-Jane HTML file that contains the following:
    
    <iframe src="Dialog.aspx" width="100%" height="100%"></iframe>

Then Dialog.aspx can happily post-back and process the way you think. If you want the dialog to close after processing a button, you can do this:
    
    private void Button1_Click(object sender, System.EventArgs e)  
    {  
    &nbsp_place_holder; // Processing code...  
      Response.Write("<script>window.close()</script>");  
    }

Your popup window will close after you have done whatever form processing you needed to do. Works like a charm.

Enjoy!
