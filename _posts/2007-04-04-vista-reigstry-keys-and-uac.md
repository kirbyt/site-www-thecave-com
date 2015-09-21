---
layout: post
title: 'VIsta, Reigstry Keys, and UAC'
category: programming
tags: [windows, killink]
---

I'm adding a new feature to <a href="http://www.killink.com/">Killink</a> to allow the user to integrate the application with Windows Explorer.  Not a difficult task.  Just involves making some registry settings.  But one registry setting I need to make must go under HKEY_CLASSES_ROOT, and this hive is under administrative control in Vista.  <br /><br />This isn't such a big deal if I am using an installer.  Installers will typically ask for elevated permissions to perform the install.  But I'm trying to provide a version that does not require an installer.  This means my application will have to ask for elevated permissions when the user clicks the option to integrate with Explorer.  It also means I need to display the shield icon indicating that elevated permissions are required to perform the task.<br /><br />This really has me bummed out because it means more work (and learning).  Now I have to learn up to ask for elevated permissions within the application.<br /><br />Sigh...
