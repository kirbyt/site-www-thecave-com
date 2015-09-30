---
layout: post
title: 'Oracle Developer Day in NYC'
category: uncategorized
---

Yesterday I attended the Oracle Developer Day.  This hands on workshop covered Service Oriented Architecture (SOA) and how you would implement SOA solutions using Oracle tools.  The morning sessions talked about SOA and how it fits into the application architecture.  The architectural concepts presented here also apply to .NET solutions.  It was refreshing to see that whether you use .NET or Java the same good architecture can be applied to either platform.
<br />
<br />We spend the rest of the day hands on implementing a multi-tier application using JDeveloper.  JDeveloper has a similar look as Visual Studio.NET but some of the features were not as intuitive.  The tool that impressed me the most was Toplink.  This tool integrates with JDeveloper and allows the developer to map an object structure to a relational model.
<br />
<br />Toplink is ideal for building the persistent layer of a solution and the developer does not have to write code.  You define a class structure of getters and setters, map the properties to the appropriate fields in the database, and viola...Toplink generates a persistent layer that will retrieve data from your database.
<br />
<br />JDeveloper provides a lot of assistance for implementing end-to-end solutions built on top of SOA.  But as easy as it was, I could not help wondering how often the tools are used for real world development of enterprise solutions.  The lab sample was a simple application but can more complex solutions be implemented without needing to write a lot of code?  I will need more time to explore the set of tools Oracle to see.
