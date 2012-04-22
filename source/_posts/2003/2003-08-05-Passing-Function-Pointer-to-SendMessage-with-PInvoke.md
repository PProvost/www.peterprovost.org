---
layout: post
title: "Passing Function Pointer to SendMessage with P/Invoke"
comments: false
date: 2003-08-05 22:21:00
categories:
 - Technology
subtext-id: cb67d046-694b-40d0-8990-09e33a1196de
alias: /blog/post/Passing-Function-Pointer-to-SendMessage-with-PInvoke.aspx
---


I decided to try sorting the list before tackling positions. From my Win32 and MFC days, I knew exactly how to do this. Or so I thought.

As soon as I tried to pass a delegate as the LPARAM of SendMessage, I started crashing the Explorer.exe process. Does anyone out there know what is wrong with this code?
    
    &nbsp_place_holder;
    
    public delegate int CompareFunc(int lParam1,
      
                                     int lParam2,
      
                                     int lParamSort);
      
    
      
    [DllImport("user32.dll", EntryPoint="SendMessage")]
      
    public static extern int SendMessage(IntPtr hWnd, uint Msg, uint wParam,
      
            [MarshalAs(UnmanagedType.FunctionPtr)] CompareFunc compareFunc);
      
    
      
    [DllImport("user32.dll",EntryPoint="FindWindow")]
      
    private static extern int FindWindow(string _ClassName, string _WindowName);
      
    
      
    [DllImport ("user32.dll")]
      
    public static extern IntPtr GetWindow( IntPtr handle, int cmd );
      
    
      
    private void button1_Click(object sender, System.EventArgs e)
      
    {
      
       // const int LVA_DEFAULT = 0x0000; 
      
       const int LVM_FIRST = 0x1000;
      
    
      
       // ListView messages 
      
       // const int LVM_ARRANGE = (LVM_FIRST + 22); 
      
       const int LVM_SORTITEMS = (LVM_FIRST + 48); 
      
       const int GW_CHILD = 5; 
      
    
      
       int tmp = FindWindow( "ProgMan", null ); 
      
       IntPtr handle = new IntPtr(tmp); 
      
       handle = GetWindow( handle, GW_CHILD ); 
      
       handle = GetWindow( handle, GW_CHILD ); 
      
    
      
       CompareFunc f = new CompareFunc(Compare); 
      
       SendMessage( handle, LVM_SORTITEMS, 0, f );
      
    }
      
    
      
    public static int Compare( int lp1, int lp2, int lpSort )
      
    {
      
       return 0;
      
    }
