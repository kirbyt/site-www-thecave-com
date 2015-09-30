---
layout: post
title: 'ClickOnce Deployment in .NET 2.0'
category: uncategorized
---

[Brian Noyes](http://www.softinsight.com/bnoyes/) gave a nice talk on ClickOnce Deployment using .NET 2.0 at last night's [NYC .NET Developers Group](http://www.nycdotnetdev.com/) meeting.  ClickOnce is the combination of the best ideas from web deployment, No Touch deployment, and Microsoft Updater Block.  Visual Studio 2005 makes ClickOnce a snap and requires little to no coding.  VS2005 allows you to set all the configuration needed for ClickOnce through project settings and publish the deployment package out to a server.  No need to write your own manifest files!  And it is part of the .NET runtime so you do not have to make changes to your application.  As a matter of fact, you can deploy applications built on .NET 1.1 through ClickOnce.
