---
title: "Custom Keyboard Shortcuts and Smart Tag Lists for Word 2007"
date: 2009-12-23T19:52:00Z
lastmod: 2009-12-23T20:54:44Z
url: "/2009/12/handy-word-stuff.html"
tags: ["word"]
author: "Andy Wingate"
---
Here is the macro code swap "Final" and "Final Showing Markup" view. Once saved as a macro it's a simple task to assign this to a keyboard short-cut.. <br />
<pre>Sub finalview()
With ActiveWindow.View
.ShowInsertionsAndDeletions = Not .ShowInsertionsAndDeletions
End With
End Sub&nbsp;</pre><pre>&nbsp; 
</pre>I also wanted to make a custom 'Smart Tag List' the easiest way to do this was to simply download this 'Cities Smart Tag List' and edit the entries.   This <a href="http://support.microsoft.com/kb/287698/en-us">post</a> on the MS web page was pretty hand. I simply replaced the terms after:  <br />
<pre>&lt;FL:termlist&gt;</pre>with my own CSV data. In this case a list of UniProt terms to easily identify the controlled vocabulary in the text of reports.   I did also start to play around with the naming and URL parts of the XML, however after several promising edits the whole smart tag list disappeared from the options pane in Word. So I gave up and reverted to a version where I had only changed the main name and the term list as all I really wanted was the in text underlining of the terms.
