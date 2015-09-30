---
layout: post
title: WebCalendar
category: uncategorized
---

Melanie and I have a very busy but fun life.  With work, travel, events in New York, it is sometimes hard for us to remember were we will be in 6 months.  So I setup a web calendar for us to use.<br /><br />I used open source project <a href="http://webcalendar.sourceforge.net/">WebCalendar</a>, which is a PHP-based calendar application.  Setup was a snap thanks to the folks at <a href="http://www.crystaltech.com/default.htm?ref=thecave.com">CrystalTech</a>, which is my hosting provider.  Their support of PHP and <a href="http://www.mysql.com/">MySql</a> made getting the site up and running very easy.  However, I did have to make one change to the code.<br /><br />Inside of init.php is a number of "include-once" statements.  Each of these statements refer to the a file in the "includes" directory such as "includes/translate.php".  To make the site work correctly within the server environment I had to remove the "includes/" string literal portion of the "include-once" statements.  I did not have to make any other changes to get the application running from the shared server.<br /><br /><br />
