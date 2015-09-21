---
layout: post
title: "Views Created In Code"
date: 2015-04-15 12:58:45 -0400
category: programming
tags: [ios]
---
Last year I posted an article that talks about why [I stopped using Interface Builder][1] in favor of writing code to create views. There are some who disagree with me, and to them I say, "To each his own." And there are some who agree with me, but choose not to publicize it. No matter. Every programmer has tricks that make them more productive, and creating views in code just happens to be one trick that works well for me. 

What works for me doesn't necessarily work for others. But I have to say, I had a brief "HA!" moment when I read this comment from Peter Steinberger's post about [researching Apple's research kit][2]:

> All views are created in code. Apple uses a Storyboard for the example catalog, but that’s it. Apple uses the standard pattern of overriding `viewDidLoad` to build UI in combination with Auto Layout and the visual format language, whenever possible.

Great minds think alike.[^1]

[^1]: Though I don't override `viewDidLoad` to create my views. I usually create a view class, and I add an instance of the class to the view controller's view in `loadView`.

[1]: http://www.thecave.com/2014/05/04/i-stopped-using-nibs-thanks-to-auto-layout/
[2]: http://petersteinberger.com/blog/2015/researching-researchkit/
