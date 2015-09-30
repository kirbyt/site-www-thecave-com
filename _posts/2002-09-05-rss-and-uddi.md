---
layout: post
title: 'RSS and UDDI'
category: uncategorized
---

Karsten Januszewski recently published a white paper on <a href="http://www.gotdotnet.com/team/karstenj/docs/rss_in_uddi.aspx">Registering and Discovering RSS Feed in UDDI</a>.  I personally think this is a great idea.  My only problem with the idea is that registering services in UDDI can be a bit cumbersome for some folks.  But Karsten solves this problem by providing a <a href="http://www.gotdotnet.com/userfiles/karstenj/rssuddi.zip">sample</a> Windows application that makes registering RSS v.9x feeds as simple as specifying the URL to the feed and clicking a button.
<br />
<br />So why do I like the idea of registering and discovering RSS feeds in UDDI?  It exploits the power of UDDI.  Many people assume UDDI is only about Web services but that is not true.  Any services can be registered in UDDI and discovered by the masses.  For example, if you were to search one of the UBR for the provider "Kirby" you will find that I offer two <a href="https://uddi.ibm.com/ubr/findservice?action=find&amp;businesskey=09A655F9-BA28-4009-94EF-906E26D247FB">services</a>.
<br />
<br />One service is a Web service for reporting statistics for <a href="http://radio.thecave.com/">WCAV Radio</a>.  But the other is the RSS feed for this weblog.  And by leveraging UDDI, people can discovery all the services I offer whether the service is a Web service or not.
<br />
<br />Those using Visual Studio.NET's Add Web Reference will notice a <a href="http://uddi.microsoft.com/addwebreference/search.aspx?searchType=1&amp;searchParams=kirby">search</a> on the provider "Kirby" will return only Web service I offer.  The reason is that Add Web Reference was implemented to search for Web services only.  The same idea can be applied to weblog tools that wish to discover RSS feeds.  Those tools only need to search for services in UDDI based on the practices outlined in Karsten's white paper.
