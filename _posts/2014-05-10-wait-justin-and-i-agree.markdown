---
layout: post
title: 'Wait, Justin and I Agree?'
category: programming
tags: [ios, interface builder, auto layout]
---
My friend Justin wrote a post explaining why he thinks you should [use Interface Builder with Auto Layout][response]. It was in response to my post about [why I don't use Interface Builder][noib] these days thanks to Auto Layout. Justin's post is good with plenty of valid points. Justin and I also agree iOS and Mac developers should be using Auto Layout. But he said something that got me wondering...does Justin agree with me more than he realizes. Regarding writing layout constraints in code, Justin says:

> It’s totally possible to do this, and there are situations where I do it as well. Small views with a few basic constraints are usually quicker and easier to write without a Xib. Insanely complex views such as the TED video player I wrote and maintain are also too heavy for a straight Xib implementation.

I found that almost all the apps I have worked on in recent years consists of views that fall into the category of either being small views or complex views. And even "insanely complex views" can likely be broken down into smaller views using the [composite view pattern][compositeview]. In other words, in my experience many views can be broken down into smaller, more manageable views that end up needing only a few basic constraints. And even Justin agrees that "small views with a few basic constraints are usually quicker and easier to write without a Xib." So it's my style, my approach to solving UI problems that makes it quicker and easier for me to write UI with layout constraints in code rather than using IB.

Does this mean I'm right and Justin is wrong? No. Does it mean Justin's right and I'm wrong? No.

In programming there are multiple ways to accomplish a task, and one approach isn't always necessarily better or more right than another approach. The approach a programmer takes to solve a problem is often based on past experience and the solution often reflects the personal style of the programmer.

Over the years my style has changed and evolved to a point where I break down complex problems into smaller, more manageable tasks, and I use this style, or approach if you will, when implementing a UI. These days view controller containment and composite views work well for me. I like to write [light weight view controllers][vc], and I use other objects to serve as the data source and delegate to my view controllers. And more recently I have found I don't need to use Interface Builder to be a productive programmer.

Does this mean you should abandon IB as well? Certainly not. Does this mean I hate IB and I will never use it again? Most certainly not. When a task I need to accomplish is quicker and easier for me to do in IB, then I will most certainly use IB. Just like Justin will sometimes write layout constraints in code, I will sometimes use IB to put together a view.

Different situations call for different solutions. There isn't just one way to solve a problem, and programmers shouldn't do something just because one person says this is the way it should be done. Programmers should explore the different ways to accomplish a task, and decide what works best for them and what tools and approaches make them the best, most productive programmer they can be. And don't get hung up on doing a task the same way each time. Challenge yourself by find new ways of accomplishing the same task. In doing this, you might find you agree much more with the person that you thought you disagreed with on the onset.

[response]: http://carpeaqua.com/2014/05/09/why-you-should-use-interface-builder-with-auto-layout/
[noib]: http://www.thecave.com/2014/05/04/i-stopped-using-nibs-thanks-to-auto-layout/
[compositeview]: http://stackoverflow.com/a/13581816
[vc]: http://www.objc.io/issue-1/lighter-view-controllers.html
