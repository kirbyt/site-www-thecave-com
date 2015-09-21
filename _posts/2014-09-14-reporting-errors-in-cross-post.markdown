---
layout: post
title: 'Reporting Errors in Cross Post'
category: programming
tags: [ios, cross post]
---
A friend sent me suggestions on handling error reporting for Cross Post. I decided write up my current thinking here to see if my approach makes sense. Besides, trying to explain it in a set of 140 character tweets is less than ideal.

The challenge I face is reporting errors, or any status reporting for that matter, that happen once the server takes over the process. A timeout error, for example, could occur while the server is uploading a photo to Twitter. At this point the server no longer has a connection to the app, so trickling the error up to the app is not an option.

One option is to let the server eat the error. I know of a few similar solutions that eat the error, and I stopped using those apps for that very reason. If I ask an app to post something to Facebook, and the post never appears, then I want to know why. Letting the server eat the error is not an option for Cross Post. But how does the Cross Post app learn about the error?

One option is to use push notifications. When an error occurs the server can notify the user via a push notification. But this isn't a trivial task to implement and it's a path I don't care to pursue unless absolutely necessary.

Another option, and the one I'm considering at the moment, is having the app include a unique identifier in the payload sent to the server. You can think of the identifier as a handle that the app can use to query to server for the status of the post.

If an error occurs on the server, the server will store the error with the identifier provided by the app as the primary key. The next time the app launches, it will check with the server to see if there were any errors. Once the app learns about the error, the server deletes the error from its data store.

This is a more reactive approach to reporting errors instead of a proactive approach, but it's a cleaner solution than going down the push notification route. Beside, push notifications are not guaranteed so this approach is as reliable if not more reliable.

There are problems with this approach. First starters, only the device that sent the post will know to check for the error. Say I send a new post to Facebook using my iPhone. The post fails to make its way to Facebook. I launch Cross Post on my iPad. The iPad does not know about the post sent from iPhone, so it does not know to check for an error.

Now there are ways around this new problem. I could ask each user for a unique identifier such as an email address or username, but that's another road I don't care to travel down. People have more than enough logins to remember without me asking them to setup yet another online account and log into Cross Post. Besides, Cross Post can use iCloud to sync the unique identifier for each post between devices. In fact, this is what I will likely do. Key-value syncing using iCloud has been reliable for some time now, so why take advantage of it.

The other problem with having the app check the server for error reports is that now the server must persist the error report. This means I need to have some type of data persistence store. I could use the file system on the server, but I've configured my server app to scale. This means a load balancer is in place and as traffic increases OpenShift will spawn new server instances. This means it is possible that the server that caught the error will not be the server that the app queries for error reports. So storing the error report on the server's file system is not an option. An additional server, aka a database server, is needed to persist the error reports.

Having an additional server for data persistence isn't a big deal for OpenShift, but it is just one more server that must always be available. And now the backend for Cross Post is starting to grow. A couple of weeks ago the entire Cross Post solution ran on an iOS device. Now the solution spans the device and a server environment, and next I have to throw in a database server just for error reporting!?

Having the database does seem a bit overkill at the moment, but there might be a need for a database for persistent storage down the road anyways. So it looks like I will be adding a MongoDB database to the mix very soon. That is unless someone has a better idea to share with me.

Update: I came up with a [third option][post] that is by far my favorite.

[post]: http://www.thecave.com/2014/09/15/reporting-errors-in-cross-post-part-2/
