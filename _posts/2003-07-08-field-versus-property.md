---
layout: post
title: 'Field versus Property'
category: uncategorized
---

.NET class structures defined in the CLR can have public fields and public properties among other things.  On the surface, a public field and a public property appear to be the same.  The .NET Framework Glossary even says a property "is like a public field."  However the two are not same. The most obvious difference is in the declaration of the two. For example, consider the follow class:

    public class Person
    {
        public string Name;

        private string _email;
        public string Email{ get{ return _email; } set{ _email = value; } }
    }

In the code snippet above, Name is a public field while Email is a public property.  However if you were to use an instance of the class Person, you would not be able to tell what is defined as a field versus property. The two appear to be the same.  Example:

    Person p = new Person();
    p.Name = "Kirby";
    p.Email = "kirby@thecave.com";

A property has many advantages over a field and I personally rarely, if ever, use public fields.  And today I learned yet another reason for using a public property over a public field.

Some functionality built into the .NET Framework relies on reflection to perform specific tasks.  For example, within ASP.NET you can use DataBinder.Eval() to reference properties of a class instance stored in the Container.DataItem.  Example:

    <%# DataBinder.Eval( Container.DataItem, "Name" ) %>

Using the Person class defined above, the DataBinder.Eval() call to retrieve the value of Name will fail.  The exception message will state that the property Name is not defined in the class Person, which is true.  Name is defined as a field not a property. Another area where the difference between a property and a field is realized is within custom components that have design time properties.  Visual Studio.NET's Designer expects properties to be defined as properties and not fields.

So as you can see a field is in fact different from a property.  My preference is to always use property declarations, but if you need to use a field declaration, beware of the possible limitation.
