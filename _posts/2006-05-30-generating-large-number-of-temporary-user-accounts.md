---
layout: post
title: 'Generating Large Number of Temporary User Accounts'
category: programming
tags: [delphi]
---

A customer recently asked White Peak Software to [design and implement custom software](http://www.whitepeaksoftware.com/) for generating large batches of temporary user accounts.  The purpose of these temporary user accounts is to market a subscription based web site in much the same way AOL used to market its services.  Here's how it works.

A large number of temporary user accounts, say 100,000 to 1,000,000 accounts per batch, would be generated and handed out to potential subscribers.  When the credentials to a temporary account are first used the user is guided through a set of web pages that setup a real user account and trial subscription.  Different business models are supported for the trial subscription such as 30-day trial or usage count.

As I was designing the system my first concern was storing millions of records in the database to represent temporary user accounts.  I was worried that it would take too much time to generate batches of 1 million user accounts and store them in the database, and I didn't like the idea of storing this much data when initially the majority of the temporary user accounts will - most likely - never be used.  So I set off to find a way, or an algorithm if you will, that would allow the system to generate a unique set of credentials for a temporary user account that did not require storage.  In other words, I needed an algorithm that is used to generate the credentials and can be re-applied during authentication to determine of validity of the credentials.  This felt similar to public private key encryption, which ultimately led me to the final design.

In the final design a private key is used that is known only to the system.  A unique private key is used for every batch of accounts generated where each batch represents a marketing campaign.  A random number generator (RNG) is used to generate a username unique to the batch.  The combination of the private key and the username is used to generate a [MD5](http://en.wikipedia.org/wiki/Md5) token and a random password is generated based on the bytes that makeup the MD5 token.

The beauty of this design is that the same algorithm can be used to authenticate the credentials for the temporary account.  An individual comes to the web site and uses the temporary account credentials to sign in.  The username is combined with the private key of every active marketing campaign to create the MD5 token, which is used to generate the password.  The generated password is compared to the password entered by the user.  If the passwords match, the credentials are authenticated otherwise the credentials are invalid.

[Delphi](http://www.borland.com/delphi) was used for the implementation of this design.  A Win32 COM component was implemented to provide authentication of the temporary credentials from the Classic ASP application.  A .NET version was also implemented \[using Delphi.NET\] but is not used at this time.

To generate the large number of users, a Delphi Win32 desktop application was written.  This proved to be a fast way to generate batches.  The program can generate a batch of 1 million accounts in under 2 and half minutes on a 2 year old laptop (Pentium M 1.6GHz with 512MB of RAM).  And the batch can be saved to an XML or CSV file.

The customer is extremely happy with the implementation, and I'm proud of the end result.  The only issue I have with the design is that during authentication the username is checked against each active marketing campaign.  This will cause a performance problem in a scenario with a large number of active campaigns (i.e., 100,000 or more), but this scenario is unrealistic for the customer.  It is unlikely that the number of active campaigns will ever exceeded 100 so the issue is not really an issue.
