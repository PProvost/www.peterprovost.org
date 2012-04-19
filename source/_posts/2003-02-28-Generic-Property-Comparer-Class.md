---
layout: post
title: "Generic Property Comparer Class"
comments: false
date: 2003-02-28 10:53:00
updated: 2004-05-05 14:17:00
categories:
 - Technology
subtext-id: a9e5db93-fda4-4915-aa93-c02baa8f902b
alias: /blog/post/Generic-Property-Comparer-Class.aspx
---


In a [previous post](http://www.peterprovost.org/2003/02/27.html#a62), [Justin](http://pinetree-tech.com/weblog/) and I were discussing the idea of having a generic object comparer. Well this morning I busted one out. Here it is. Enjoy!
    
    public class GenericClassComparer : IComparer
    
    {
    
      public GenericClassComparer( System.Type objectType, string propertyName )
    
      {
    
        LoadPropertyInfo( objectType, propertyName );
    
      }
    
      
      private void LoadPropertyInfo( System.Type objectType, string propertyName )
    
      {
    
        MemberInfo[] members = objectType.GetMember( propertyName, 
    
          MemberTypes.Property, BindingFlags.Public | BindingFlags.Instance );
    
      
        if( members.Length > 0 )
    
        {
    
          MemberInfo member = members[0];
    
          if( member is PropertyInfo )
    
            _pi = (PropertyInfo) member;
    
        }
    
      }
    
      
      public int Compare( object o1, object o2 )
    
      {
    
        if( _pi == null )
    
          throw new ArgumentException("Invalid property name specified.");
    
      
        object val1 = _pi.GetValue( o1, null );
    
        object val2 = _pi.GetValue( o2, null );
    
      
        if( val1 is IComparable )
    
        {
    
          IComparable c1 = (IComparable) val1;
    
          IComparable c2 = (IComparable) val2;
    
          return c1.CompareTo(c2);
    
        }
    
      
        return 0;
    
      }
    
      
      private PropertyInfo _pi = null;
    
    }
