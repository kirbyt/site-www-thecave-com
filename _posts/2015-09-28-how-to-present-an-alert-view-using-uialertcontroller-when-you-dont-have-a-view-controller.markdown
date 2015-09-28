---
layout: post
title: "How To Present An Alert View Using UIAlertController When You Don't Have A View Controller"
date: 2015-09-28 15:46:02 -0400
category: programming
tags: [ios, objective-c]
---
Over the summer I updated a number of apps to iOS 9. A common tasks for me was replacing the deprecated `UIAlertView` with new `UIAlertController` class. Generally this is easy to do, but there is one scenario that `UIAlertView` handles well that `UIAlertController` doesn't support at all: displaying an alert view from parts of your code without a reference to the current view controller, for instance, displaying an alert view from the app delegate. 

Trying to display an alert view using `UIAlertController` from a non-UI specific class such as the app delegate is a [common problem](http://stackoverflow.com/questions/26952061/present-uialertcontroller-from-appdelegate), and developers have found different [workarounds](http://stackoverflow.com/questions/26554894/how-to-present-uialertcontroller-when-not-in-a-view-controller). [One particular solution](http://stackoverflow.com/a/30941356) that caught my eye was this one from agilityvision, who writes:

> At WWDC I stopped in at one of the labs and asked an Apple Engineer this same question: "What was the best practice for displaying a UIAlertController?" And he said they had been getting this question a lot and we joked that they should have had a session on it. He said that internally Apple is creating a UIWindow with a transparent UIViewController and then presenting the UIAlertController on it.

This got me thinking about how I would solve the problem for apps I work on. Liking the approach mentioned by the Apple Engineer, I decided to give that a try. But unlike some of the other solutions that use a category, I decided to create a new class, `WPSAlertController`, that is a subclass of `UIAlertController`, and provide additional convenience methods making it possible to display an alert view with a single call...like this:

    NSString *title = ...
    NSString *message = ...
    [WPSAlertController presentOkayAlertWithTitle:title message:message];

Or display the `localizedDescription` from an `NSError` object:

    [WPSAlertController presentOkayAlertWithError:error];

And of course, since `WPSAlertController` is a subclass of `UIAlertController`, you can create your alert the same way as you do using `UIAlertController`. The only difference is you call `show` to present the alert when you don't have a view controller. For example:

    NSString *title = ...
    NSString *message = ...
    WPSAlertController *alertController = [WPSAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      // Your code.
    }]];

    [alertController show];

You can grab the [source code for `WPSAlertController`](https://github.com/kirbyt/WPSKit/blob/master/WPSKit/UIKit/WPSAlertController.m) from my github repository and include it in your project, or use the entire [WPSKit.framework](https://github.com/kirbyt/WPSKit) in your project if you want to use `WPSAlertController` plus other handy classes that I use when creating iOS apps.
