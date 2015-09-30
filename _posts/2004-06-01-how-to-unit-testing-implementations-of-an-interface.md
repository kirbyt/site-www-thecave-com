---
layout: post
title: 'How to Unit Testing Implementations of an Interface'
category: uncategorized
---

I have become a firm supporter of writing unit tests for most if not all code I write, and [NUnit](http://www.nunit.org) is an ideal framework for implementing unit tests.  But one problem I have had repeatedly is finding a good way to test specific implementations of an interface.  My approach has always been to write a new test fixture for each implementor of an interface.  But the problem with this approach is that I end up duplicating unit tests for each implementor, and if I need to write a new test I have to copy it to multiple fixtures.

As a programmer I consider myself lazy.  I don't like having to write the same code over and over.  Instead I would rather write it once and forget about it.  Having to write multiple test fixtures for each implementor of an interface doesn't suit my lazy style.  I need a better approach and a quick google.com search pointed me in the right direction.

I came across a blog from [Jonathan de Halleux](http://blog.dotnetwiki.org/) that talks about [composite unit testing using MbUnit](http://blog.dotnetwiki.org/archive/2004/05/13/206.aspx).  Jonathan presents an approach that splits the testing effort by class functionality rather than writing a test fixture for each class.  This is exactly what I am looking for but as much as I like this approach and MbUnit I still have one issue.  I want an approach that works with NUnit and does not require another framework such as MbUnit.

The development environment I have created for my customer is solid and I do not want to introduce new problems by introducing a new framework, in the case MbUnit.  In other words, I do not want to change what has been currently written including the NAnt build scripts.  So I did the next best thing.  I took Jonathan's design and wrote a helper class to provide composite unit testing and include this class in my unit test projects.

Introducing CompositeTestFixture, a class that enables composite unit testing within NUnit test fixtures.  Because this is a class and not a new framework there are limitations but the limitations do not affect the unit tests I am writing today.  I will discuss the limitation later in this article.

To use CompositeTestFixture, begin by writing your test fixtures as you normally would.  In the spirit of Jonathan's blog I will show an example that provides a test for implementors of the IEnumerable interface.  In this example I will show how to test the ArrayList and Hashtable classes which both implement this interface.  The only requirement in this test is that the IEnumerable instance is not null.

    using System;
    using System.Collections;
    using System.Diagnostics;

    using NUnit.Framework;

    namespace Samples.FunWithNUnit.MyClassLibrary.UnitTests
    {
        [TestFixture]
        public class EnumerableTest
        {
            [Test]
            public void GetEnumeratorNotNull()
            {
                // Write unit test here.
            }
        }
    }

Now we need to write the unit test for the GetEnumeratorNotNull test.  However we must first tell CompositeTestFixture about the factories needed to create an instance of class that implements the interface to test.  I call the instance of the class the implementor.

    [TestFixture]
    [ProviderFactory(FactoryType=typeof(ArrayListFactory),
    ReturnType=typeof(IEnumerable))]
    [ProviderFactory(FactoryType=typeof(HashtableFactory),
    ReturnType=typeof(IEnumerable))]
    public class EnumerableTest
    {
        ...
    }

Next we need to write the code that will test the implementor.  The NUnit framework is going to call the GetEnumeratorNotNull method that is decorated with the \[Test\] attribute.  This is where we call into the CompositeTestFixture helper class.  A static method RunTest is provided for those who do not want to create an instance of the CompositeTestFixture class.

    [Test]
    public void GetEnumeratorNotNull()
    {
        CompositeTestFixture.RunTest( this );
    }

Now we write the method that will perform the actual test.  This method will have the same name as the test method.  The only difference is that the method signature takes a single parameter of the interface type we are testing.  Note that this method is not decorated with the \[Test\] attribute since we do not want NUnit calling this method.

    public void GetEnumeratorNotNull( IEnumerable en )
    {
        Debug.WriteLine( "Testing " + en.GetType().ToString() );
        Assert.IsNotNull( en.GetEnumerator(), "Must not be null." );
    }

That's it.  CompositeTestFixture will do all the heavy work of calling the appropriate unit test method to test a specific implementor.

## How Does This Work

CompositeTestFixture will reflect on the class instances provided in the RunTest method call and retrieve the collection of ProviderFactory attributes decorating the test fixture.  Each factory declared by the FactoryType property will be called to create an instance of a class that implements the type defined in the ReturnType property.  In other words the factory will be used to create an instance of an implementor.

A factory can declare one or more methods that return an instance object.  I call these methods creators since each is responsible for creating a instance of a class.  Having multiple creators gives the unit test writer the option to provide implementors that are initialized differently.  For example one creator might return an empty ArrayList while a second creator might return an ArrayList filled with random numbers.

CompositeTestFixture determines creators by inspecting the factory class type and discovering each method with a return type that implements the type defined in the ProviderFactory.ReturnType property that decorates the test fixture.  Creators must be defined with a public scope and no parameters on the method signature.

    using System;
    using System.Collections;

    namespace Samples.FunWithNUnit.MyClassLibrary.UnitTests
    {
        public class ArrayListFactory
        {
            public ArrayList CreateEmpty()
            {
                return new ArrayList();
            }

            public ArrayList RandomFilled()
            {
                ArrayList list = new ArrayList();
                Random rnd = new Random();
                for(int i=0;i&lt;15;++i)
                {
                    list.Add(rnd.Next());
                }
                return list;
            }
        }
    }

After CompositeTestFixture calls a factory creator it calls the unit test method matching the name of the \[Test\] method that invoked CompositeTestFixture.RunTest( this ).  In our example this is the GetEnumeratorNotNull( IEnumerable en ) method.  This is repeated for each creator declared on a factory and for each factory declared on the fixture.

## Limitations

Although this approach works for many cases it is not perfect.  The SetUp and TearDown methods of the fixture will only be called when NUnit calls the wrapper test method.  CompositeTestFixture does not call the SetUp and TearDown methods before and after calling the internal test method, although it would not be hard to add that feature.

## Conclusion

With the CompositeTestFixture helper class, I now have an easy way to provide composite unit testing within introducing a new framework into my development environment.  Hopefully you will find this code as useful as I have.  Click [here](/downloads/CompositeTestFixture.zip) to download the complete source code.
