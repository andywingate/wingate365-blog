---
title: "SVN / Subversion / Source Control "
date: 2013-07-19T19:38:00Z
lastmod: 2013-08-03T05:45:11Z
url: "/2013/07/snv-subversion-source-control.html"
tags: ["ssrs", "networking", "source control", "simple dev"]
author: "Andy Wingate"
---
Quick 'what I did' to setup Subversion this week to deal with SSRS projects and reports.<br />
<br />
Installed the standard edition of VisualSVN Server<br />
<a href="http://www.visualsvn.com/server/download/?">http://www.visualsvn.com/server/download/</a><br />
<br />
Installed TortoiseSVN on users machines<br />
<a href="http://tortoisesvn.net/downloads.html">http://tortoisesvn.net/downloads.html</a><br />
<br />
The setup on the server was very easy, added users via the management interface, set the port and made sure the firewall was going to allow the connections. Created a couple of repos for the various project files.<br />
<br />
On local PC checked-out the repo folder to a local drive folder and added the project files, simply right click to commit the files to the repo - marking all the files to be added.<br />
<br />
Logging all the commits makes it very easy to roll back and check on what activity is going on. Clearly it makes sense to split out as best you can the different projects into . I did notice it's worth it to un-version the user file that each project creates by default.<br />
<br />
Next thing to try is the VisualSVN plugin for visual studio which requires TortoiseSVN to work. And read the rest of the manual as TortoiseSVN politely recommends...<br />
<br />
Edit: Now also added the Visual Studio plugin from VisualSVN, which is fantastic and very straight forward. Do all your commits, check the logs etc from within Visual Studio.

