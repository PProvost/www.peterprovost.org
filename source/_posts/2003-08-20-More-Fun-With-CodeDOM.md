---
layout: post
title: "More Fun With CodeDOM"
comments: false
date: 2003-08-20 15:02:00
categories:
 - Technology
subtext-id: ea91605e-0762-4c5e-a012-48acea0d0677
alias: /blog/More-Fun-With-CodeDOM.aspx
---


In [WinTechOffTopic](http://groups.yahoo.com/group/win_tech_off_topic/), Chris Sells asked for generalized permutation engine. A number of poeople posted a bunch of different solutions, one of which was the naive nested for-loop approach. Works well, but required you to add new for-loops every time you want to add a new element to the search.

That's when I thought, "You could always use a little dynamic code generation to do the simple algorithm for the general case."

The performance isn't as good as what Chris actually found, but it is an interesting way to play with CodeDOM.

Here's the code. Note you'll need Shawn&nbsp_place_holder;A. Van Ness' HiResTimerClass from [http://www.arithex.com/hirestimer.cs.html](http://www.arithex.com/hirestimer.cs.html). Enjoy!
    
    using Microsoft.CSharp;
      
    using System;
      
    using System.CodeDom.Compiler;
      
    using System.IO;
      
    using System.Reflection;
      
    using System.Text;
      
    
      
    namespace SellsPermutationSpike
      
    {
      
      /// <summary>
      
      /// Summary description for Class1.
      
      /// </summary>
      
      class Class1
      
      {
      
        /// <summary>
      
        /// The main entry point for the application.
      
        /// </summary>
      
        [STAThread]
      
        static void Main(string[] args)
      
        {
      
          Util.HiResTimer hrt = new Util.HiResTimer();
      
    
      
          hrt.Start();
      
          string code = GetPermutationCode( 0, 100, 7, 5, false );
      
          hrt.Stop();
      
          Console.WriteLine( "GetPermutationCode() method took {0} microseconds.",  
            hrt.ElapsedMicroseconds );
      
    
      
          hrt.Start();
      
          Assembly assembly = CompileCode( code );
      
          hrt.Stop();
      
          Console.WriteLine( "CompileCode() method took {0} microseconds.",  
            hrt.ElapsedMicroseconds );
      
    
      
          hrt.Start();
      
          Go( assembly );
      
          hrt.Stop();
      
          Console.WriteLine( "PermuteBySum() method pass 1 tool {0} microseconds.",  
            hrt.ElapsedMicroseconds );
      
    
      
          hrt.Start();
      
          Go( assembly );
      
          hrt.Stop();
      
          Console.WriteLine( "PermuteBySum() method pass 1 took {0} microseconds.",  
            hrt.ElapsedMicroseconds );
      
        }
      
    
      
        static void Go( Assembly assembly )
      
        {
      
          object o = assembly.CreateInstance( "DynamicPermutation" );
      
          Type t = o.GetType();
      
          t.InvokeMember( "Go", BindingFlags.InvokeMethod, null, o, null );
      
        }
      
    
      
    
      
        static Assembly CompileCode( string source )
      
        {
      
          CSharpCodeProvider cSharpProvider = new CSharpCodeProvider();
      
          ICodeCompiler compiler = cSharpProvider.CreateCompiler();
      
    
      
          CompilerParameters options = new CompilerParameters();
      
          options.GenerateInMemory = true;
      
    
      
          CompilerResults results = compiler.CompileAssemblyFromSource( options,  
            source );
      
    
      
          if( results.Errors.HasErrors )
      
          {
      
            StringBuilder sb = new StringBuilder();
      
            foreach( CompilerError error in results.Errors )
      
            {
      
              sb.Append( String.Format("{0} - {1}\n", error.Line,  
                error.ErrorText ) );
      
            }
      
    
      
            Console.WriteLine( sb.ToString(), "ERROR" );
      
            return null;
      
          }
      
    
      
          return results.CompiledAssembly;
      
        }
      
    
      
        static string GetPermutationCode( int start, int end, int count,  
          int skip, bool writeLine )
      
        {
      
          StringBuilder sb = new StringBuilder();
      
          
      
          sb.Append( @"
      
            using System;
      
            class DynamicPermutation
      
            {
      
              public static void Go()
      
              {
      
          " );
      
    
      
          for( int i=0; i<count; ++i )
      
            sb.AppendFormat( "for( int c_{0} = {1}; c_{0} < {2}; c_{0} += {3} )",  
              i, start, end, skip );
      
    
      
          if( writeLine )
      
          {
      
            sb.Append( "Console.WriteLine(\"" );
      
    
      
            for( int i=0; i<count; ++i )
      
            {
      
              sb.AppendFormat("{{{0}}}", i );
      
              if( i+1 < count )
      
                sb.Append( "," );
      
            }
      
    
      
            sb.Append( "\"," );
      
    
      
            for( int i=0; i<count; ++i )
      
            {
      
              sb.AppendFormat( "c_{0}", i );
      
              if( i+1 < count )
      
                sb.Append( "," );
      
            }
      
    
      
            sb.Append( ");" );
      
          }
      
          else
      
          {
      
            sb.Append(" { int temp = 0; } ");
      
          }
      
    
      
          sb.Append( @"
      
              }
      
            }
      
          " );  
      
    
      
          return sb.ToString();
      
        }
      
      }
      
    }
    
