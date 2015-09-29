---
layout: post
title: "Dispatch Async to Main Queue Doesn't Work With Modal Window on Mac OS X"
date: 2015-08-10 07:09:01 -0400
category: programming
tags: [os x, objective-c]
---
I've been working on a Mac app lately, and while some things are similar to iOS, something are definitely different. One thing that is different are modal windows and run loops. 

When you display a modal view on iOS you don't get a new run loop for the view, but when you display a modal window on OS X a new run loop is created for the window. This is not necessarily a big deal unless you have a habit of using [GCD][gcd] to dispatch work between background and main queues. Let me give a more specific example.

I display a modal view, or in the cause of OS X, a modal window. The current view is managed by a view controller. User input is captured, then a URL request is sent off to a server on the Internet. The view controller is then notified when the URL request completes. 

The typical pattern I follow for sending the request to the server and getting notified when done is to call a method that will dispatch the URL request to a background queue then dispatch to the main queue to call a block when complete. It looks something like this:

    - (void)sendSomething:(NSDictionary *)something completion:(void(^)(BOOL success, NSError *error))completion
    {
      NSParameterAssert(something);
      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Send something out over the Internet.
        ...

        // All done. Assume success and error are already set.
        dispatch_async(dispatch_get_main_queue(), ^{
          if (completion) {
            completion(success, error);
          }
        });
      });
    }

This is a simplified view of the pattern I often use. Call a method with a callback block. Perform some work on a background thread. When done, call the callback block on the main thread. 

This pattern has served me well on iOS, but it has issues on Mac OS X when displaying a modal window.

When you display a modal window with `+[NSApp runModalForWindow:]` a new run loop is created for the window[^1]. That might seem fine until you call `dispatch_async(dispatch_get_main_queue(), ^{})` from a background thread. The block that you are trying to execute in the main queue will never run. And in my case, the `completion` block is never called. This means my modal window never receives the notification that the URL request completed. (NOTE: Mike Ash [pointed out](#update2) that it's not the new run loop that causes the problem.)

So how did I work around this problem?

Instead of dispatching the `completion()` to the main queue, I call it directly from the background thread. In the completion block itself, I decide how to get the code should run in the main thread. If my window isn't modal, then I can use `dispatch_async(dispatch_get_main_queue(), ^{})`. But if my window is modal, which just happens to be the case for the app I'm working on, then I use `-performSelectorOnMainThread:withObject:waitUntilDone:`. So the code in my view controller looks something like this:

    - (void)someAction:(id)sender
    {
      SomeHelper *helper = [[SomeHelper alloc] init];
      __weak __typeof__(self) weakSelf = self;
      [helper sendSomething:someValues completion:^(BOOL success, NSError *error) {
        __typeof__(self) strongSelf = weakSelf;
        if (strongSelf == nil) return;
        
        // This window is running modally with its own run loop. Therefore,
        // we cannot dispatch to the main queue. Instead, we must go old
        // school can call a selector on the main thread. In other words,
        // dispatch_async(dispatch_get_main_queue(), ^{}); does not work
        // here.
        
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
        userInfo[@"success"] = @(success);
        if (error) userInfo[@"error"] = error;
        
        [strongSelf performSelectorOnMainThread:@selector(completeSendSomething:) withObject:userInfo waitUntilDone:NO];
      }];
    }

    - (void)completeSendSomething:(NSDictionary *)userInfo
    {
        ...
    }

This pattern change now has me re-thinking how I use certain patterns in my code, especially for code that I intend on sharing between the two platforms.

Update: I posted a [sample project][2] that illustrates the problem. In writing the sample app, I learned that the scenario that causes the problem is when the modal window is presented via a block that is dispatched asynchronously on the main queue.

<a name="update2"></a>Update 2: [Mike Ash][mikeash] pointed out that NSRunLoop is reentrant but GCD serial queues are not and this is the reason, not my theory of a different event loop, the block isn't executed. Mike said, "The main queue is already executing a block, and it won't execute a new one until that one is done. This is a subtle way in which dispatch on the main queue isn't the same as `performSelectorOnMainThread`."

Good to know and thanks, Mike, for explaining what is happening.

---

[^1]: From the [Apple documentation][github] for `+[NSApp runModalForWindow:]`: "This method runs a modal event loop for the specified window synchronously. It displays the specified window, makes it key, starts the run loop, and processes events for that window. (You do not need to show the window yourself.) While the app is in that loop, it does not respond to any other events (including mouse, keyboard, or window-close events) unless they are associated with the window. It also does not perform any tasks (such as firing timers) that are not associated with the modal run loop. In other words, this method consumes only enough CPU time to process events and dispatch them to the action methods associated with the modal window."

[gcd]: https://developer.apple.com/library/ios/documentation/Performance/Reference/GCD_libdispatch_Ref/
[2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSApplication_Class/index.html#//apple_ref/occ/instm/NSApplication/runModalForWindow:
[github]: https://github.com/kirbyt/MacModalDispatchAsyncProblem
[mikeash]: https://mikeash.com/pyblog/
