---
layout: post
title: 'CAPTCHA Requirement for Blog Comments'
category: programming
tags: [blog]
---

The number of spam messages received through blog comments at thecave.com has increased to a point where I finally had to do something about it.  So today I implemented a <a href="http://en.wikipedia.org/wiki/Captcha">CAPTCHA</a> field required to make a blog comment.  The code is a partial C# port of the <a href="http://www.codeproject.com/aspnet/CaptchaControl.asp">CAPTCHA Server Control for ASP.NET</a>, which is written in VB.NET.<br /><br />My next step will be removing the 400+ spam comments posted.  Joy, joy.<br /><br /><span style="color:red">Update:</span> The CAPTCHA implementation has eliminated 100% of blog comment spam on this site.  I wish email spam could be eliminated just as easily.
