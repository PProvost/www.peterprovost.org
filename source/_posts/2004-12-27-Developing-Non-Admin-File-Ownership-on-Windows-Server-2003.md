---
layout: post
title: "Developing Non-Admin: File Ownership on Windows Server 2003"
comments: false
date: 2004-12-27 15:18:00
categories:
 - Technology
subtext-id: aa0aafcd-e99a-461a-ade4-dc88f36a348e
alias: /blog/Developing-Non-Admin-File-Ownership-on-Windows-Server-2003.aspx
---


So that I don't lose this later, and so it will help others out who run into this...

When you are developing non-admin, you will probabky end up using something like [Aaron Margosis' MakeMeAdmin tool](http://blogs.msdn.com/aaron_margosis/archive/2004/07/24/193721.aspx) to elevate your privileges when you need to do admin-like things. 

The problem comes when you are doing something in an admin context that creates files. In Windows XP, when you created a file as a member of the Administrators group, the file was owned by you. In Server 2003, it is owned by the Administrators group. Apparently this was to make it easier for multiple system adminstrators to work on a system. Each of them, by just being a member of the right group, gets ownership of all the files created by other admins. Makes sense.

But when you are developing, you may not want this behavior. Suppose for example that you perform a build of your application from a MakeMeAdmin boosted context. When the compiler is doing its dirty work, all those files in obj/ and bin/ will be owned by the Administrators group. If you later try to do a compile of the same project as a non-admin, it may fail because you may not have the rights to delete an administrator's file. Oops. Keith Brown talks about this in [Item 41](http://pluralsight.com/wiki/default.aspx/Keith.GuideBook.WhatIsOwnership) in [his book](http://www.amazon.com/exec/obidos/ASIN/0321228359/peterprovosto-20).

Now for the fix (similar to the one described&nbsp_place_holder;at the end of&nbsp_place_holder;[MSKB 318825](http://support.microsoft.com/?id=318825)):

  1. Use MakeMeAdmin or logon as the local machine administrator
  2. Launch **gpedit.msc**, the group policy editor.
  3. Navigate to **Computer Configuration/Windows Settings/Security Settings/Local Policies/Security Options** in the tree
  4. Double click on **System objects: Default owner for objects created by members of the Administrators group**.
  5. Change the value to **Object creator**.

Reboot and you're golden.

Note: You may have to use MakeMeAdmin to fix any files that were previously created.

**Now playing:** [Bob Marley & The Wailers](http://phobos.apple.com/WebObjects/MZSearch.woa/wa/advancedSearchResults?artistTerm=Bob Marley & The Wailers) - [Easy Skanking](http://phobos.apple.com/WebObjects/MZSearch.woa/wa/advancedSearchResults?songTerm=Easy Skanking&artistTerm=Bob Marley & The Wailers)
