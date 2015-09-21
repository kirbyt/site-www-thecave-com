---
layout: post
title: 'Connection Tool for SQL Server Updated'
category: programming
tags: [sql server]
---

I posted a new version of the <a href="http://www.whitepeaksoftware.com/connectiontool.aspx">Connection Tool for SQL Server</a>.  This free tool provides an easy way to test and build connection strings for SQL Server databases.  This latest version has improved support for Windows 98/ME and Windows Vista.<br /><br />One unfortunate side effect with this release is you must delete the ConnectionToolForSQLServer.exe.config file if you used the previous version.  This file is found in the same directory as the ConnectionToolForSQLServer.exe program file.  If you don't you will get an error message similar to this:<br /><br /><div class="quote"><br />ConnectionToolForSQlServer.exe<br /><br />This application has failed to start because the application configuration is incorrect. Reinstalling the application may fix this problem.<br /></div><br /><br />I explain the reason for this <a href="http://www.thecave.com/archive/2007/04/25/when_naming_a_configuration_file_programexeconfig_is_bad.aspx">here</a>.
