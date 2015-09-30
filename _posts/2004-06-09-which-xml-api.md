---
layout: post
title: 'Which XML API?'
category: uncategorized
---

I had an interesting chat with a team member today about which XML parsing API from the .NET Framework to use for a particular situation.  He mentioned that using the XPathNavigator with an XmlReader would not load the document into memory.  However, after some quick research I found this to be incorrect.  XPathNavigator is different than XmlDocument in that it is optimized for XSLT processing and the XPath data model, but it is similar in that the entire document is read into memory.  XPathNavigator appears to use a cursor-base model for traversing the document while XmlDocument uses a tree-base model.<br /><br />The rule of thumb I have come up with is this:  Read-only, forward-only XML parsing API tend to read from a stream and do not store the entire document in memory.  Random access XML parsing API, which typically use a tree-base model or cursor-base model, will traverse in-memory the XML document which means this entire document is stored in memory.<br /><br /><br />
