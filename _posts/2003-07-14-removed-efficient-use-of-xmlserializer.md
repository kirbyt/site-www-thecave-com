---
layout: post
title: 'Removed: Efficient use of XmlSerializer'
category: uncategorized
---

Last night I published a rather lengthy blog entry only to find out that I was mistaken about the interworkings of the XmlSerializer infrastructure.  Based on some resent code I started to believe that the XmlSerializer would gen a temp assembly each time a new instance was initialized even when the same type was used.  <a href="http://www.pocketsoap.com/weblog/">Simon Fell</a> posted a comment correcting my assumption.  And after writing with a quick sample that iterated through initialization of XmlSerializer instances with the same type, I saw that Simon was in fact correct.  For that reason, I have pulled my fault posting from the site.
<br />
<br />Thanks Simon for the correction.
