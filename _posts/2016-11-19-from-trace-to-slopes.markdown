---
layout: post
title: "From Trace To Slopes"
description: "How to download your Trace Snow recordings and import them into Slopes."
excerpt: "Need to download your Trace Snow recordings? I did and this is how I did it so I could import the recordings into Slopes."
date: 2016-11-19 10:52:31 -0500
image: "img/bg-07.jpg"
category: personal
tags: [python, ios, snowboarding, open source]
---
I'm a software developer but I'm also a snowboard bum. And with the start of the 2016/2017 snowboard season upon us -- that is, for those of us living in the Northern Hemisphere -- I'm eager to hit the slopes. Over the last few years I've used [Trace Snow][1], formerly AlpineReplay, to track my time on the slopes. It's a good iPhone app but far from perfect. One feature it lacks is reporting the number of days spent on the slopes in a season. Trace isn't alone in not having this feature. None of the ski and snowboard tracking apps I've tried have this feature. It seems these apps are more commonly used by individuals who only get a small number of days on the slopes, say 5 or 10 days, which is easy to count. But when you average 80+ days each season, counting the number of days can be a pain.

As luck would have it I had the pleasure of meeting [Curtis Herbert][2] at this year's 360idev. For those who don't know Curtis, he's an iOS developer who just happens to have written an excellent ski and snowboard tracking app appropriately named [Slopes][3]. 

I tried Slopes once last year, but I wasn't won over by it. I don't remember the reasons, but I do remember it was lacking the one feature I really wanted, which is the see the number of days I've ridden in a season. I mentioned this to Curtis and before the end of the conference Slopes had a day count feature. And Curtis had a new customer. I decided right away I would use Slopes this season instead of Trace.

That said, I was bummed that I could not use Slopes to view the years of data I had collected in Trace. I mentioned this in email to Curtis and within a minute he replied telling me about Slopes' import process. "Wow," I thought, "he's thought of everything."

I immediately went to the Trace website to see if I could export my data, and sure enough I could. But there was a problem. I had to export each day one at a time. I've logged over 250 days in Trace and manually downloading each day was not something I wanted to do. So I put on my developer hat and wrote a python script that [downloads the GPX files from Trace][7].

[Python][4] is the perfect language for a task like this especially when combined with [Beautiful Soup][5], a Python library for parsing HTML. I've written similar screen scraping scripts using Python and Beautiful Soup before, so writing a script that downloads the GPX files from the Trace site took me a fraction of the time it would have taken me to manually download each GPX file.

With my Trace data in hand I was ready to import the GPX files into Slopes, but I hit another wall. To import a GPX file into Slopes, you email the file to yourself, then on your iPhone, you open the GPX file in Slopes. This is a great process if you have one or two GPX files to import, but if you have hundreds, well, it's less than ideal. But thankfully Curtis thought that too. You can use [iTunes File Sharing][6] to import GPX files. Simply tether your iPhone to your Mac, open iTunes, select your iPhone, select the Apps section in the left panel, and scroll down to the File Sharing section in the right panel (thanks, Apple, for making this not so straight forward). Select the Slopes app, then drag and drop your GPX files into the Slopes Documents area. Finally, launch the Slopes app on your iPhone. Slopes was able to import all my files in a matter of seconds, and now I have all my tracked data, dating back to the 2012/2013 snowboard season, in Slopes.

Now, if you are a Slopes user too and you previously used Trace, you can use my Python script to [download your past GPX recordings][7]. I open sourced it so others can quickly download their data.

As for Slopes, I have to say it's a great app and Curtis is awesome. He has thought of just about everything for Slopes, and for those features not in it, he seems like the type of guy who will add them if it makes sense for the app and its users. In fact one feature missing that I've already requested is an option to export all my GPX data from Slopes. I don't plan to stop using Slopes anytime soon, but I would still like to see this feature on the off chance I have to make another switch in the future.

[1]: http://www.traceup.com/trace-for-snow
[2]: https://curtisherbert.com
[3]: https://getslopes.com
[4]: https://www.python.org
[5]: https://www.crummy.com/software/BeautifulSoup/
[6]: https://support.apple.com/en-us/HT201301
[7]: https://github.com/kirbyt/trace-export
