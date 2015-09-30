---
layout: post
title: 'Open VS.NET Command Window Here'
category: uncategorized
---

I used Windows Explorer all the time to navigate my hard drive.  Many times throughout the day I need to drop to MS-DOS within a specific directory.  I'm too lazy to drop to DOS and navigate using the command line so I created a registry entry that will launch a CMD window from Windows Explorer and place me in the selected directory.  You can run the following VBScript to do the same for yourself.

    Set WshShell = CreateObject( "WScript.Shell" )  
    WshShell.RegWrite _  
       "HKEY_CLASSES_ROOT\Folder\Shell\Command Window\Command\", _  
       "CMD /K cd /d %L"  

As an added bonus, you can run the VBScript below to create a menu item that will launch a CMD window that has been setup for the Microsoft Visual Studio .NET tools.

    vsnetPath = _  
     "d:\Program Files\Microsoft Visual Studio .NET\Common7\Tools\vsvars32.bat"  
    Set WshShell = CreateObject( "WScript.Shell" )  
    WshShell.RegWrite _  
     "HKEY_CLASSES_ROOT\Folder\Shell\Open VS.NET Command Window Here\Command\", _  
     "CMD /K """ + vsnetPath + """ : cd /d %L"  

Be sure to modify the path above to match your installation of Visual Studio.NET.  

To use launch an instance of Windows Explorer and navigate to the desired directory.  Right mouse click the directory name and select Open Command Window Here or Open VS.NET Command Window Here menu item.  Now ain't that nice?
