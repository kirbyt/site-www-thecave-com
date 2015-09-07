---
layout: post
title: "Custom B2b Apps And The Volum Purchase Program For iOS"
date: 2015-08-20 09:33:06 -0400
categories: 
    - apps
    - ios
---
This week I had my first custom B2B app approved by Apple. Most iOS developers will likely think, "Big deal. So you wrote a business app and put it in the App Store." But what most don't know is that a custom B2B app is a special type of app that is distributed privately through the App Store to specific business customers, and the reason most developers don't know this is because there is very little information about distributing custom B2B apps.

Apple provides some information about [developing custom B2B apps][1] and there is even a video about [building and distributing custom B2B apps for iOS][2] from the 2012 WWDC. But it seems many iOS developers don't know about this distribution option or, as in my case, are aware of it but don't fully understand it. This changed for me this summer when I purposed to a customer we use the [Volume Purchase Program for Business][3] (VPP) program to distribute a custom built B2B app.

I didn't know much about the various programs and how it worked, but based on what I knew I felt it was the best option for us to distribute a set of apps built specifically for certain companies. Prior to the VPP, the only option for us was to ask each company to enroll in the Apple Developer Program with an enterprise account. We could then use their enterprise distribution certificate and provisioning profile to distribute the custom built app to their employees. But this approach is riddled with challenges. The Apple Developer Program, for example, is confusing to non-developers and non-software shops. And justifying the additional program cost is sometimes difficult. But even more difficult is explaining how to generate certificates, create provisioning profiles, and exporting and sharing those things (and more) so app builds can be made on their behalf.

###

# Outline

- What is a custom B2B app.
- Deployment options
- VPP enrollment
- D-U-N-S and how to get a D-U-N-S
- How it is different than releasing through the App Store
- App Updates
- How apps are purchased
- How to install the app.
- Pricing tiers

D-U-N-S: https://iupdate.dnb.com/iUpdate/companylookup.htm

###


[1]: https://developer.apple.com/programs/volume/b2b/
[2]: https://developer.apple.com/videos/wwdc/2012/?id=311
[3]: http://www.apple.com/business/vpp/
