---
layout: post
title: 'save from url'
category: uncategorized
---

I encounter a rather strange problem today.  I have a set of HTML files stored locally on my machine.  I can view each of the web pages in Fire Fox but not in IE.  Every time I attempted to open the HTML in IE, IE would report that the file was missing even though I knew it was on the hard drive.  I tried opening the file using the menu item File|Open from IE but it reported the same error message.  Finally I decided to load the HTML file into Visual Studio.NET.  To my surprise the file would not load and VS.NET would not report an error message.  If I attempted to load the file a second time in VS.NET, the IDE would simply lock forcing me to kill the process.
<br />
<br />After some detective work, I discovered the source of the problem.  Seems that each HTML file I attempted to open had a comment line near the top of the file that looked like this: <b><!-- saved from url=(0033) --></b>.  Apparently this is special information that Microsoft products such as IE and VS.NET look for.  I'm not sure how the information is used but I do know that neither tool reported meaningful messages regarding the commented line in the HTML file.
<br />
<br />To resolve the problem, I removed the saved from url lines from each HTML file.  IE and VS.NET are now happy as can be with regard to viewing these files.
