---
layout: post
title: 'One More Rant about SQL Server 2005'
category: programming
tags: [sql server]
---

Here's another rant I have about SQL Server 2005.

Visual Studio supports a database project type.  I have used this project type for numerous projects.  It's a great way to manage the script code for tables, stored procedures, views, and so on.

I first discovered the limited scripting abilities of SQL Server 2005 earlier today but I noticed the SQL Server 2005 installation process installed a copy of Visual Studio 2005 on my machine.  "Nice," I thought.  "I'll use it to open my database project and update my scripts from Visual Studio."  But luck was not on my side today.

Even though the installation process for SQL Server 2005 installs Visual Studio, it does not install support for the database project type.  Guess I need to run the full Visual Studio installer, which seems silly to me.  After all Visual Studio supports a database project type AND a copy of Visual Studio was installed by SQL Server 2005, which is after all a database.  Seems to me it would be appropriate for the SQL Server 2005 installation to install the database project type if it is going to also install Visual Studio.  It's definitely more appropriate than some of the things past versions of IE would install.  \[Ever wonder why a web browser needs to install MDAC \(Microsoft Data Access Components\)?\] 
