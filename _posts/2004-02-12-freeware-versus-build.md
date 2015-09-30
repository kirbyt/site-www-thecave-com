---
layout: post
title: 'Freeware versus Build'
category: uncategorized
---

I know I have said this before but this time I hope I really mean it.  I plan to start making more technology related posting to this blog.  And to start things off I will share my rambling on using a CMS verses building a web site by hand.
<br />
<br />I am in the process of setting up a web site for a new software company.  Originally I wanted to use <a href="http://www.dotnetnuke.com/">DotNetNuke</a> to manage the site.  It's a great solution that has evolved since original releases of IBuySpy.  However there are some database issues I have with DNN.  Specifically the software company's hosting provider only provides a single database so multiple applications hosted under the one account must share the database.  Unfortunately DNN and another application already hosted attempt to use the same table names.  Now there are ways around the problem using tricks like assigning different owners to the tables,
<br />etc.  And from what I have heard DNN v2.0 will have table name prefixes and other enhancements to prevent the problem.  But DNN v2.0 has not been released yet.
<br />
<br />I have tried <a href="http://www.rainbowportal.net/">Rainbow</a>.  It's similar to DNN in that it originated from IBuySpy but it is different in that it is written in C#.  DNN is written in VB.NET.  Rainbow doesn't appear to be as well supported as DNN either.  Good news is that Rainbow does not conflict with other applications hosted under the account.  And it has support for skins.  Unfortunately there are not a lot of skins available for Rainbow, and it took me a day to create my own skin.  And I have been having problems with building a good menu system for pages that
<br />appear off of a root page or tab.
<br />
<br />I like the features these products offer but at the same time I'm not quite happy with the end result of the web site.  In some cases these products are overkill for my needs.  So the software developer in me keeps saying "Write your own."  And I'm starting to listen.  There are some definite
<br />pros for writing my own web site or even creating my own CMS for that matter.  But the biggest con is the lack of time I have right now.  So I struggle with the debate as to whether or not I should use one of these fine products or write my own.  If only I had a week of time to crank out a new web site with all the features I need.  The ability to edit content online, the ability to define page layouts and support different module types, a built in blog engine, and maybe a blog engine that ties back to blogger.com (another time saver for me).  I could drop the online editing features of the blog engine and the content and do something quickly with ASP.NET.  But at the same time I like the ability to edit online for those rare cases when I am without my laptop.
<br />
<br />The struggle continues.  Feel free to post your opinions if you have one.
