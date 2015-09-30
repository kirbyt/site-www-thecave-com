---
layout: post
title: 'Visual Studio.NET problem: EnvDTE missing or not found'
category: uncategorized
---

I un-installed <a href="http://www.activestate.com/Products/Visual_XSLT/">Visual XSLT</a> the other day and it broke my Visual Studio.NET install.  When I created a new Windows Application, VS.NET would fail to display Form1 in the Form Designer with the exception "File or assembly name EnvDTE, or one of its dependencies, was not found."  I believe the problem was caused by un-installing Visual XSLT.  Luckily the fix was simple.
<br />
<br />Under the .NET Framework directory C:\WINDOWS\Microsoft.NET\Framework\v1.0.3705\ you will find the envdte.dll assembly.  Copy this file to C:\Program Files\Microsoft Visual Studio .NET\Common7\IDE\ and you should be good to go.  Of course you will need to adjust the drive letters based on your configuration.
<br />
<br />This fix worked for me.  Hopefully it will work for you if you are experiencing the same problem.
