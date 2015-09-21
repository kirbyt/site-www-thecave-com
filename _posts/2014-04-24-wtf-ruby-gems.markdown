---
layout: post
title: 'WTF Ruby Gems'
category: rant
tags: [ios, gems, ruby, cocoapods]
---
I'm working with a client to update one of their iOS apps. The Xcode project uses CocoaPods for dependency management. I'm not a fan of CocoaPods, but I grin and bear it when working with existing client projects.

Yesterday I needed to update a class, one .h file and one .m, from an open source project, so I ran `pod update` on the project. This told me I needed to update my install of CocoaPods, so I did. This in turn updated a ton of other Ruby Gems on my system. It was annoying having to go through the update process when all I needed was two files that I could have copied from github in less time, but no harm done, right? WRONG!!!

Today I go to publish a new blog post. I use Jekyll to convert my site to static HTML. Guess what? Yesterday's CocoaPods update has now broken my Jekyll install, and I cannot publish the blog post I just finished writing. WTF!?

ALL I WANTED TO DO WAS GET THE LATEST FREAKIN' VERSION OF TWO FILES, A .h AND .m, AND NOW I HAVE TO WASTE TIME TRYING TO FIX WHAT WAS NOT BROKEN UNTIL YESTERDAY JUST SO I CAN PUBLISH A BLOG POST.

This is why I don't like using things like CocoaPods, plug-ins, and other simular widgets.
