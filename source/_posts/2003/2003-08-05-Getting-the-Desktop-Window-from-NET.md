---
layout: post
title: "Getting the Desktop Window from .NET"
comments: false
date: 2003-08-05 20:32:00
categories:
 - Technology
subtext-id: 3d54686b-6604-4d90-8c4a-5dbfc5b722e7
alias: /blog/post/Getting-the-Desktop-Window-from-NET.aspx
---


I don't organize my Windows desktop like most people. I like to have my icons in rows not columns. So I get very annoyed anytime something on the system causes a desktop refresh. Suddenly all of my icons are back where Microsoft decided they should be instead of where I decided they should be.

I've been thinking about writing an app to do this for a few years, but I never got around to starting one until today.

I decided to create a [solution spike](http://www.c2.com/cgi/wiki?SpikeSolution) to learn a few things that I didn't know already. First problem? How do I talk to the desktop window from .NET.

As far as I can tell you can't do it using Windows Forms... you have to use P/Invoke. So I created a quick little WinForms app to test it out.

I created a Form and added a button to it. Then I added the following event handler.
    
    [DllImport("user32.dll", EntryPoint="SendMessage")] 
      
    public static extern int SendMessage(IntPtr hWnd,
      
                                          int Msg,
      
                                          int wParam,
      
                                          int lParam); 
      
    
      
    [DllImport("user32.dll",EntryPoint="FindWindow")]
      
    private static extern int FindWindow(string _ClassName,
      
                                          string _WindowName);
      
    
      
    [DllImport ("user32.dll")]
      
    public static extern IntPtr GetWindow( IntPtr handle, int cmd );
      
    
      
    private void button1_Click(object sender, System.EventArgs e)
      
    {
      
      const int LVA_DEFAULT = 0x0000;
      
      const int LVM_FIRST = 0x1000; // ListView messages
      
      const int LVM_ARRANGE = (LVM_FIRST + 22);
      
      const int GW_CHILD = 5;
      
    
      
      int tmp = FindWindow( "ProgMan", null );
      
      IntPtr handle = new IntPtr(tmp);
      
      handle = GetWindow( handle, GW_CHILD );
      
      handle = GetWindow( handle, GW_CHILD );
      
    
      
      SendMessage( handle, LVM_ARRANGE, LVA_DEFAULT, 0 );
      
    }
    

Success! The desktop arranged itself. 

Next task... figuring out how to actually arrange icons in a list view.
