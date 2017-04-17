---
layout: post
title: "Convert Time with a TextExpander Snippet"
date: 2017-04-16 21:14:46 -0400
category: programming
tags: [micropost,textexpander]
---

I find I am using [TextExpander](https://textexpander.com) more and more these days. It's an awesome productivity tool that saves me time by inserting snippets of text into whatever I'm writing, be it code or words. What I didn't know about TextExpander, that is, until today, is that it can run shell scripts to generate the text snippets. 

I often meet with people on the West Coast. When I schedule a meeting time, I will say something like "Let's meet at 01:30 PM EDT / 10:30 AM PDT" in the email. Not only is this a lot of text to type, but it also requires I calculate the Pacific time.

How cool would it be if TextExpander could generate the time snippet for me? Guess what. It can.

I created a shell script snippet that takes a local time, which I input, and calculates the Eastern and Pacific times. I use *timept;;* for the snippet abbreviation. Now when I want to mention a particular time in an email, I type *timept;;* and enter the time. TextExpander does the rest. 

Here's the shell script code for anyone who might want it. Make sure you select **Shell Script** as the *Content* type when creating the snippet.

```
#! /bin/bash

# Enter a time using 24H. 1:30pm is 13:30 .

ENTERTIME="%filltext:name=Time (in 24H)%"


# See https://gist.github.com/palaniraja/f8e21e8c66eac7e1b313 for a
# list of time zone names.

T1=$(TZ="America/New_York" date -jf "%H:%M %z" "$ENTERTIME $(date "+%z")" "+%I:%M %p %Z")

T2=$(TZ="America/Los_Angeles" date -jf "%H:%M %z" "$ENTERTIME $(date "+%z")" "+%I:%M %p %Z")

echo -n "$T1 / $T2"
```
