---
layout: post
title: 'End of a Long Day'
category: uncategorized
---

Some of you may have noticed that the site was down today.  An unfortunate set of events prevented me from getting the site up sooner.  It all started this morning when I deployed a new version of the site software.
<br />
<br />I tested the changes on a Windows 2003 Server running .NET Framework v1.1.  However, the production environment is running .NET Framework v1.1 Service Pack 1.  Core pieces of the web site framework code that have been running problem free for years failed under Service Pack 1.  I fixed the code after trouble shooting the problems, but then came more problems.
<br />
<br />A series of network problems prevented me from deploying the fixes.  From an issue with my wireless access point to service provider issues, it seemed as if there was something that did not want me to deploy the fixes.  And to top it off, while talking with a prospect I asked that he visit the White Peak web site forgetting that the site was down.  Definitely not the image I want when talking with someone about building web applications.
<br />
<br />After a long day, the site is finally up and running.  The code is a bit better as a result, and I'm reminded of the importance of testing software in an environment that mirrors the production environment as closely as possible even for a site as simple as this one.
