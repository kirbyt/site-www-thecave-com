---
layout: post
title: 'SnowReport Service Passes WS-I Test'
category: uncategorized
---

[WS-I.org](http://www.ws-i.org/) recently published a set of test tools for XML Web services.  These tools test for conformance with the WS-I's Basic Profile.  For fun, I decided to test my Snow Report Service.

Configuration of the Analyzer is straight forward.  Starting with the sample analyzerConfig.xml, I commented out the  and created a new , pointing the references to my [Snow Report](http://www.thecave.com/ws/snowreport.wsdl) service.  I ran the analyzer test and my service failed the tests.

Analyzer produces a report of the test in XML, which can be viewed in a user friendly format using your browser.  I quickly saw from the report that the test could not find my  that I have declared in a separate schema file that is imported into the WSDL.  And sure enough, there was a problem.  I had forgotten to include the namespace reference on the  element in my WSDL document.  A simple change to `<s>` and all was well.  My service passes the WS-I Basic Profile test.

In theory, my service should interop with other platforms.  I have had no problem consuming the service from Java.  However, WSDL2Java from Axis still fails.  Apparently it does not support the `</s>` element.  The only way I can generate the Java based proxy classes using WSDL2Java is to include the types schema in the WSDL document as a single file.  Hopefully that will be fix some day.
