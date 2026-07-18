---
title: "Photo Station QNAP"
date: 2013-11-10T11:06:00Z
lastmod: 2014-05-06T22:28:29Z
url: "/2013/11/photo-station-qnap.html"
author: "Andy Wingate"
---
If after trying the in-built photo web service for a bit you give up on it. Which is inevitable as its terribly slow, using normal home broadband in any case. It can be a pain to then remove all the thumbs clogging up your photo archive. But this can be done simply via SSH just move all the contents of the .@__thumb folders created to a single folder, check your not deleting anything you dont want to then wax the lot.<br />
<br />
<pre># ipkg install findutils
</pre>
<pre></pre>
The QNAP standard find command doesn't support the '-exec' expression, which allows another function to be run on each file found. So you will need to run the above commant to install findutils<br />
<br />
<pre># findutils-find /parent_directory/*/.@__thumb/ -type f -name '*' -exec mv {} /thumbs_bin/. \;
</pre>
<pre></pre>
Using this will find all the files (-type f) that match * (-name '*') in all the .@__thumb folders in the&nbsp;sub-folders of the parent_directory/ and move each one to the /thumbs_bin folder.

<br />
<pre></pre>
<pre># rmdir ./*/.@__thumb
</pre>
<br />
This will clean up the directory structure and remove all the .@__thumb folders.<br />
<br />
<a href="http://www.linuxjournal.com/article/6060">http://www.linuxjournal.com/article/6060</a><br />
<a href="http://forum.qnap.com/viewtopic.php?f=35&amp;t=37341">http://forum.qnap.com/viewtopic.php?f=35&amp;t=37341</a><br />
<br />
Update: Photo Station is now usable! It creates the thumbs much quicker and web access us totally usable. Sharing also works well.
