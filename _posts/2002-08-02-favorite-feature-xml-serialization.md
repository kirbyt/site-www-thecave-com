---
layout: post
title: 'Favorite feature: XML Serialization'
category: uncategorized
---

I have said it before and I will say it again.  XML Serialization ROCKS!  I am working on a new version for WASTEDBoarding.com this weekend and I am taking a totally new approach to the architecture of the software.  One approach includes using XML Serialization to save object hierarchies to a SQL Server database.
<br />
<br />Here's how it works.  All my core classes are serializable.  ToString() has been overridden to return the object hierarchy in an XML string.  I pass the XML string to a stored procedure in SQL Server, which in turns saves out the information to the appropriate tables.  All of this totally rocks!
