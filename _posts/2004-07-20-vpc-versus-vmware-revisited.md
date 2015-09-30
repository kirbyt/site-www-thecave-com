---
layout: post
title: 'VPC versus VMWare Revisited'
category: uncategorized
---

After playing with Virtual PC off and on for a couple of days, I decided to return to VMWare. There are two main reasons why I decided to go with VMWare over VPC.
<br />
<br /> Reason one: Network bridging. Simply put, I could not get bridging to work with VPC but it worked flawlessly with VMWare. Overall, I think VMWare does a better job at networking. I especially like having control of the DHPC service settings.
<br />
<br /> Reason two: UNC support to the host. This feature seems to only exist in VMWare. \\.host\Shared Folders\ gives you access to VMWare shares defined in the host OS. I could not find an equivalent feature in VPC.
<br />
