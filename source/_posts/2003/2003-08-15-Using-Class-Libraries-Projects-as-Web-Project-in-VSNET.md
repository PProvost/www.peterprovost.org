---
layout: post
title: "Using Class Libraries Projects as Web Project in VS.NET"
comments: false
date: 2003-08-15 03:55:00
categories:
 - Technology
subtext-id: 05a4c9c6-5867-4dc8-ba28-c709e514661b
alias: /blog/post/Using-Class-Libraries-Projects-as-Web-Project-in-VSNET.aspx
---


Richard Lawrence [asks in the comments](http://www.peterprovost.org/weblog/CommentView.aspx?guid=7B14AFAF-FDB8-4866-AA7A-F36FBC19597E) of my post Create the Solution Before Adding Projects

> Where can I find more information about making web projects work as Class Libraries? I've looked around on your site and Brad's, but no luck. Thanks.

Since as far as the compiler and the runtime are concerned there&nbsp_place_holder;is no difference between&nbsp_place_holder;web projects and assemblies, all you really have to do it convince VS.NET to behave. 

Here are the steps I follow. This process is far from ideal, but it works for me.

First you need to setup VS.NET to allow you to add web files to class library projects:

  1. Open the file WebProjectItems.vsdir in a text editor. (This file is typically installed in C:\Program Files\Microsoft Visual Studio .NET 2003\VC#\CSharpProjectItems\WebProjectItems)

  2. Open the file LocalProjectItems.vsdir in a text editor. (This file is typically installed in C:\Program Files\Microsoft Visual Studio .NET 2003\VC#\CSharpProjectItems\WebProjectItems)

  3. Copy the following lines from WebProjectItems.vsdir to LocalProjectItems.vsdir. (Note: I don't know if the GUIDs and IDs are different on different installs. If not you can just copy these.) (UPDATE: I broke the following lines so they would display better on my blog. Each entry is ONE line and begins with '..')
    
        &nbsp_place_holder;..\CSharpAddWebFormWiz.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2236|10|#2263|  
              {FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4534|0|WebForm.aspx  
        &nbsp_place_holder;..\CSharpAddWebServiceWiz.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2243|20|#2266|  
              {FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4521|0|Service.asmx  
    &nbsp_place_holder;    ..\CSharpAddMobileWebFormWiz.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2398|25|#2399|  
              {FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4571|0|MobileWebForm.aspx  
    &nbsp_place_holder;    ..\CSharpAddWebDataForm.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2380|45|#2381|  
              {FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4559|0|DataForm.aspx  
    &nbsp_place_holder;    ..\CSharpAddWebUserControl.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2378|55|#2379|  
              {FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4558|0|WebUserControl.ascx  
    &nbsp_place_holder;    ..\CSharpAddMobileWebUserControl.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2400|56|#2401|  
              {FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4572|0|MobileWebUserControl.ascx  
    &nbsp_place_holder;    ..\CSharpAddWebControlWiz.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2297|120|#2298|  
              {FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4533|0|WebCustomControl.cs  
    &nbsp_place_holder;    ..\StaticDisco.disco|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2393|155|#2394|  
              {FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4525|0|Disco.disco  
    &nbsp_place_holder;    ..\CSharpAddGlobalASAX.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2304|160|#2305|  
              {FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4542|8192|Global.asax  
    &nbsp_place_holder;    ..\CSharpAddWebConfig.vsz|{FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|#2312|170|#2313|  
              {FAE04EC1-301F-11d3-BF4B-00C04F79EFBC}|4545|8192|Web.config

Once you have done that, you can create a project.

  1. Open Visual Studio and create a Class Library project.

  2. Add a reference to System.Web

  3. Open IIS Manager

  4. Add a New Virtual Directory to your Default Web. I like to name mine the same thing as my Web (Class Library) Project.

  5. Browse to your project folder and click OK.

  6. From File Explorer, give the IUSR_MACHINENAME and ASP.NET accounts read and execute right on the files and folders in the project.

  7. In the project settings for your project, set the Configuration drop-down list to All Configurations. Set the following settings:
    
    &nbsp_place_holder;   Build:  
    &nbsp_place_holder;&nbsp_place_holder;    Output Path: bin\  
       &nbsp_place_holder;Debugging:  
    &nbsp_place_holder;&nbsp_place_holder;    Enable ASP.NET Debugging: True  
    &nbsp_place_holder;&nbsp_place_holder;    Debug Mode: URL  
    &nbsp_place_holder;&nbsp_place_holder;    Start URL: The url you setup for the virtual directory

  8. Build your project.

Debugging your project is done by attaching to the IE and ASP.NET_WP processes.

  1. Start your project by pressing F5. This will launch IE and attach to the running IE instance. 
  2. Once the web browser is up, choose "Processes..." from the Debug Menu. 
  3. Check the "Show System Processes" checkbox. 
  4. Select aspnet_wp.exe from the list and click Attach. 
  5. In the "Attach to Process" dialog, check "Common Language Runtime" and click OK. 
  6. Close the "Processes" dialog. 
  7. Set breakpoints and start debugging.

That's it. A few things to note:

  1. I'm pretty sure you could dig through the project config files in VS.NET and create a new project template that does all of the project setup steps. This exercise is left for the reader. 
  2. Your project will not have a Global.asax or a web.config file. Add them if you need them. 
  3. I don't know how to add "Web Form" to the "Add..." context menu in Solution Explorer. Anyone? 
  4. I would love to have better way of debugging.

Please leave comments if you know how to deal with these issues or if you know of a better way of doing this.
