---
layout: post
title: 'XmlSerialization Patent'
categories:
  - blogger

---

Early this week Microsoft was granted a <a href="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&amp;Sect2=HITOFF&amp;d=PALL&amp;p=1&amp;u=/netahtml/srchnum.htm&amp;r=1&amp;f=G&amp;l=50&amp;s1=6,898,604.WKU.&amp;OS=PN/6,898,604&amp;RS=PN/6,898,604">patent</a> on their approach to serializing an object to XML.  While I can see how XmlSerialization provided by the .NET Framework is unique, I have mixed emotions about the patent.  For instance, XmlSerialization is probably my number one favorite feature in the .NET Framework.  I find I use it all the time.  But I now also spend a lot of development time in Delphi writing a Win32 application and I have thought about ways to implement a similar Xml serialization feature based on RTTI.  <br /><br />My concern with such a patent is that it might discourage other developers from inventing a form of Xml serialization for a different environment such as Delphi that is as flexible and easy-to-use as .NET XmlSerialization.  Put another way, if Borland decided to implement a way to store metadata about a class structure for a Win32 target and a developer used this metadata to provide a mechanism to map the object shape into an Xml schema as defined by the metadata and serialize the object into an Xml document based on that schema, would that be a violation of Microsoft's XmlSerialization Patent?<br /><br />Also, how does such a patent effect open source efforts such as Mono?  If someday Mono is widely adapted will Microsoft want to charge developers for the use of XmlSerialization in applications using the Mono framework?<br /><br />I don't know the answers to my questions, and as I said I have mixed emotions about the patent.  On one hand, I see how it is a unique technique for serializing objects to Xml.  On the other hand, I fear it will limit or completely eliminate a similar approach in other development environments.