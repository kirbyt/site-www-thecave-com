---
layout: post
title: 'Migrating from Visual Studio to Borland Developer Studio'
category: programming
tags: [delphi]
---

I spent the day migrating various Visual Studio projects to Borland Developer Studio 2006.  For the most part the projects easily moved over but I did have some problems with one project group.  <br /><br />This project group contains multiple C# library projects and an ASP.NET C# web application.  The BDS converter for the project group did not set the parent reference for some of the .aspx and .ascx files.  However, I was able to quickly fix this using a text editor.<br /><br />One Visual Studio feature I do miss since moving to Borland Developer Studio is Copy Web Project.  I really like this feature to xcopy an ASP.NET web application to a new directory that contains only the files needed for runtime.  The Professional Edition of BDS does not have this feature.  However, I was able to quickly clone this feature using FinalBuilder.<br /><br />Right now I'm very happy with the move to Borland Developer Studio.  Using one IDE for all my development work (Delphi, C# and ASP.NET 1.1) is making me a more productive software developer.
