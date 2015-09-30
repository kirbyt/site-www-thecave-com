---
layout: post
title: 'Change ExpressScheduler Labels'
category: uncategorized
---

Looking to change the label caption in the DevExpress ExpressScheduler?  It is as simple as setting the resource string for the label caption.  Here's the code snippet and a screen shot of the changed label.<br /><pre><br />// Delphi<br />uses<br />  cxClasses,<br />  cxSchedulerStrs;<br /><br />procedure TForm1.FormCreate(Sender: TObject);<br />begin<br />  cxSetResourceString(sEventLabelCaptions[3],'Money Maker');<br />end;<br /></pre><br /><a href="http://www.thecave.com/images/blogimages/schedulerlabel.jpg"><img src="http://www.thecave.com/images/blogimages/schedulerlabel.jpg" border="0" width="389" height="273" /></a><br />Click image to enlarge.
