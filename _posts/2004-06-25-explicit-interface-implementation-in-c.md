---
layout: post
title: 'Explicit Interface Implementation in C#'
category: uncategorized
---

I was a grumbling VB developer for a number of years.  At the time Delphi was my language of choice but in the part of the country I lived customer work using it was almost non-existent.  In the summer of 2000 at PDC, a friend of mine from Microsoft showed me the .NET Framework and C#.  I was instantly drawn to C# because it reminded me of Delphi, which is no surprise for those who know their [C#/Delphi history](http://c2.com/cgi/wiki?HistoryOfCsharp).

At last there was (is) a language and framework from Microsoft that generated the same level of excitement in me that Borland's Delphi had done a few years prior.  Best of all it was from Microsoft which would mean customer work in the future.  And as luck would have it, I started working exclusively with the .NET Framework and C# in the fall of 2001.

For better or worse I have not spent much time with VB.NET, or Visual Basic 6.0 for that manner, since the fall of 2001.  I have done a few small project using VB.NET but nothing to brag about.  For the most part, both .NET languages are very similar with regard to features but there are some differences.  For example, you can write unsafe code in C# but you can't do the same in VB.NET.  Depending on your point of view this is an advantage or a disadvantage.

Another difference is that in VB.NET you can specify the scope of a member that implements a particular interface as something other than public.  I needed to do this in more than one occasion in C# but was resolved to the fact that a member implementation of interface in C# had to be scoped as public.


    Public Interface IMyInterface
        Sub Foo()
    End Interface

    Public Class Class1
    Implements IMyInterface
        Private Sub Foo() Implements IMyInterface.Foo
        End Sub
    End Class

So if you can do this in VB.NET why can't you do the same, or something similar in C#?  This question lead me to the discovery \(thank you [google](http://www.google.com/search?q=explicit+interface+implement&amp;sourceid=firefox&amp;start=0&amp;start=0&amp;ie=utf-8&amp;oe=utf-8)\) of explicit interface implementation in C#.  By using an explicit interface implementation you can scope the member implementation as private.  It's a little messy because a member explicitly implemented cannot be access through the class instance.  Instead it must be accessed through an instance of the interface.

    interface IMyInterface
    {
        void Foo();
    }

    abstract class MyAbstractClass : IMyInterface
    {
        // Explicit interface implementation
        void IMyInterface.Foo()
        {
            Console.WriteLine( "bar" );
        }
    }

    class MyConcreteClass : MyAbstractClass
    {
        public void FooBar()
        {
            // Must use an instance of the interface to access
            // the explicit implementation.
            ((IMyInterface)this).Foo();
        }
    }

    public class MyApp
    {
        public static void Main( string[] args )
        {
            MyConcreteClass c = new MyConcreteClass();
            // Will not compile because Foo() is private.
            // c.Foo();

            c.FooBar();

            // This works because we are all in the same module.
            ((IMyInterface)c).Foo();
        }
    }

While an explicit interface implementation does give the C# developer the ability to scope a member implementation as private, it is still not as powerful as VB.NET's ability to scope a member implementation as anything other than public.  Score 1 point for VB.NET.
