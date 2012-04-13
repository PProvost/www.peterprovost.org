---
layout: post
title: "Fun with Reflection"
comments: false
date: 2004-05-09 23:42:00
updated: 2004-05-13 09:08:00
categories:
 - Technology
subtext-id: 46e65eb0-f595-479d-b18e-d0c0d9b8fc56
alias: /blog/Fun-with-Reflection.aspx
---


I was just on IM helping [Kris Syverstad](http://weblogs.ilg.com/ksyverstad/archive/2004/05/09/340.aspx) and [Bob Brumfield](http://weblogs.ilg.com/brumfieldb/archive/2004/05/09/338.aspx)&nbsp_place_holder;with a little reflection problem. Along the way I asked him why he hadn't prototyped his problem in NUnit... I guess they didn't think of it.

Anyway, here is an NUnit test that demonstrates a couple of points that they were fighting:

  1. When referencing a nested type, you have to use the plus sign between the parent class and the nested type 
  2. The Invoke code that Bob posted wasn't related to the problem. 
  3. The Enum.Parse code that Bob posted wasn't related to the problem

Here's the code:
    
    
    using System;
    using System.Reflection;
    using NUnit.Framework;
    
    namespace NestedTypeReflectionTest
    {
    &nbsp_place_holder;public class Foo
    &nbsp_place_holder;{
    &nbsp_place_holder;&nbsp_place_holder;public enum Bar
    &nbsp_place_holder;&nbsp_place_holder;{
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;Zero,
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;One,
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;Two,
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;Three
    &nbsp_place_holder;&nbsp_place_holder;}
    
    &nbsp_place_holder;&nbsp_place_holder;public Bar TheBar
    &nbsp_place_holder;&nbsp_place_holder;{
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;get { return _theBar; }
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;set { _theBar = value; }
    &nbsp_place_holder;&nbsp_place_holder;}
    
    &nbsp_place_holder;&nbsp_place_holder;private Bar _theBar = Bar.Zero;
    &nbsp_place_holder;}
    
    
    &nbsp_place_holder;[TestFixture]
    &nbsp_place_holder;public class TheTest
    &nbsp_place_holder;{
    &nbsp_place_holder;&nbsp_place_holder;private Assembly _assembly;
    
    &nbsp_place_holder;&nbsp_place_holder;[SetUp]
    &nbsp_place_holder;&nbsp_place_holder;public void Setup()
    &nbsp_place_holder;&nbsp_place_holder;{
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;// For this example we will use GetExecutingAssembly() but you
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;// could also use Assembly.LoadFrom().
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;_assembly = Assembly.GetExecutingAssembly();
    &nbsp_place_holder;&nbsp_place_holder;}
    
    &nbsp_place_holder;&nbsp_place_holder;[Test(Description="This test shows that a period doesn't work " +  
        "for nested types.")]
    &nbsp_place_holder;&nbsp_place_holder;[ExpectedException( typeof(TypeLoadException) )]
    &nbsp_place_holder;&nbsp_place_holder;public void PeriodThrows()
    &nbsp_place_holder;&nbsp_place_holder;{
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;System.Type t = _assembly.GetType( "NestedTypeReflectionTest.Foo.Bar",  
        true, false );
    &nbsp_place_holder;&nbsp_place_holder;}
    
    &nbsp_place_holder;&nbsp_place_holder;[Test(Description="This test shows that a plus-sign does work for " +  
        "nested types.")]
    &nbsp_place_holder;&nbsp_place_holder;public void PlusDoesnt()
    &nbsp_place_holder;&nbsp_place_holder;{
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;System.Type t = _assembly.GetType( "NestedTypeReflectionTest.Foo+Bar",  
        true, false );
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;Assert.IsTrue( t.IsEnum );
    &nbsp_place_holder;&nbsp_place_holder;}
    
    &nbsp_place_holder;&nbsp_place_holder;[Test(Description="This test shows using the type with Invoke.")]
    &nbsp_place_holder;&nbsp_place_holder;public void Invoke()
    &nbsp_place_holder;&nbsp_place_holder;{
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;System.Type t = _assembly.GetType( "NestedTypeReflectionTest.Foo+Bar",  
        true, false );
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;object aValue = Enum.Parse( t, "One" );
    
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;Foo foo = new Foo();
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;BindingFlags flags = BindingFlags.Public | BindingFlags.Instance |  
        BindingFlags.SetProperty;
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;foo.GetType().InvokeMember( "TheBar", flags, 
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;null, foo, new object[] { aValue });
    
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder;Assert.AreEqual( Foo.Bar.One, foo.TheBar );
    &nbsp_place_holder;&nbsp_place_holder;}
    &nbsp_place_holder;}
    }
