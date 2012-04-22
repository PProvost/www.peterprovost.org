---
layout: post
title: "CodeSmith + CodeDom"
comments: false
date: 2003-08-11 20:09:00
categories:
 - Technology
subtext-id: 8b17f88e-bf8d-4463-b387-495a44c68910
alias: /blog/post/CodeSmith-2b-CodeDom.aspx
---


Yesterday [Steve Eichert wrote](http://dotnetjunkies.com/WebLog/seichert/posts/1003.aspx):

> This past week while working on a re-write of the framework that prompted the initial evaluation of Emit vs. CodeDOM I decided to revisit the debate.&nbsp_place_holder; After "thumbing" my way through the documentation of the CodeDOM classes I came across the ICodeCompiler.CompileAssemblyFromSource() method.&nbsp_place_holder; Rather then emitting OpCodes I decided to create a couple of templates for my code and use the ICodeCompiler to genearte an in memory assembly.&nbsp_place_holder; While I did miss the process of pushing things onto the call stack using OpCodes, I realized how much more productive I was creating "C# templates" for my code and compiling them with the CodeDOM classes.

As I started to think about this, I decided to try this out. Since [CodeSmith](http://www.ericjsmith.net/codesmith/) will produce a template assembly that I can call from code, this should be easy as pie!

I started by creating this simple [CodeSmith](http://www.ericjsmith.net/codesmith/) template:
    
    **<%@ CodeTemplate Language="C#" TargetLanguage="C#" Description="" %>**
      
    **<%@ Property Name="ClassName" Type="System.String" Default="MyClass"  
        Category="Options" Description="" %>**
      
    **<%@ Property Name="SampleStringProperty" Type="System.String"  
        Default="SampleString" Category="Options" Description="" %>**
      
    public class <%=ClassName%>
      
    {
      
       public string <%= SampleStringProperty %>   
      
       {
      
          get { return _<%=SampleStringProperty%>; }
      
          set { _<%=SampleStringProperty%> = value; }
      
       }
      
    
      
       private string _<%=SampleStringProperty%>;
      
    }  
    

Then using [CodeSmith](http://www.ericjsmith.net/codesmith/), I created an assembly from my template. Basically this creates a DLL that you can reference from your code that contains the code generation class defined by the CST file.

Once that was done, I created a simple forms app, added a button, and put the following code in the click handler: 
    
    private void button1_Click(object sender, System.EventArgs e)
      
    {
      
       CodeSmithTemplates.SimpleTemplate template = 
      
          new CodeSmithTemplates.SimpleTemplate();
      
       template.ClassName = "MyClass";
      
       template.SampleStringProperty = "MyProperty";
      
       string source = template.RenderToString();
      
    
      
       CSharpCodeProvider cSharpProvider = new CSharpCodeProvider();
      
       ICodeCompiler compiler = cSharpProvider.CreateCompiler();
      
    
      
       CompilerParameters options = new CompilerParameters();
      
       options.GenerateInMemory = true;
      
    
      
       CompilerResults results = 
      
          compiler.CompileAssemblyFromSource( options, source );
      
    
      
       if( results.Errors.HasErrors )
      
       {
      
          StringBuilder sb = new StringBuilder();
      
          foreach( CompilerError error in results.Errors )
      
          {
      
             sb.Append( String.Format("{0} - {1}\n", error.Line, 
      
                error.ErrorText ) );
      
          }
      
    
      
          MessageBox.Show( sb.ToString(), "ERROR" );
      
          return;
      
       }
      
    
      
       Assembly assembly = results.CompiledAssembly;
      
       object o = assembly.CreateInstance( "MyClass" );
      
    
      
       Type t = o.GetType();
      
       t.InvokeMember( "MyProperty", BindingFlags.SetProperty, null,
      
          o, new object[] { "Test!" } );
      
       object result = t.InvokeMember( "MyProperty", 
      
          BindingFlags.GetProperty, null, o, null );
      
    
      
       MessageBox.Show( result.ToString() );
      
    
      
    }  
    

That's it! Granted I didn't do anything particularly complex with it, but it is a very effective way to combine template generated code (a la [CodeSmith](http://www.ericjsmith.net/codesmith/)) with CodeDom. Enjoy!
