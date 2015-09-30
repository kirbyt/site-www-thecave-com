---
layout: post
title: 'Install Woes with Roxio'
category: uncategorized
---

After a 3 hour struggle I finally got Roxio Easy CD &amp; DVD Creator 6 installed on my laptop.  Here's the story.
<br />
<br />I run my laptop under a minimum privileged user account.  I go to install Roxio but it requires administrative rights to the machine for installation.  Okay, given the nature of the software I am okay with signing in as administrator for this install.  And that's where the problems started.
<br />
<br />Roxio 5 was already installed on my laptop so the install process asked to un-install it for me.   I tell it yes, the old software is removed, and the machine reboots.  I ran the installer under an administrator account from my primary user account which as I said has minimum privileges.  After the reboot, I signed in with my primary user account to finish the install but the install did not run.  I manually re-ran the install but it told me I needed to re-boot my machine to finish the install.  After doing this a couple of times, I realized that the install process was not going to restart unless I sign in as an administrator even though I started the process using a Run As the administrator.  Sigh...I sign out and back in this time as the administrator.  The install process runs and completes.
<br />
<br />With the software in place, I plug in my new Plextor PX-708UF into a USB2.0 port on my laptop.  The OS recognizes the device, does it magic, and I now have access to the device.  I launch the Roxio Creator Classic software to write out some virtual machines to DVD.  Roxio sees the device but it does not know how to interact with the device.  It doesn't know what formats are supported by the device and it doesn't recognize the media in the drive.  I re-boot.  No luck.  I sign in as administrator and still no luck.  I tried a combination of things and still no luck.  Finally I decide to re-install the Roxio software.
<br />
<br />Being a bit wiser this time around, I left the Plextor device turned on while I installed the Roxio software under the administrator account.  Ah, the missing piece reveals itself.  This time around the Roxio software detects the Plextor device and immediately downloaded additional driver tables to support the device.  Note, I had to remain in the administrator account for this to happen.  Finally all the pieces are in place and I am burning to DVD and CD without a problem.
<br />
<br />Lesson learned: When installing Roxio software, 1) have the device installed and turned on before installing the software, 2) install using a user account that has administration rights, 3) continue using the administrator account until the software installation is complete and you have verified that everything is working correctly.  Follow these steps and you will be able to use the Roxio software to burn DVD and CD in minimum privileged user accounts.
