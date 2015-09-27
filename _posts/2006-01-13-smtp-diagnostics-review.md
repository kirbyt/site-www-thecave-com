---
layout: post
title: 'SMTP Diagnostics Review'
category: business
tags: [white peak software]
---

[Heinz Tschabitscher](http://email.about.com/mbiopage.htm) posted [a review about SMTP Diagnostics](http://email.about.com/od/emailbehindthescenes/gr/smtp_diagnostic.htm) on About Email.  I have to say I agree with Heinz when he says "SMTP Diagnostics does not help you understand or fix errors."  It is true [SMTP Diagnostics will help you understand what is happening assuming you understand the protocol message](http://www.smtpdiagnostics.com/), but the tool would be more useful if it explained things in plain English, which I believe is Heinz's point.

It's been on my feature list for a while now to change this.  SMTP Diagnostics should provide more help and understanding in plain English.  The challenge has been to correctly interpret the error message.  For example, I recently was troubleshooting an email problem for a web application.  In my tests using SMTP Diagnostics I enabled SMTP Authentication and provided the correct credentials for the mail server.  For the From and To I used the same email address.  The sender was checked and determined to be okay but the recipient check failed with "550 no such user here", and I knew for a fact that the email address was valid.

To SMTP Diagnostics the problem is clear.  The recipient address is invalid, or at least that is what it is told by the mail server.  However, the address is very much valid and the problem is actually caused by a check on the outgoing mail server that does not allow a message to be sent from an address to the same address where the domain name in the email address is different than the domain name for the outgoing mail server.  In other words, using this particular mail server you cannot send an email to validaddress@domain.com from validaddress@domain.com from a mail server at the domain anotherdomain.com.

The reason for the setting is clear.  The setting is used to help prevent spam mail.  However, it is impossible for SMTP Diagnostics to properly interpret this error into plain English that accurately describes the problem.

Another test on the same mail server further illustrates why it is hard to correctly interpret the actual error.  The same error message, "550 no such user here" is received for a valid recipient address when the From address used is not a valid maildrop but of the same domain as the outgoing mail server.  In other words, the mail server for anotherdomain.com will report "550 no such user here" for the recipient validaddress@domain.com when the From address no-reply@anotherdomain.com is used and no-reply is not a valid maildrop.

These are two very different scenarios where the mail server reports the same error message, and both result from server settings used to prevent sending spam.

Personally I'm glad mail servers are incorporating settings that help prevent spam mail from being sent.  But at the same time it makes it more difficult to determine the actual cause of the problem when sending outgoing emails.  Still, I plan to take the feedback from Heinz's review and improve on SMTP Diagnostics for the next release.
