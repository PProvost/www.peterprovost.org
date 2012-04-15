---
layout: post
title: "Fun with Reflection"
comments: false
date: 2004-05-09 23:42:00
updated: 2004-05-13 09:08:00
categories:
 - Code
subtext-id: 46e65eb0-f595-479d-b18e-d0c0d9b8fc56
alias: /blog/Fun-with-Reflection.aspx
---


I was just on IM helping [Kris Syverstad](http://weblogs.ilg.com/ksyverstad/archive/2004/05/09/340.aspx) 
and [Bob Brumfield](http://weblogs.ilg.com/brumfieldb/archive/2004/05/09/338.aspx) with a little reflection 
problem. Along the way I asked him why he hadn't prototyped his problem in NUnit... I guess they didn'
t think of it.

Anyway, here is an NUnit test that demonstrates a couple of points that they were fighting:

1. When referencing a nested type, you have to use the plus sign between the parent class and the nested type 
2. The Invoke code that Bob posted wasn't related to the problem. 
3. The Enum.Parse code that Bob posted wasn't related to the problem

Here's the code:
    
``` csharp    
using System;
using System.Reflection;
using NUnit.Framework;

namespace NestedTypeReflectionTest
{
	public class Foo
	{
		public enum Bar
		{
			Zero, One, Two, Three
		}

		public Bar TheBar
		{
			get { return _theBar; }
			set { _theBar = value; }
		}

		private Bar _theBar = Bar.Zero;
	}


	[TestFixture]
	public class TheTest
	{
		private Assembly _assembly;

		[SetUp]
		public void Setup()
		{
			// For this example we will use GetExecutingAssembly() but you
			// could also use Assembly.LoadFrom().
			_assembly = Assembly.GetExecutingAssembly();
		}

		[Test(Description="This test shows that a period doesn't work for nested types.")]
		[ExpectedException( typeof(TypeLoadException) )]
		public void PeriodThrows()
		{
			System.Type t = _assembly.GetType( "NestedTypeReflectionTest.Foo.Bar",  true, false );
		}

		[Test(Description="This test shows that a plus-sign does work for nested types.")]
		public void PlusDoesnt()
		{
			System.Type t = _assembly.GetType( "NestedTypeReflectionTest.Foo+Bar",  true, false );
			Assert.IsTrue( t.IsEnum );
		}

		[Test(Description="This test shows using the type with Invoke.")]
		public void Invoke()
		{
			System.Type t = _assembly.GetType( "NestedTypeReflectionTest.Foo+Bar",  true, false );
			object aValue = Enum.Parse( t, "One" );

			Foo foo = new Foo();
			BindingFlags flags = BindingFlags.Public | BindingFlags.Instance |  BindingFlags.SetProperty;
			foo.GetType().InvokeMember( "TheBar", flags, null, foo, new object[] { aValue });

			Assert.AreEqual( Foo.Bar.One, foo.TheBar );
		}
	}
}
```
