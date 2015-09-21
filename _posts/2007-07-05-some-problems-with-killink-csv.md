---
layout: post
title: 'Some Problems with Killink CSV'
category: business
tags: [white peak software, killink]
---

Today I discovered a new problem in Killink CSV, the <a href="http://www.whitepeaksoftware.com/killink-csv.aspx">.csv editor</a> I have been working on.  Killink CSV has 2 general options, "Remember column widths" and "First row is read-only".  "Remember column widths" has a problem with hidden columns when the "First row is read-only" is turned on.  Killink CSV will ignore the hidden columns when populating the first row causing column headers to appear under the wrong columns.<br /><br />The second problem is more serious.  The option "First row is read-only" causes the program to report an unhandled error under certain circumstances when more than one file is open at a time.  <br /><br />Fixes for these problems will be available in a few days.  Meantime if you are <a href="http://www.whitepeaksoftware.com/edit-csv-files.aspx">editing .csv files</a> with Killink CSV I suggest you turn off these options until version 1.4 is released.
