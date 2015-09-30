---
layout: post
title: 'BrowserCap for FireFox'
category: uncategorized
---

Something I didn't realize until today is that ASP.NET does not generate proper HTML 4.0-compliant code for certain modern, non-Microsoft browsers such as FireFox and Safari.  For instance setting the width property of an  will not render the style attribute needed to set the control width in FireFox.  The problem is easily fixed by including the  section in your web.config or machine.config with the appropriate user agent pattern for the particular browser or browsers.<br /><br />The guys at <a href="http://www.4guysfromrolla.com/">4GuysFromRolla.com</a> have a nice <a href="http://aspnet.4guysfromrolla.com/articles/050504-1.aspx">article</a> explaining this in more details.  The article also includes a sample  section that you can copy|paste into your .config file that supports GECKO (Netscape 6.0+, Mozilla/Firefox, ...) and AppleWebKit (Safari, ...) based browsers.
