---
layout: post
title: "For-In Loop vs Using Block"
date: 2015-02-20 13:17:18 -0500
category: programming
tags: [ios, os x]
---
Brent Simmons talks about [for-in loops][1] in a recent post. In it he says:

>  most of the time the for-in enumeration is the straightforward and less clever approach. (“Less clever” is a good thing.)

I agree with Brent. I'm a fan of the for-in syntax. It's straightforward and easy to read. But I have to admit in recent years I've been using `enumerateObjects​UsingBlock:` more often than for-in loops. I've been favoring the block syntax because something bbum [said on Stack Overflow][3] a while back.

> `enumerateObjectsUsingBlock:` will be as fast or faster than fast enumeration (`for(... in ...`) uses the `NSFastEnumeration` support to implement enumeration). Fast enumeration requires translation from an internal representation to the representation for fast enumeration. There is overhead therein. Block-based enumeration allows the collection class to enumerate contents as quickly as the fastest traversal of the native storage format. Likely irrelevant for arrays, but it can be a huge difference for dictionaries.

For those who don't know who [bbum][3] is, he's Bill Bumgarner. He works at Apple and knows a thing or two about Cocoa. So I believe him when he says "`enumerateObjectsUsingBlock:` will be as fast or faster than fast enumeration."

[1]: http://inessential.com/2015/02/19/looping_through_objects_in_an_array
[2]: http://stackoverflow.com/a/4487012
[3]: http://stackoverflow.com/users/25646/bbum
