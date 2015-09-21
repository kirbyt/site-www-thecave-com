---
layout: post
title: "Made Some Fixes To The Blog Site"
date: 2014-12-28 19:01:32 -0500
category: programming
tags: [web, jekyll]
---
Before doing some work today I decided to make some improvements to my blog site. I thought I would be playing with the site for only an hour or so, but instead it took most of the day. Typical when dealing with programming issues in an unfamiliar environment. 

This site, as well as [my company blog site][blog], uses [Jekyll][jekyll] to generate a static HTML version of the site that is in turned hosted on a server for your viewing pleasure. I noticed a while back that categories with embedded spaces, such as *cross post*, weren't accessible from the categories list. The embedded space was being replaced with a dash. Also, the RSS feed was not including the time of the post, only the date. So I set out to fix these problems.

I started with the time problem first. I learned that Jekyll does not include the time of the post unless you include the `date` parameter in the front matter. Adding the parameter is easy enough to do, but I decided I wanted to make it even easier for me. So I created a Rakefile that has a `new_post` task. I could have used an existing Rakefile, maybe even the one from Octopress, but I decided it would be more fun to write my own. Turns out writing a Rakefile is pretty simple, and I had my `new_post` task working quickly. 

The `new_post` task I wrote create a new markdown file for the post. The task also generates the YAML front matter for the post including the `date` parameter with the current local time. This solves my time problem in the RSS feed for new post. I thought about making a fix for older post, but I decided it wasn't worth the effort.

Using the Rakefile to create a new post makes so much sense that I decided to add a `deploy` task the Rakefile. I've been using a shell script I wrote a few years ago to generate the Jekyll site then commit it to the *gh-pages* branch of the site's git [repo][repo]. I thought it would be a fun exercise to re-implement this in the Rakefile. At the same time I decided to change how the files are committed to the branch. Instead of working from a single local git repo, I decided to clone the repo to a second *_deploy* directory, then copy the *_site* files to that directory. Turns out this was fairly simple to do as well. 

With that work out of the way I turned my focus to the categories name problem. Turns out it was caused by a space replacement in the Jekyll plugin I use to generate the categories list. That was the easiest, fastest fix of the day.

With a smile on my face and feeling of success I decided to do one more thing. I decided to update my install of Jekyll. And this is when everything fell apart. The sense of success and feeling of being productive evaporated quickly. Long story short, turns out I had rvm and rbenv installed at the same time, and apparently having both installed at the same time causes problems when updating gems. Unfortunately it took me a long while to figure out what had happened. I didn't realize rvm was installed, but once I did I uninstalled it. I did another update and made sure I had rbenv-gem-rehash installed. 

All is well now. In fact, the only reason I'm writing this post is to make sure everything is working as expected. And now that I have a faster way to create new posts, I'm hoping to post here more frequently. 

[blog]: http://blog.whitepeaksoftware.com
[jekyll]: http://jekyllrb.com
[repo]: https://github.com/kirbyt/site-www-thecave-com
