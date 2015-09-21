---
layout: post
title: "Using xcodebuild To Export a .ipa From an Archive"
category: programming
tags: [ios, xcode]
---
Xcode 6 changes how you export a .ipa from an archive for adhoc distribution. It used to be that you could export the archive to a .ipa as long as you had the right provisioning profile and distribution certificate on your machine. Starting with Xcode 6 you need to be a team member of the particular Developer Program account and you need to have the rights to make a distribution build. This means you need to be a team agent. However, I work with a number of clients who don't have the clue what Xcode is much less are willing to make distribution builds, so I need to way to make distribution builds within this new limitation from Xcode 6.

Making distribution builds hasn't been a problem for me in the past. I ask the client to provide me[^ask] with the necessary provisioning profile, distribution certificate, and public private key pair so I can make the distribution build for them. Then I use Xcode Organizer to export the archive to a .ipa that I can distribute.[^host] But it seems I can no longer export using Organizer without having the right team access, so I had to search out an alternative approach.

Turns out starting with Xcode 5, *xcodebuild* includes parameters for exporting from an archive. This is exactly what I need so I can continue making adhoc distribution builds for clients without being a team member or team agent under their Developer Program account.

So how do I do it?

### The How To

My build script starts by performing a clean.

> xcodebuild clean -project $projectname.xcodeproj -configuration Release -alltargets

Then the script builds and archives the app. I specify the archive path using the *-archivePath* parameter in the command line so the script will know where the archive file is located.

> xcodebuild archive -project $projectname.xcodeproj -scheme $schemename -archivePath $projectname.xcarchive

Finally my script exports the archive into a .ipa file.

> xcodebuild -exportArchive -archivePath $projectname.xcarchive -exportPath $projectname -exportFormat ipa -exportProvisioningProfile "Provisioning Profile Name"

I let the provisioning profile imply the signing identity, but you can specify the signing identity using the *-exportSigningIdentity* parameter.

### The Gotcha

The one major gotcha that cost me a more than an hour of time was figuring out the parameter value for *-exportProvisioningProfile*. I initial thought it should be the file name to the provisioning profile. I tried it with and without the *.mobileprovision* file extension, but it did not work. I included a relative path as well as an absolute path to the provision profile. I tried using the UUID for the provision profile instead of the file name. I even I tried not including a path at all thinking it would look up the provision profile in the *~/Library/MobileDevice/Provisioning Profiles/* directory, but still no luck.

Turns out I needed to specify the name of the provisioning profile as defined in the file itself. This is the same name assigned to the profile in the provisioning portal. Once I figured this out I was able to export the .ipa from the archive using the my build script, and I don't have to be a team agent under my client's Developer Program account to make the distribution build.

[^ask]: I usually assist my clients with this by guiding them through the steps, or I ask them to give me the account credentials with a temporary password so I can perform the necessary steps. Then I have the client reset the password.

[^host]: I don't export when I host the test app on [HockeyApp][hockey]. It takes care of exporting the .ipa from the archive for you. I only export when the client requests that the test app be hosted on their own server.)

[hockey]: http://hockeyapp.net/
