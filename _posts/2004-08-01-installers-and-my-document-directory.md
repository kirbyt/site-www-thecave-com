---
layout: post
title: 'Installers and My Document Directory'
category: uncategorized
---

In setting up my new laptop, I decided to go with VMware to host various guest operating systems for my development, collaboration, etc.  For the most part this is working out well but there are still glitches.  For example, to share the My Document folder with multiple guest OS I created a share in the host OS.  Each guest OS maps the My Documents folder to the UNC \\.host\Shared Folders\kirbyt\documents.  The problem I have experienced with this configuration has nothing to do with me authoring documents, etc.  Instead I have encounter two cases where installers have failed.
<br />
<br />The .NET Framework 1.1 installer and the Adobe Reader 6.0 apparently need access to the My Documents folder during the installation process.  However, both fail because of the UNC reference to the actual folder.  My temporary work around to date has been to re-map the My Documents folder to a temporary directory on the local hard drive within the guest OS, prefer the install, and re-map the My Documents folder back to the original UNC location.
<br />
<br />I wonder what these two installers want with the My Documents folder during installations and I wonder why their not smart enough to recognize the UNC reference.
