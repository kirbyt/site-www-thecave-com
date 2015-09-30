---
layout: post
title: '.NET to Java and Back'
category: uncategorized
---

Whew! What a day.  I lost all my demo code for next week but I finally got it all re-created.  Definitely some cool things happening in Java with regard to Web services.  My favorite tool is Wsdl2Java.  This generates a set of proxy classes for consuming a Web service and is a great time saver.  Java2Wsdl on the other hand is a pain in the ass.  I never got it working, but luckily Axis will auto-generate a WSDL for your service using a ?WSDL parameter on a HTTP GET request.
<br />
<br />I finally have a demo environment setup that illustrates inteorp between .NET and Java 2 Platforms, and I have WS-Security working between Microsoft's WSE and IBM's WSTK.  I must say that WSKT is poorly documented at the moment, which was a pain.  Oh, and it seems that WSTK does not like the MustUnderstand attribute.  Be sure to set that puppy to false if you are digitally signing a service request where the producer is using WSTK.
<br />
<br />Overall, cool stuff.  And I am glad I finally have a decent work environment for showing off the various technologies.
