---
layout: post
title: "Tags And Categories"
date: 2015-09-21 19:45:44 -0400
categories: programming
tags: [blog, web, jekyll]
---
I've been doing a bit of tinkering here at thecave. I realized I was using categories as if they were tags and for one simple reason. I didn't have a way to support tags. That is, until now.

Tag support is provided in Jekyll, but I wanted something slightly different. I want the list of tags to appear at the end of a post just like the categories have for last couple of years. I searched for different ways to support tags with Jekyll, but I didn't find anything suiting my needs. Then it occurred to me I could tweak the category plugins I use to work with tags, so that's exactly what I did.

The [Jekyll category plugins](https://github.com/recurser/jekyll-plugins) I use come from Dave Perretter. I made copies of *category_generator.rb* and *category_list_tags.rb* naming the new plugins *tag_generator.rb* and *tag_list_tags.rb*. Then I replace references to `categories` and `category` with `tags` and `tag` in the source code. And BAM! I now have tag support at thecave.com.

You can find the source code for the plugins in my site's github [repo](https://github.com/kirbyt/site-www-thecave-com/tree/master/_plugins).
