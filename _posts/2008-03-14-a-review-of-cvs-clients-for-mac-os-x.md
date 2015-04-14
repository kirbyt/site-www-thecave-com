---
layout: post
title: 'A Review of CVS Clients for Mac OS X'
categories:
  - blogger

---

I've been a Mac user for a little more than 6 months now, and while I'm still writing software for the Windows platform, I'm toying with the idea of targeting OS X for an upcoming product.  The use of version control software is part of the software methodology used at <a href="http://www.whitepeaksoftware.com/">White Peak Software</a>, and the version control software I used is CVS (Concurrent Versioning System).<br /><br />Why CVS instead of Subversion?  Simple.  I have been using CVS since early 2000.  It works for me and I see no reason for moving to Subversion.  If I were starting from scratch I would most likely select Subversion for versioning control, but that's a different story for a different blog post.  This blog post is about my review of the various CVS clients available for Mac OS X.<br /><br /><a href="http://www.tortoisecvs.org/">TortoiseCVS</a> is the CVS client I use on Windows and is by far, in my opinion, the best Windows CVS client out there.  This of course is what I used as a baseline for finding a CVS client for the Mac.  The CVS client I use needs to be as good as, or close to, TortoiseCVS.  My preference for a CVS client for the Mac would be one that provides a Finder like user interface and uses right-click popup menus to interact with the CVS repository.  That's what I went searching for and here is what I found:<br /><br /><b>Xcode</b><br /><br />Xcode from Apple has an SCM repository feature that works with CVS, Subversion, and Perforce.  I like the approach used in Xcode but I wasn't able to get it working with my CVS repositories.  The first problem I encountered was the lack of sserver support.  The workaround for this is to use CVSNT instead of CVS, which comes installed by default on OS X.  Unfortunately Xcode has a problem with sending the password to CVSNT and since CVS doesn't support sserver Xcode was quickly off my list of CVS clients to consider.<br /><br />For grins I decided to enable pserver on one of my CVS repositories to test Xcode with CVS.  Unfortunately I ran into more problems.  For starters, there is no way (that I can find) for specifying a module.  Secondly, when I was finally able to get Xcode to checkout a complete repository it would crash Xcode.  I was testing with a rather large repository and the crash happened after about 20 minutes of download time.  I tried this 3 times and the crash happened all 3 times.  So even if Xcode did work with CVSNT and I was able to use sserver, I still could not use Xcode as my CVS client.<br /><br /><b>MacCvsX</b><br /><br />The next CVS client I tried was <a href="http://cvsgui.sourceforge.net/">MacCvsX</a> (version 3.3 beta 2).  This client has no problems accessing my CVS repositories but I found the UI to be a bit cumbersome.  Also, I didn't like the fact that when I wanted to add lots of new files to the repository I had to select each and every file individually.  There is no "Add Content" feature like that found in <a href="http://www.tortoisecvs.org/">TortoiseCVS</a>.  While I can do everything I need to using MacCvsX, I found it UI to be inefficient.  Thus my search for a CVS client for Mac OS X continued.<br /><br /><b>MacCVS Pro</b><br /><br />I looked at <a href="http://www.maccvs.org/">MacCVS Pro</a> next, but I never downloaded it.  The <a href="http://www.maccvs.org/status.html">revision history</a> shows the last update to be March 27, 2000.  That's nearly 8 years without an update.  I doubt it will run on my Intel-based MacBook Pro so I didn't bother to download it.<br /><br />After more searching I discovered that the MacCVS Pro website at maccvs.org is out of date and no longer maintained, but the project lives on at SourceForge.net.  The up-to-date <a href="http://sourceforge.net/projects/maccvspro/">MacCVS Pro</a> can be found at <a href="http://sourceforge.net/projects/maccvspro/">http://sourceforge.net/projects/maccvspro/</a>.  The latest update at the time of this writing is January 14, 2007.  Ah, much better.  I did download it but I never ran it.  According to the release notes in the readme file the latest build of MacCVS Pro "will only run on PPC machines (and Intel machines via Rosetta)."  And the readme goes on to say "This is likely the last version that will be built using CodeWarrior, since CodeWarrior is no longer commercially available."  So MacCVS Pro is not the CVS client for me.<br /><br /><b>MacCVSClient</b><br /><br />The next CVS client I looked at was <a href="http://www.heilancoo.net/MacCVSClient/">MacCVSClient</a> version 1.10.  Now this product is more to my liking especially after looking at the other options.  It works well with my CVS repositories and I like the concept of opening a sandbox to get a hierarchical view of the files.  I also really liked how the hierarchical view automatically refreshed to reflect the most recent changes to the sandbox area and files within the sandbox.  What I didn't like was the diff viewer.  While usable it wasn't what I have become accustom to.  I prefer the split window approach when viewing differences between files.  Still, MacCVSClient is an excellent choice for those looking for a free CVS client for the Mac.<br /><br /><b>SmartCVS</b><br /><br />My search to find the ideal CVS client for Mac OS X lead me to <a href="http://www.syntevo.com/smartcvs/">SmartCVS</a> from Syntevo.  SmartCVS as a very clean, modern looking user interface.  It provides different views of the sandbox.  It allows me to easily checkout specific modules instead of the complete repository.  As a matter of fact, SmartCVS has a project manager that allows me to save the settings for a particular module.  I found this feature to be really cool and handy.  And even though it does not have the "Add Contents" feature found in TortoiseCVS, SmartCVS does make it easy to add large sets of files to a repository even when the files are contained within subdirectories.<br /><br />SmartCVS comes in two favors, Foundation and Professional.  Foundation is free but it does not include all the features found in the Professional version (click <a href="http://www.syntevo.com/smartcvs/comparison.html">here</a> for the features comparison chart).  The Professional version is affordable costing only $79 USD for a single user license and discounts for multi-user licenses.<br /><br />My only complaint with SmartCVS at the moment is that Syntevo needs to improve its <a href="http://en.wikipedia.org/wiki/Search_engine_optimization">SEO</a>.  I didn't find SmartCVS in my initial searches and had I not spent a few nights in a row looking for CVS clients I probably would have never found it.  <br /><br /><b>Conclusion</b><br /><br />In my opinion and based on my needs, SmartCVS is the best CVS client available for the Mac.  It lacks some features that I have come to expect with TortoiseCVS <strike>such as the ability to use the diff and merge tools of my choosing</strike>, but it definitely has unique features that I like such as the Project Manager.  So if you are looking for a good CVS client for the Mac, give SmartCVS a test drive.<br /><br /><font color="red">\[Update\]</font> Turns out SmartCVS does allow users to specify external file diff and merge tools.  The options are found under Preferences.