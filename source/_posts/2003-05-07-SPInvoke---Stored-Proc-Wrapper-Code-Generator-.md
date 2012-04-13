---
layout: post
title: "SP/Invoke - Stored Proc Wrapper Code Generator "
comments: false
date: 2003-05-07 14:42:00
categories:
 - Technology
subtext-id: ded380ac-9def-49fa-8bf2-8a1bb689d97d
alias: /blog/SPInvoke---Stored-Proc-Wrapper-Code-Generator-.aspx
---


This looks very cool. It generates nice little OO classes for your Stored Procedures. Here are some comments from their website:

> _**SP/Invoke** was our submission to the **'Spend a Day With .NET'** contest. It is a small tool which generates code to simplify the invocation of SQL Server T-SQL Stored Procedures.  
  
For example, for the following stored procedure (taken from the Northwind SQL Server example database) ..._
> 
> create procedure CustOrderHist @CustomerID nchar(5)  
as  
&nbsp_place_holder;&nbsp_place_holder;select ProductName, Total=sum(Quantity)  
&nbsp_place_holder;&nbsp_place_holder;from Products P, [Order Details] OD, Orders O, Customers C  
&nbsp_place_holder;&nbsp_place_holder;where C.CustomerID = @CustomerID  
&nbsp_place_holder;&nbsp_place_holder;and C.CustomerID = O.CustomerID and O.OrderID = OD.OrderID and OD.ProductID = P.ProductID  
&nbsp_place_holder;&nbsp_place_holder;group by ProductName  
  
_... SP/Invoke generates code allowing you to invoke the stored procedure using ...  


> _
> 
> SqlConnection conn = new SqlConnection("...");  
conn.Open();  
  
CustOrderHist.Result r = CustOrderHist.Invoke(conn, "OTTIK");  
  
if (r.ReturnValue != 0)  
&nbsp_place_holder;&nbsp_place_holder;return;  
  
foreach (CustOrderHist.Row order in r)  
{  
&nbsp_place_holder;&nbsp_place_holder;Console.WriteLine(order.ProductName);  
&nbsp_place_holder;&nbsp_place_holder;Console.WriteLine(order.Total);  
}  

> 
> _SP/Invoke generates code using the CodeDOM and then compiles it to an assembly which can be used from any VS.NET project. C# code can optionally be generated for direct inclusion into a C# project.  
  
The UI functions as a VS.NET Add-In and can be accessed from the IDE's 'Tools' menu._

More thanks to Mike from [Larkware News ](http://www.larkware.com/index.html)for this link.
