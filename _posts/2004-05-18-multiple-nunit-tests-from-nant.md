---
layout: post
title: 'Multiple NUnit tests from NAnt'
category: uncategorized
---

I have been working today on stabilizing our build environment for a customer project.  NAnt has been a great to so far for this.  But today I wanted to start running NUnit tests of our assemblies from the NAnt script.  I have tried a combination of Xml in attempts to get the NUnit task to work as expected.  All assemblies except one have a configuration file so I must use the  element.  I have tried defining a single  section with multiple  elements, one for each assembly to test.  And I have tried multiple  sections within a single target, but the result is the same.  Not all tests do not always run.  <br /><br />Say I have 4 test assemblies.  2 out of the 4 may load.  The other two seem to be ignored.  The  section seems easiest enough, but I must be missing something.  Shot me a reply if you have a suggestion.  Thanks.<br /><br /><br />
