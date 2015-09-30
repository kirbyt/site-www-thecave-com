---
layout: post
title: 'xsd.exe does not support import'
category: uncategorized
---

xsd.exe from the .NET SDK has been a favorite tool of mine in recent months, but it let me down tonight.  It seems that xsd.exe does not support schema files that import other schemas.  I'm bummed.


\[Moments later\] I'm no longer bummed.  It turns out that xsd.exe does in fact support .  You simply need to include all .xsd file names on the command line.  For example:

    xsd.exe /c /l:cs /n:"namespace" a.xsd b.xsd c.xsd
