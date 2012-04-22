---
layout: post
title: "Using the CAB Bank Teller Quick Start With Partial Trust ClickOnce Deployments"
comments: false
date: 2005-11-16 11:05:00
updated: 2008-07-06 19:17:47
categories:
 - Technology
tags:
 - cab
 - partial trust
 - .net
subtext-id: 6a7edd47-8c77-48eb-b114-2d7a97c67e80
alias: /blog/post/Using-the-CAB-Bank-Teller-Quick-Start-With-Partial-Trust-ClickOnce-Deployments.aspx
---


There have been a few posts on the [CAB message boards](http://www.gotdotnet.com/codegallery/messageboard/messageboards.aspx?id=22f72167-af95-44ce-a6ca-f2eafbf2653c) asking for instructions for getting the Bank Teller QuickStart working in a Partial Trust ClickOnce deployment. I took a few hours yesterday and carefully documented the steps required. This was based on a standard CAB installation done with the [November 2005 C# Release](http://www.gotdotnet.com/codegallery/releases/viewuploads.aspx?id=22f72167-af95-44ce-a6ca-f2eafbf2653c). 

  1. I assume you have ClickOnce working for a standard Windows Forms application. Please make sure you do before proceeding. If you need help with this please see [http://msdn2.microsoft.com/en-us/library/fb94w1t5(en-US,VS.80).aspx](http://msdn2.microsoft.com/en-us/library/fb94w1t5(en-US,VS.80).aspx)
  2. Open the BankTeller QuickStart.sln Solution File in Visual Studio 2005. Please make sure you are running Visual Studio as a local machine Administrator or some of the following steps won't work.
  3. In the BankShell Project, open App.config and add r**equirePermission="false"** to **each <section>** element&nbsp_place_holder;in the **<configSectionsElement>** at the top.
  4. Open ProfileCatalog.xml and comment out the CustomerMapExtensionModule.dll module. As far as we can tell, since that module uses Internet Explorer, it will require full trust.
  5. Right-click on the BankShell project and choose Properties. Ensure the following values are set on each of the indicated Tabs: 
    * Debug Tab 
      * Enable the Visual Studio hosting process - CHECKED
    * Signing Tab 
      * Sign the ClickOnce manifests - CHECKED
      * Use Create Test Certificate to create a certificate if you don't already have one.
    * Security Tab 
      * Enable ClickOnce Security Settings - CHECKED
      * Select "This is a partial trust application" from the drop down box.
      * Choose Local Intranet from the Zone dropdown box
      * Click the Calculate Permissions button
      * Ensure that the following permissions are set: 
        * EnvironmentPermission - Include Unrestricted
        * FileDialogPermission - (Zone Default)
        * FileIOPermission - Include Unrestricted
        * IsolatedStorageFilePermission - Include
        * ReflectionPermission - Include Unrestricted
        * RegistryPermission - (Zone Default)
        * Security Permission - Include - Grant the following permissions: 
          * Enable assembly execution
          * Allow calls to unmanaged assembliesSkip verification
          * Allow principal control
          * Create and control application domains
          * Enable serialization formatter
          * Allow evidence control
        * UIPermission - Include Unrestricted
        * KeyContainerPermission - Include
        * StorePermission - (Zone Default)
        * DnsPermission - (Zone Default)
        * PrintingPermission - (Zone Default)
        * SocketPermission - (Zone Default)
        * WebPermission - Include
        * EventLogPermission - (Zone Default)
        * PerformanceCounterPermission - (Zone Default)
        * OleDbPermission - (Zone Default)
        * SqlClientPermission - (Zone Default)
        * DataProtectionPermission - Include
      * Click the Advanced button. Make sure "Debug this application with the selected permission set" is CHECKED
  6. Press F5 to run the application in the debugger. The application should start just fine. If it does not and gives a security error, go back and double-check the security options you set in step 5.

Now that we have it running correctly, we have to make sure the files all deploy correctly using ClickOnce. Because ClickOnce uses a project's references to determine dependencies, it won't correctly identify that BankShell depends on BankTellerModule. The most CAB friendly way that we have found to get this resolved (without actually adding references to BankTellerModule) is to do this: 

  1. Right-click on the BankTellerModule project and choose Properties.
  2. Go to the Build Tab and change the Output path to "bin\Debug\".
  3. Build the BankTellerModule project
  4. Right click on the BankShell project and choose Add Existing Item from the Add menu. Browse to the BankTellerModule\Debug\bin directory. Change the File Type dropdown box to "Executable Files". Select BankTellerModule.dll. **Important: Do not click the Add button!** Instead, click the little down-arrow on the right side of the Add button and choose **Add As Link**. You should now see the BankTellerModule.dll file in the BankShell project and it should have a little shortcut overlay icon.
  5. Click on the linked BankTellerModule.dll in the BankShell project and press F4 to get right properties Tool Window open for that file. Make sure that **Build Action** is set to **Content** and that **Copy to Output Directory** is set to **Copy If Newer**.
  6. Reopen the BankShell properties page by right-clicking on the BankShell project and choosing Properties. Open the Publish Tab and click on the Application Files button. Make sure that BankTellerModule.dll and ProfileCatalog.xml both have their Publish Status set to Include and are in the Required Download Group. (Note: You may have to select the "Show all files" checkbox to see the files.)&nbsp_place_holder;

Once you have the application running correctly, you should be able to Publish it using the Publish Tab in the BankTeller Properties. Again, please make sure you can publish a regular Windows Forms application before doing this with a CAB application. One thing that I found that helped me was to use a local file path like C:\Inetpub\wwwroot\BankShell for the Publishing Location and the provide an Installation URL like [http://localhost/BankShell](http://localhost/BankShell). 
