---
layout: post
title: 'dbGo and Delphi'
category: programming
tags: [delphi]
---

For years I believed the Professional Edition of Delphi did not provide any database access to SQL Server.  I assumed if you wanted db access you would need to import the type library for ADO included in MDAC.  But raw COM access to ADO is sometimes a pain (think BSTR and SafeArray).  So 15 minutes of googling and reading the BDS help file I discovered a gem called dbGo.  From the help file, "The dbGo components provide data access through the ADO framework."  Go figure, or should I say "dbGo figure"?  \[Geek humor, haha\]

So my question is what advantage, if any, does the Enterprise and Architect editions of BDS provide for a SQL Server database developer?  I'm sure there are some advantages, most likely designed for the corporate developer and or enterprise environment.  But for my needs it looks like dbGo and Delphi Professional will work nicely.

I need to verify that I can use dbGo to access SQL Server 2005 but from what I read it looks like dbGo is nothing more than a wrapper to ADO.  And ADO can definitely talk to SQL Server.

**Update:** I have no problems interacting with SQL Server 2005 using dbGo and the Professional edition of Delphi.  This opens up a whole new world for me.
