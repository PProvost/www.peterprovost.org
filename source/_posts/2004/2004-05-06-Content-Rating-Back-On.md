---
layout: post
title: "Content Rating Back On"
comments: false
date: 2004-05-06 20:13:00
categories:
 - Technology
subtext-id: 62717419-f43c-47c3-97d2-1d1e57a84ed1
alias: /blog/post/Content-Rating-Back-On.aspx
---


Again, many thanks to [Darrell Norton](http://dotnetjunkies.com/WebLog/darrell.norton/) for telling me that my new content rating system didn't work.

It turns out that the problem wasn't with the content rating system but with my dasBlog2DotText content conversion tool. I didn't escape the '<' and '>' characters when I moved them from dasBlog to .TEXT. I'm guessing that dasBlog did that on the way out while .TEXT does it on the way in... not sure.

Regardless, once I fixed the content in that article (and a few others) the whole thing started working again.

Thanks Darrell!
