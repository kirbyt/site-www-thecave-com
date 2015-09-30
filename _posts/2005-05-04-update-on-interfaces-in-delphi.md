---
layout: post
title: 'Update on Interfaces in Delphi'
category: uncategorized
---

After taking a break from the laptop I was able to get a much better handle on interfaces in Delphi.  And I was able to implement the design I wanted.  It's not as slick as in C# but it works.  And the code is readable, which is important to me.<br /><br />I was returning a TObject when I should have been returning IInterface.  After seeing the code it makes sense to me why my use of TObject was causing problems, and why I was trying to cast an interface from an object, which now I see was not needed.
