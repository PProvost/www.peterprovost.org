---
layout: post
title: "PDC - .NET Framework: Developing Applications using the New Object-Relational Technologies in \"Whidbey\" - ADO.NET ObjectSpaces"
comments: false
date: 2003-10-30 07:50:00
updated: 2004-05-01 16:29:00
categories:
 - Technology
subtext-id: da3b8e31-125d-4653-ae03-a34fd081e516
alias: /blog/PDC---NET-Framework-Developing-Applications-using-the-New-Object-Relational-Technologies-in-Whidbey---ADONET-ObjectSpaces.aspx
---


I just got out of this session and am writing this from the bus on the way back to my hotel. From there we are off to Universal Studios for the attendee party. They've rented out the entire place for just us! Kick ass.

If you've read my blog for long, you've probably heard me rave about code generation tools like CodeSmith and LLBLGen. I've written a number of Object Relational Mapper (ORM) tes in CodeSmith and I've demoed LLBLGenPro. Both techniques work well, but I've always wanted something built into the framework. The ones I wrote were specifically for my needs and didn't support things like relationships, lazy loading of child relationships, etc. LLBLGen supports some of that, maybe all, but it is still essentially a code generator.

I've been hearing about ObjectSpaces for a while now but it has been very hard to get any information about it. And with all the hype about the other Whidbey and Longhorn technologies, it seemed to be ignored by the community. 

ObjectSpaces is three things:

1. System.Data.ObjectSpaces is the namespace containing the core ORM subsystems in Whidbey  
2. Microsoft.Data.ObjectSpaces (or something like that) contains utilites for generating databases from object graphs and vice versa  
3. VS.NET (Whidbey) will have a very cool editor for mapping table and columns to objects and fields. 

This stuff appears to be exactly wat I was hoping for. I tried my best to copy the code from the demos below, and for this kind of this the code is the best way to see what is going on. I cannot guarantee that this code is correct, and it certainly will not compile, as I was typing it in on the fly as the presenter switched between slides and code. But it is close enough to give you an idea of what I was seeing. Unfortunately I didn't catch all of the code for ObjectSpaces -> ADO.NET interop (case 5), but I'm sure that will be pretty straightforward. This is the Good Stuff.

Look in the switch statement to see how database initialization, reading and then updating work. This stuff is VERY cool and is going to save us business app developers TONS of time and code.

Enjoy!
    
    using Microsoft.Data.ObjectSpaces;
      
    using System;
      
    using System.Collections;
      
    using System.Data.ObjectSpaces
      
    
      
    public class Continent
      
    {
      
     public Continent(string name, int area)
      
     {
      
      Name = name;
      
      Area = area;
      
     }
      
     public string Name;
      
     public int Area;
      
     public ArrayList Countries = new ArrayList();
      
     
      
     // Required? for object spaces
      
     private Continent();
      
    }
      
    
      
    public class ContinentDelayLoad
      
    {
      
     public Continent(string name, int area)
      
     {
      
      Name = name;
      
      Area = area;
      
     }
      
     public string Name;
      
     public int Area;
      
     public ObjectList Countries = new ObjectList();
      
     
      
     // Required? for object spaces
      
     private Continent();
      
    }
      
    
      
    
      
    public class Country
      
    {
      
     public Country( string Name, int pop, Continent cont ) { ... }
      
     public string Name;
      
     public int Population;
      
     public ArrayList Cities = new ArrayList()l
      
     public Continent Continent;
      
     private Country() {};
      
    }
      
    
      
    public class City
      
    {
      
     public City() string name, int numberOfCats, Country myCountry )
      
     {
      
      _Name = name;
      
      NumberOfCats = numberOfCats;
      
      Country = myCountr;
      
     }
      
    
      
     private string _Name;
      
     
      
     public string Name
      
     {
      
      get { return _Name; }
      
      set { _name = value; }
      
      
      
     }
      
     
      
     public int NumberOfCats;
      
     public Country Country;
      
     private City() {}
      
    }
      
    
      
    public class WorldDriver
      
    {
      
     static void InitializeDatabase()
      
     {
      
      Continent asia = new Continent("Asia", 17110 );
      
      ...
      
      
      
      Country china = new Country( "usa", 111, asia );  
      
      ...
      
      
      
      City beijing = new City( "Beijing", 1112, china );
      
      ...
      
      
      
      // This is not part of ObjectSpaces per se, it is used to generate a database based on a graph. If we already have a database
      
      // we don't need to do this. This is NOT part of the System.ObjectSpaces namespace.
      
      ObjectPersisitence op = new ObjectPersistence( "Data Source=(local); Integrated Security=true;", "World" );
      
      
      
      Print("Persisting Asia");
      
      op.Persist( asia );
      
      op.Persist( asia.COuntries );
      
      foreach( Country c in asia.Countries )
      
      {
      
       op.Persist( c.Cities );
      
      }
      
     }
      
     
      
     static void Main( int argc, char[] argv )
      
     {
      
      int whichDemo = Int32.Parse( argv[1] );
      
      
      
     
      
      switch( whichDemo )
      
      {
      
       case 1: //Build database
      
        InitializeDatabase();
      
        break;
      
        
      
       case 2: // Load graph of objects
      
        os = new ObjectSpace("World.msd.xml", cn);
      
        ObjectSet oset = os.GetObjectSet( typeof(City), "", "" );
      
        
      
        // Using OPath to filter
      
        // ObjectSet oset = os.GetObjectSet( typeof(City), "NumberOfCats < 1000", "" );
      
        // ObjectSet oset = os.GetObjectSet( typeof(City), "NumberOfCats < 1000 and Country.Population < 10000000", "" );
      
        // ObjectSet oset = os.GetObjectSet( typeof(City), "Name='Albisola'", "" );
      
        
      
        // Using span to get early loading (these load a predefined amount of the object graph)
      
        // ObjectSet oset = os.GetObjectSet( typeof(Continent), "", "Countries" ); // Tells it to load the countries too!
      
        // ObjectSet oset = os.GetObjectSet( typeof(Continent), "", "Countries.Cities" ); // Tells it to load the countries and the cities!
      
        
      
        Print( oset );
      
        break;
      
        
      
       case 3: // Update an object graph (optimistic concurrency -- first save wins)
      
        os = new ObjectSpace("World.msd.xml", cn);
      
        
      
        City gt = (City) os.GetObject( typeof(City), "Name='Absiola');
      
        
      
        Print("Got it");
      
        
      
        // Modify the object
      
        gt.NumberOfCats = new Random().Next();
      
        
      
        // Save it
      
        try
      
        {
      
         os.PersistChanges(gt);
      
        }
      
        catch( Exception e )
      
        {
      
         os.Rollback();
      
        }
      
        
      
        break;
      
        
      
       case 4: // Update an object graph (with transactions second to read will wait for the first to commit or not before saving)
      
        os = new ObjectSpace("World.msd.xml", cn);
      
        
      
        os.BeginTransaction( IsolationLevel.RepeatableRead);
      
        City gt = (City) os.GetObject( typeof(City), "Name='Absiola');
      
        
      
        Print("Got it");
      
        
      
        // Modify the object
      
        gt.NumberOfCats = new Random().Next();
      
        
      
        // Save it
      
        try
      
        {
      
         os.PersistChanges(gt);
      
         os.Commit();
      
        }
      
        catch( Exception e )
      
        {
      
         os.Rollback();
      
        }
      
        
      
        break;
      
    
      
       case 5: // ADO.NET Interop
      
        string cs1 = "DataSource=(local);Integrated security=true;...";
      
        string query = "select top 3 * from coutnry";
      
        
      
        SqlCommand cmd = new SqlCommand( query, new SqlCOnnection(cs1) );
      
        
      
        SqlDataReader r = cmd.ExecuteReader();
      
        
      
        MappingSchema map = new MappingSchema("Woeld.msd.xml");
      
        DbObjectReader reader = new DbObjectReader( r, typeof(  ) );
      
        
      
        // Didn't catch the rest of this but you can imagine what is going on here...
      
        
      
        
      
        break;
      
        
      
      }
      
     }
      
     
      
     static void Print( string s ) ...
      
     static void Print( IList c ) ...
      
     static void PrintContinents( IEnumerable e ) ...
      
     static void PrintCountries( IEnumerable e ) ...
      
     static void PrintCities( IEnumerable e ) ...
      
    }
      
      
      
    
