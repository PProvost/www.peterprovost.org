---
layout: post
title: "Fun With Ruby"
comments: false
date: 2005-07-15 23:17:00
updated: 2005-07-17 18:22:00
subtext-id: bcc5211e-b67a-4268-a54b-97ce8bf69f3b
alias: /blog/post/Fun-With-Ruby.aspx
---


A few weeks ago [Brad Wilson](http://www.agileprogrammer.com/dotnetguy) and I were invited to come down to Portland to speak and hang out at the [Portland Code Camp](http://pacwest.ms/codecamp/pdx/1/)&nbsp_place_holder;(July 23 & 24). We pitched a few ideas to them including EntLib, CAB, Unit Testing/TDD, etc. All the usual suspects.

But Brad and I also thought it would be fun to talk about Ruby and/or Rails. If you've read this blog much, you know I've been in love with Ruby for a long time now (longer than I've been an MS employee), so this shouldn't be a surprise.

Anyway, it turns out I can't go, which is a huge bummer. But Brad is going and he's giving&nbsp_place_holder;one talk introducing Ruby and one on CAB. Should be fun. (BTW, if you live in the Northwest, you should go. I would if I could, but I can't.)

Anyway, today, Brad was asked by the organizers to translate this C# code into Ruby (for the T-Shirts or something like that):
    
    using System;
    
    namespace Community
    {
     class CodeCamp
     {
       private string city;
       private string version;
    
       public CodeCamp ( string city, string version )
       { this.city = city; this.version = version; }
    
       public override string ToString()
       { return string.Format( "{0} Code Camp v{1}",   
         city, version ); }
     }
    
     class ConsoleApp
     {
       [STAThread]
       static void Main(string[] args)
       {
         CodeCamp pdx = new CodeCamp("Portland", "1.0");
         Console.WriteLine( pdx );
       }
     }
    }
    

Brad was nice enough to cc me on his answer, which was this:
    
    module Community
     class CodeCamp
       def initialize(city, version)
         @city = city
         @version = version
       end
    
       def to_s
         "#{@city} Code Camp v#{@version}"
       end
     end
    end
    
    puts Community::CodeCamp.new("Portland", "1.0")
    

Of course, Brad's answer is the obvious direct port of the provided C# code, but I'm not sure it is the "Ruby Way"...

My first answer was this:
    
    puts "Portland Code Camp v1.0"
    

But I decided that probably wasn't what they were looking for. I am reminded of the time I demoed Ruby to Ward Cunningham and he said, "Well I see that _Hello World_ is the right number of lines," but I digress...

Perhaps something that shows off Ruby method redefinition would be better?
    
    class Float
      alias old_to_s to_s
    
      def to_s
        return "Portland Code Camp v#{old_to_s}"
      end
    end
    
    puts 1.0
    

I kinda like that one, but I don't like that the string "Portland" is embedded in my Float class. No. In everyone's Float class. Cool? Yes. The right answer? Probably not.

After playing around with some much nastier ideas, I decided that I wanted my puts line to look something like this instead:
    
    "Portland".codeCamp(1.0)
    "San Francisco".codeCamp(1.5)
    "Boston".codeCamp(2.0)
    

And, of course, writing this in Ruby was really easy:
    
    class String
      def codeCamp(version)
        puts "#{to_s} Code Camp v#{version}"
      end
    end
    
    "Portland".codeCamp(1.0)
    

However, adding a codeCamp method to all Srings in the system is kind of strange--to my eye it is a least as strange as redefining Float#to_s--so I went looking for something else...

And then I remembered that I could just use Ruby's ability to simply implement the [Proxy Pattern](http://www.rubygarden.org/ruby?ProxyPattern). The way you do this is to redefine a method called [method_missing](http://www.rubycentral.com/ref/ref_c_object.html#method_missing). (Ruby will call this method any time there is no definition for a method that is called.) 

I wanted mine to be a class method (static) and not an instance method, so I went ahead and prepended "self" to the method name. Since Ruby strongly adheres to the [Principle of Least Surprise](http://en.wikipedia.org/wiki/Principle_of_least_astonishment), this worked as expected:
    
    class CodeCamp
      def self.method_missing( name, *args )
        puts "#{name.to_s} Code Camp #{args[0]}"
      end
    end
    
    CodeCamp.Portland(1.0)
    

Now, that is getting good. But it also has some problems. It doesn't work well with cities like San Fransisco. You could make the city name PascalCase (SanFrancisco)&nbsp_place_holder;or use an underscore (San_Francisco), and then it doesn't really print right. I decided to use underscores and just replace them with spaces. Simple and effective.

_Note: I really wanted to use&nbsp_place_holder;PascalCase (aka WikiWord formatting) to do it, but the regex got annoying and let's not forget that the underscore is very Ruby-ish, even if us .NET programmers find it annoying._

So I ended up with this, which I think is my final answer:
    
    class CodeCamp
      def self.method_missing( name, *args )
        puts "#{name.to_s.sub("_", " ")} Code Camp #{args[0]}"
      end
    end
    
    CodeCamp.Portland(1.0)
    CodeCamp.San_Francisco(1.5)
    CodeCamp.Boston(2.0)
    

Five lines of code. Not bad.

(Of course you could wrap it up in a Community module (namespace), but I just didn't see the point.)

Enjoy!

Update 2005-07-17: [Craig Andera](http://pluralsight.com/blogs/craig/default.aspx) correctly pointed out that I said CamelCase when I meant PascalCase.&nbsp_place_holder;Oops. Corrected. (See also [WikiPedia - Internal Capitalization](http://en.wikipedia.org/wiki/Internal_capitalization)).
