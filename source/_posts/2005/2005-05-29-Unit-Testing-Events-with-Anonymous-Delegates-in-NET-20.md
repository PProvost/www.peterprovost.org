---
layout: post
title: "Unit Testing Events with Anonymous Delegates in .NET 2.0"
comments: false
date: 2005-05-29 23:52:00
updated: 2008-07-06 14:23:15
categories:
 - Code
tags:
 - tdd
 - agile development
subtext-id: 15956d88-19f6-40fc-b30f-5f631a2fe91a
alias: /blog/post/Unit-Testing-Events-with-Anonymous-Delegates-in-NET-20.aspx
---


There has been a lot of discussion [comparing anonymous delegates to closures and blocks in Ruby](http://pluralsight.com/blogs/dbox/archive/2005/04/27/7780.aspx), 
so I'm not going to get into that whole thing...

What I want to talk about for a minute is how cool it is to use anonymous delegates to 
test that events on your classes fire as expected. 

Suppose, for example, that you have a class like this: 
    
``` csharp    
public class MyContainerContainer
{
	public event EventHandler<ItemAddedEventArgs> ItemAdded;
	public void Add( object item )
	{
		// Store it in an internal list or something, then
		// fire the event
		if( ItemAdded != null )
			ItemAdded( this, new ItemAddedEventArgs(item) );
	}
}
```

Now before anonymous delegates, you would have had to introduce a private method in your test fixture to attach to 
the ItemAdded event. And as shown here, you probably would have had to introduce a private field to pass data 
between the event handler method and the test method. (Sure, you could have created a mock class to hold the state 
and the event handler, but that would have been even more code to read/parse/grok.)

``` csharp
[TestFixture]
public class ContainerMonitorFixture
{
	private object addedItem = null;
	[Test]
	public void AddFiresAddedEventWithCorrectArgs()
	{
		MyContainer container = new MyContainer();
		container.ItemAdded +=
			new EventHandler<ItemAddedEventArgs>(this.ItemAdded);
		object item = new object();
		container.Add( item );
		Assert.AreSame( item, this.addedItem );
	}
	private void ItemAdded( object sender, ItemAddedEventArgs e )
	{
		addedItem = e.AddedItem;
	}
}
```
    
With anonymous delegates, you can now write very clear, very clean tests like this: 

``` csharp
[TestFixture]
public class ContainerMonitorFixture
{
	[Test]
	public void AddFiresAddedEventWithCorrectArgs()
	{
		object expected = new object();
		object actual = null;
		MyContainer container = new MyContainer();
		container.ItemAdded += delegate( object sender, ItemAddedEvent args e )
		{
			actual = e.AddedItem;
		}
		container.Add( expected );
		Assert.AreSame( expected, actual );
	}
}
```

There are a couple of cool things in this code: 

* The delegate can modify variables in the test method, outside the event handler itself
* The entire test's **_meaning_** is clearly stated within the test--you don't have to 
  look in some other method or class to see what's happening
* Because the entire test is self encapsulated, it is easier to move/copy/change should 
  you need to do any refactoring to either the class under test or the test fixture itself.

Enjoy! 
