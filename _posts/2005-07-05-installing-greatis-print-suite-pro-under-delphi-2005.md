---
layout: post
title: 'Installing Greatis Print Suite Pro under Delphi 2005'
category: uncategorized
---

I purchased the <a href="http://www.greatis.com/delphicb/printsuite/">Greatis Print Suite Pro</a> today so I can add print and print preview features to SMTP Diagnostics.  The components are nice but the installation is a pain for those new to Delphi 2005.  And unfortunately the documentation does not include how to install under D2005.<br /><br />Fortunately I was able to find a way to install the components.  Here's the steps I followed to install the component suite:<br /><br />- Created a new package project (File|New|Package).<br />- Added PrintSuiteReg.pas to the project.<br />- Added PrintJobsReg.pas to the project.<br />- Compiled and Installed the package.
