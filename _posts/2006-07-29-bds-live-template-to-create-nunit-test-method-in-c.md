---
layout: post
title: 'BDS Live Template to create NUnit test method in C#'
category: programming
tags: [c#]
---

Here is the BDS <a href="http://delphi.wikia.com/wiki/Live_Templates_Technical_Info">Live Template</a> I wrote to create an NUnit test method shell for a C# class.<br /><br /><pre><br /><br /><br />        version="1.0.0"&gt;<br /> <br /> <br /> <br />        Method name<br /> <br /> <br />        MyUnitTest<br /> <br /> <br /> <br />      Unit test method<br /> <br /> <br />      Kirby Turner - White Peak Software Inc<br /> <br /> <code>&lt;![CDATA[[Test]<br />public void $name$()<br />{<br />$*$Assert.Fail("Not implemented.");$end$<br />}]]&gt;<br /> </code><br /> <br /><br /></pre><br /><br />The template will generate the following C# code:<br /><br /><pre><br />[Test]<br />public void MyUnitTest()<br />{<br />   Assert.Fail("Not implemented.");<br />}<br /></pre>
