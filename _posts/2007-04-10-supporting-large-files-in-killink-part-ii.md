---
layout: post
title: 'Supporting Large Files in Killink Part II'
category: business
tags: [white peak software, killink]
---

I'm coming to the conclusion that having code loop millions of times to copy data from one structure to another is never going to be fast.  <br /><br />I'm using two controls, a spreadsheet control and a report printing control.  Unfortunately the two do not support the same data structures so to print a report <a href="http://www.killink.com/">Killink</a> has to copy the data from the spreadsheet to the report which means looping.  And when there are a million + rows with 3 columns the code is looping 3 million + times.  Not much can be done to speed it up.<br /><br />What I need is a way to keep the data in a single data structure that is supported by both components.  I'm starting to have a better understanding why certain commercial software tends to not rely on 3rd party components and libraries.  However, time is important to me so I must rely on 3rd party components for certain features.<br /><br />For now <a href="http://www.killink.com/">Killink</a> will have to warn the user before allowing a huge files to be printed.  "You wish to print a file that is very large.  It will take some time to prepare the data for printing.  Do you wish to continue?"<br /><br />The report I'm trying to preview during testing will have more than 15,000 pages.  I don't see anyone realistically printing this many pages but you never know.
