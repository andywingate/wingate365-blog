---
title: "Cloud Backup on QNAP NAS"
date: 2013-03-28T16:26:00Z
lastmod: 2013-03-28T16:27:55Z
url: "/2013/03/cloud-backup-on-qnap-nas.html"
author: "Andy Wingate"
---
After finding Symform a bit too slow for my needs I decided to move to Amazon S3 to give them a go and also to try out some more simple scripting.<br />
<div>
<br /></div>
<div>
QNAP does have a web interface for backing up to S3, but it is a bit buggy and did not work for me. Looking in the forums people complain of issues with files that are too big or trying to copy too many files. Anyhow this is where s3cmd comes in.&nbsp;</div>
<div>
<br /></div>
<div>
Written in python s3cmd is a command line tool that can be used to upload / sync files to S3.</div>
<div>
<br />
Installing this tool on a QNAP is covered by<br />
<br /></div>
<div>
<a href="http://bit.ly/Zuuhou">http://bit.ly/Zuuhou</a> summarised by natebeaty, <a href="http://bit.ly/Z2Lzch">http://bit.ly/Z2Lzch</a></div>
<div>
<br /></div>
<div>
<div>
1. Install Python from the QNAP admin QPKG Center</div>
<div>
2. Download latest s3cmd and transfer to a QNAP share directory</div>
<div>
3. SSH in to your QNAP box</div>
<div>
4. python s3cmd --configure</div>
<div>
5. write shell scripts, add to crontab, etc<br />
<br />
The original guide mentions that the config file is deleted on reboot, so need to check that out<br />
<br />
scrip file; with your backup its important to know the system is working and your files are being backed up. So a log file is essential, and why not have this&nbsp;notified&nbsp;by email as well. all this can be&nbsp;achieved&nbsp;with&nbsp;scripts.<br />
<br />
<br /></div>
</div>
