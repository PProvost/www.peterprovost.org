---
layout: post
title: "Remove Unused Printer Ports"
comments: false
date: 2004-05-21 09:44:00
updated: 2004-05-21 10:18:00
categories:
 - Technology
subtext-id: ba13c10e-cb08-4edc-b7dc-400039a3e3ec
alias: /blog/Remove-Unused-Printer-Ports.aspx
---


When I'm travelling around visiting clients, I often end up connecting to one of their local printers by creating my own TCP/IP printer port. But after a while, you end up with all of these damn ports and no way to get rid of them (that I could find).

Google to the rescue! I found [this page on TechNet](http://www.microsoft.com/technet/community/scriptcenter/printing/scrprn12.mspx) that had the following script on it. Works like a charm!
    
    
    Set objDictionary = CreateObject("Scripting.Dictionary")
    strComputer = "."
    Set objWMIService = GetObject("winmgmts:" _
        & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
    Set colPrinters =  objWMIService.ExecQuery _
        ("Select * from Win32_Printer")
    For Each objPrinter in colPrinters 
        objDictionary.Add objPrinter.PortName, objPrinter.PortName
    Next
    Set colPorts = objWMIService.ExecQuery _
        ("Select * from Win32_TCPIPPrinterPort")
    For Each objPort in colPorts
        If objDictionary.Exists(objPort.Name) Then
        Else
            ObjPort.Delete_    'Yes that underscore matters!
        End If
    Next
    
