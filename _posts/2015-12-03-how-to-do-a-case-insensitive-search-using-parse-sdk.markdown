---
layout: post
title: "How To Do A Case Insensitive Search Using Parse SDK"
date: 2015-12-03 10:16:56 -0500
category: programming
tags: [ios, objective-c, parse.com]
---
I recently came across this question about searching using the Parse SDK for iOS. Simon asks:

> What would be the best practice for search in a large user database and return e..g 10 first results based on name or email?

I've been doing a lot with [Parse][1] recently, from building a new iOS app to adding a license key [lookup][2] feature to my company website, and the reason Simon's question caught my attention was because I asked myself a similar question the other day when working on the license key lookup feature.

The license key data comes from my order processing provider. A customer who has lost they license key can visit my website and retrieve for their license information by entering their email address. The problem, however, is that the person might enter the email address using a different case than used when the order was placed. And Parse does not have a way to perform a case insensitive search on string values.

So how do you get around this problem? And as Simon asks, what are some best practices for searching data in Parse?

## Force Strings To All Lowercase

For starters, you should force all string values that can be searched to lower case, and do the same with the search string entered by the user. This produces the same effect as performing a case insensitive search while getting around the fact that Parse, as well as other types of data stores, doesn't support case insensitive searches.

While storing the string value in all lowercase works fine for some value types, such as an email address, it's not ideal for other value types. A person's first and last names are not something you want to store in lowercase only. After all, you will likely display the person's name on a profile screen or in an email message, and you want to display the name exactly as entered by the person.

So how do you search by data such as a first or last name without the ability to perform a case insensitive search? Simple. You create a search field for each.

## Define Search Fields

Let's say your Parse class contains three properties, `firstName`, `lastName`, and `email`. All three contain data entered by a person. When you add a new instance of this class to Parse containing the data entered by the person, you can force the value for `email` to be lowercase (e.g., `-[NSString lowercaseString]` if you're using Objective-C). However, you don't want to do this for `firstName` and `lastName`. Instead, you want to use search fields for those two properties.

To search on `firstName` and `lastName`, add two additional properties to your class, `firstNameSearch` and `lastNameSearch`. Then, just as you did with `email`, force the values for `firstNameSearch` and `lastNameSearch` to be all lowercase before saving the data to Parse. Now when you want to perform a search, use the search properties `firstNameSearch` and `lastNameSearch` instead of the other two.

Congratulations! You've achieved case insensitive searching in an environment that does not support it.

[1]: https://www.parse.com
[2]: http://www.whitepeaksoftware.com/licenselookup
