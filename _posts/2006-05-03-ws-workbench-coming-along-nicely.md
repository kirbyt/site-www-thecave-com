---
layout: post
title: 'WS-Workbench Coming Along Nicely'
category: programming
tags: [white peak software, delphi]
---

[<img src="http://www.thecave.com/images/blogimages/swirl-20060503.gif" width="50%" border="1" align="left" />](http://www.thecave.com/images/blogimages/swirl-20060503.gif)
Work on [White Peak Software](http://www.whitepeaksoftware.com/)'s next product, WS-Workbench (also called Swirl internally) is coming along nicely as you can see from this screen shot.  The first beta should be ready soon.  Post a comment or send me an email if you are interested in beta testing WS-Workbench once it is ready.

A couple of big challenges still remain before the beta is ready.  For instance, reading the data types defined in XML Schema that represent the parameters for a web service call isn't as straight forward as I originally hoped.  This is due in part to the lack of a Delphi native SOM parser.  Well, that's not exactly true.

Delphi does have an undocumented [SOM parser](http://www.thecave.com/archive/2006/04/05/xml_schema_object_model_som_parser_for_delphi.aspx), but it depends on a registered XML DOM parser such as MSXML.  While it does work White Peak does strive to reduce dependences on certain types of 3rd party library such as MSXML.  This means writing my own SOM.  Luckily it will be a specialized SOM parser and not one intended for general purpose.
