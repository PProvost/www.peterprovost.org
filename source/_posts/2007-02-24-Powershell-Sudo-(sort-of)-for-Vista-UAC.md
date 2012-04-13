---
layout: post
title: "Powershell Sudo (sort of) for Vista UAC"
comments: false
date: 2007-02-24 19:46:00
updated: 2008-07-06 10:32:25
categories:
 - Technology
tags:
 - vista
 - powershell
subtext-id: b8704a3e-7d30-4bdc-8c3f-914c71b54eab
alias: /blog/Powershell-Sudo-(sort-of)-for-Vista-UAC.aspx
---


_**UPDATE 2007-02-25 0815am:   
**  
[Wes Haggard](http://weblogs.asp.net/whaggard/) sent me an email this morning that caused me to "slap myself upside the head":_

> Why got through this trouble when you can just user Process.Start? 
> 
> PS> $psi = new-object System.Diagnostics.ProcessStartInfo "notepad.exe"  
PS> $psi.Verb = "runas"  
PS> [System.Diagnostics.Process]::Start($psi) 

_Oops. My bad. Hahaha... can't believe I didn't try that. :)  
_

I've been running with a Least-Privileged User (aka LUA) account for years on Windows XP. I was quite excited to get onto Vista w/ its UAC stuff built-in. 

But then I discovered that as so often happens, they forgot those of us who like to use command shells. Now, you know that I love Powershell. I think it is one of the coolest developer innovations out of Microsoft in years. (To be honest, I'm surprised the Java and Ruby camps didn't come up with the idea first, but I'm glad they didn't. But&nbsp_place_holder;I digress...) 

Anyway... I like running in my Powershell window. I have one open always. I have lots of functions, aliases and other stuff that do work for me. I love it. 

Believe it or not, out of the box there is no way to say "Run as Administrator" in the UAC way. You can use runas.exe but that will prompt you for a complete username/password set instead of using your UAC elevation settings. I knew there had to be a way to do it from code, but my first 30 second search a few weeks ago didn't turn up the answer so I put it aside. After a bit of digging today though, I discovered that you can accomplish this by simply calling ::ShellExecute with the little known and poorly (un)documented verb "runas". 

In other words,&nbsp_place_holder;a C++ Win32 program could do this... 
    
    
    ::ShellExecute( NULL, "runas", "notepad.exe", NULL, NULL, SW_SHOWNORMAL );
    

...and Notepad would be run using UAC privilege elevation on Windows Vista. Right on. Seems like only&nbsp_place_holder;a little bit of work should be required to turn this into a Powershell Cmdlet and I would have it right at my fingertips. 

Here's the code. It is pretty self-explanatory. I went ahead and made the verb be a Cmdlet parameter so you can control it, and set the default to "open". Then to elevate in Powershell, I just pass the '-verb runas' option. 
    
    
    [Cmdlet("start", "process", SupportsShouldProcess = true)]
    public class StartProcessCmdlet : Cmdlet
    {
    private string _process = String.Empty;
    private string[] _arguments = { };
    private string _verb = "open";
    [Parameter(Position = 0,
    Mandatory = true,
    ValueFromPipeline=true,
    HelpMessage = "The name of the process to start.")]
    [ValidateNotNullOrEmpty]
    public string Process
    {
    get { return _process; }
    set { _process = value; }
    }
    [Parameter(Position = 1,
    Mandatory = false,
    ValueFromRemainingArguments=true,
    HelpMessage = "Arguments for the process.")]
    public string[] Arguments
    {
    get { return _arguments; }
    set { _arguments = value; }
    }
    [Parameter(
    Mandatory = false,
    HelpMessage = "Specifies the verb to use when calling ShellExecute.")]
    public string Verb
    {
    get { return _verb; }
    set { _verb = value; }
    }
    protected override void ProcessRecord()
    {
    try
    {
    int result = SafeImports.ShellExecute(IntPtr.Zero, _verb, 
    _process, GetParameters(_arguments), String.Empty, 
    SafeImports.ShowCommands.SW_SHOWNORMAL);
    if (result <= 32)
    {
    throw new ArgumentException("An error occurred calling ::ShellExecute().");
    }
    }
    catch (Exception e)
    {
    ThrowTerminatingError(new ErrorRecord(e, "ERROR", ErrorCategory.NotSpecified, null));
    }
    }
    private static string GetParameters(string[] args)
    {
    StringBuilder sb = new StringBuilder();
    foreach (string arg in args)
    {
    sb.Append(arg);
    sb.Append(' ');
    }
    return sb.ToString();
    }
    }
    

This is not a complete project, so you will probably want to install the [Powershell SDK](http://msdn2.microsoft.com/en-us/library/ms714469.aspx) and [a few other goodies](http://blogs.msdn.com/daiken/archive/2007/02/07/creating-a-windows-powershell-cmdlet-using-the-visual-studio-windows-powershell-templates.aspx) if you want to compile and run this thing, but once you do that it is all easy as pie. Also, the SafeImports class (not shown here) just contains the [DllImport directives for ShellExecute from PInvoke.net](http://www.pinvoke.net/default.aspx/shell32/ShellExecute.html). 

Enjoy! 
