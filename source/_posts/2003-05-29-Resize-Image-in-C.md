---
layout: post
title: "Resize Image in C#"
comments: false
date: 2003-05-29 22:26:00
updated: 2004-08-10 22:05:00
categories:
 - Technology
subtext-id: bff8f2a8-e4fe-453e-b8bc-5693e77758c8
alias: /blog/post/Resize-Image-in-C.aspx
---


Someone asked me to post some code to resize an image. Assuming you know how to load one into a Bitmap, the following method will do it for you.

[UPDATE 2003-05-30 10:27PM] Jeff Lewis correctly pointed out that I forgot a couple of Dispose() calls. Oops. I have corrected the code below. Thanks Jeff.

[UPDATE 2004-08-10] Oops. Still not quite right. It is fixed now. But remember, the caller needs to Dispose() the returned Bitmap.
    
    public Bitmap ResizeBitmap( Bitmap b, int nWidth, int nHeight )  
    {  
      Bitmap result = new Bitmap( nWidth, nHeight );  
      using( Graphics g = Graphics.FromImage( (Image) result ) )  
        g.DrawImage( b, 0, 0, nWidth, nHeight );  
      return result;  
    }

Enjoy!
