---
layout: post
title: 'Cross Posting to App.net, Facebook, and Twitter'
category: business
tags: [ios, white peak software, cross post, social]
---
Last year my wife told me more family and friends would "like" my photos on Facebook if I posted the them directly to Facebook. At the time I was using [ifttt][ifttt] to selectively cross post to App.net and Facebook. This meant my photos on Facebook were actually links to the App.net, which is where the photos were being stored, and this required my Facebook followers to tap the link to see the photos. Not the best experience for my followers.

I decided to test my wife's theory by posting photos directly to Facebook. Turns out she was right. I started getting more likes. Not only that, I found that family and friends posted more comments when I posted the photos directly. My wife was right. Posting photos directly to the social site is the best experience for followers and the best to become more engaged with your followers.

Now I could have setup an ifttt recipe that cross posted my Facebook photos to App.net, but that means my followers on App.net would have the less than ideal experience reading my posts and viewing my photos. So I started down the path of exploring different options for cross posting between different social networks.

After exploring options for nearly six months, I learned there is no single solution that will cross post to different social networks while giving the followers on each network the best viewing experience. So I set out to write my own app.

I quickly learned why no cross post solution that posts natively to each social network existed. It's hard, and in the case of Facebook, nearly impossible to make the post look as if it were posted from the official app. But I figured it out and for the past few months I have been making posts using Cross Post.

Cross Post is the app I've been working on for the last few months. I've also been using it almost daily for months. The app was ready for public release back in August, but I decided to wait until the iOS 8 release. The primary reason for this is to avoid annoying iPhone 4 users. iPhone 4 cannot run iOS 8, and I had planned to drop support for iOS 7 the moment iOS 8 is released. So I decided to delay the release of Cross Post.

The delayed release gave me time to work on adding some new iOS 8 only features. One feature in particular that I'm very excited about is the share extension. This feature makes it possible for a person to cross post to different social networks from other apps running on their iPhone or iPad. This feature alone makes Cross Post much more useful than I ever imagined 6 months ago.

When I started learning the ins and outs of share extensions I thought to myself, "This will be a snap." But as I got deeper into the code I realized Cross Post has one major issue that makes the Cross Post share extension suck. It takes Cross Post too damn long to post photos to multiple social sites.

Consider the scenario where you want to post 4 photos to App.net, Facebook, and Twitter. Each photo must be uploaded to each network. That means 12 different uploads, which is not speedy. This performance problem is acceptable in the Cross Post app because it performs the uploads even when the app is no longer active. A share extension, on the other hand, should return almost immediately. It should not, or have to, wait for the uploads to complete.

Extensions that need to upload data should do so using a background `NSURLSession`. Unfortunately this is not an option for Cross Post because it uses the Facebook SDK to post to Facebook and `SLRequest` to post to Twitter. Cross Post does use `NSURLSession` to post to App.net, but I want to be able to post to Facebook and Twitter via the share extension as well. So I needed to come up with a better way to post status updates and photos across different social networks.

To solve this problem I decided to create a Cross Post server. I was trying to avoid having a server for Cross Post, but it's unavoidable if I want to provide the best user experience. With the server in place Cross Post can upload the post and photos once and let the server handle uploading the content to the selected networks. Best of all, the upload from the app can be accomplished using a single `NSURLSession` request, and it can be performed in a background session. This means the Cross Post share extension can return almost immediately. It also means that Cross Post now only needs to make one HTTP request whereas previously it had to make numerous requests. For instance, the previous scenario of posting 4 photos to 3 different social sites required 15 HTTP requests. Now Cross Post app accomplishes the same thing using a single HTTP request[^onerequest], and the Cross Post server handles making all the other requests on behalf of the app.

This performance boost does have some disadvantages. First and foremost, I'm now responsible for keeping the server environment up and running. But thanks to [OpenShift][openshift], I'm not too worried about that.

Another disadvantage is that reporting errors back to the iOS app is going to be more challenging. Cross Post and the share extension sends off the request to the server. Once the server receives the payload the HTTP connection ends. The server, however, continues working by posting the payload to the selected social sites. If there is an error posting to, say, Twitter, there is no way for the server to tell the Cross Post app because that connection no longer exist. I have some ideas on how to solve this problem, but it's not going to happen in the first release.

Still, the improved user experience outweighs the disadvantages of using a server. And I have to admit, I'm enjoying getting back into server-side programming. So much as changed, for the better, over the years.

[ifttt]: https://ifttt.com

[openshift]: https://www.openshift.com

[^onerequest]: I was able to reducing the number of calls to the server down to one by packaging the post and photos into a single .zip file, which is sent to the server.
