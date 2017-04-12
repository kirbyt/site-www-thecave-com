---
layout: post
title: "Mastodon and thecave.social"
date: 2017-04-12 14:07:57 -0400
category: personal
tags: [mastodon, microblogging, open source, social]
---
I first heard about [Mastodon](https://github.com/tootsuite/mastodon) last week while lurking on Twitter. For those who don't know, Mastodon is a free, open source, decentralized social network with instances run mostly by individuals. 

As I read more about Mastodon, I became more intrigued. It didn't take long before I registered the domain name [thecave.social](https://thecave.social/). The idea of hosting a Mastodon instance, even if just for myself, piqued the geek in me. The realist in me said I don't have the extra time to take on such an endeavor. Still, I wanted to learn more about Mastodon, and what better way than hosting an instance.

First, I looked at hosting my Mastodon instance on [OpenShift Online](https://www.openshift.com). I'm a long time fan of OpenShift, but it's been a while since I played on it. Turns out, a new OpenShift Online supporting Docker containers is in the works. Right now, the new OpenShift Online is in Developer Preview, and accounts are active for only 30 days. The time limit doesn't work for me because I can see myself hosting my Mastodon instance for more than a month. So OpenShift is not an option for me at the moment.

I looked at hosting the instance somewhere else, like Digital Ocean, but I decided I don't have the time to do all the extra work. Thankfully, there is an experimental Heroku install option for Mastodon, and given that I already have some basic experience with [Heroku](https://www.heroku.com), I decided it is the way to go for me.

After deciding where to host my instance, I did a "test" install. I created a single dyno and played around with Mastodon. Liking what I saw, I scrapped the dyno and created another one, this time for thecave.social. 

It took me about four hours total to get my Mastodon instance setup and configured the way I want it. A more experienced admin could have probably done the work in half the time. 

I'm using [Mailgun](https://www.mailgun.com) for emails and [S3](https://aws.amazon.com/s3/) for file storage. And now that Heroku has an automatic certificate manager that uses [Let's Encrypt](https://letsencrypt.org), acquiring and installing an SSL/TLS certificate for the site was a snap. I'm continually amazed at how easy it is to host a server these days thanks to services like Mailgun, S3, and Heroku. 

[thecave.social](https://thecave.social/) has been live for a few days now, and everything is running smoothly. Of course, I am the only user on this instance, and I do not support the streaming API yet. 

I've even made a few toots on Mastodon, which is impressive for me given that I don't spend a lot of time on social networks these days. (I've checked Facebook once in the last 28 days, and I lurk on Twitter only once or twice a month.) Still, I can see myself getting into Mastodon because it represents what I like about social networks, and it doesn't have the crap that has turned me off of social networks in general, ads and political rants being the top offenders for me.

Currently, registration on thecave.social is closed, though I'm considering opening it up to family and friends soon. Let me know if you are interested in having an account so I can tell you when registration is open. I can't guarantee how long I will keep the server up and running, but I don't see myself shutting it down anytime soon.

Also, I'm not looking to grow a big community with hundreds or even thousands of users. Instead, I want a place that is my own just like I have with my personal email address. Some family and friends have thecave.com email address, and I see the same thing happening with thecave.social.

For those of you on other Mastodon instances, feel free to follow me at [@kirby@thecave.social](https://thecave.social/@kirby).