---
layout: post
title: 'Fixed My Delphi 2007 Debug Issues'
category: programming
---

In my posting <a href="http://www.thecave.com/archive/2007/03/25/5_things_i_like_about_delphi_2007.aspx">5 Things I Like About Delphi 2007</a> I mentioned debugging problems I experienced after installing 3rd party packages.  The source of the problem was in fact the use of certain 3rd party packages, more specifically the DevExpress VCL packages.  However the problem wasn't with the DevExpress directly.  <br /><br />I installed all packages found in the DevExpress library/delphi10 directory.  This was a mistake made by me.  Only certain design time packages need to be installed in the IDE, not all packages in that directory.  Lucky for me I still have BDS 2006 installed.<br /><br />I launch BDS 2006 and Delphi 2007.  I went to the installed package list in BDS 2006 (Component &gt; Install Packages...) and manually added each DevExpress package listed in BDS 2006 to Delphi 2007.  This resolved the debugging issues I experienced yesterday.  And now I'm able to make use of Delphi 2007 for existing projects.
