---
title: "QNAP Online RAID 5 Migration"
date: 2013-04-07T21:48:00Z
lastmod: 2013-04-07T21:48:58Z
url: "/2013/04/qnap-online-raid-5-migration.html"
hero: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhKs9nt9hkTNKQtBJuahGuqOWOW54_bgDZl6BPNplXfQhx7eEHlnE9lh2BpgneiCbYNgDl6Lg5dx53ubbdMDpvE7nYN6m7nJk0eU1JPq5e1t_sJwBuivRRn0KzuAXO1xOjU5yae/s1600/Capture1.JPG"
author: "Andy Wingate"
---
Recently added two new physical drives into a QNAP NAS (TS-419P II) and performed online migration of the&nbsp;existing&nbsp;single drive to a 3 drive RAID 5 setup, here is how I got on.<br />
<br />
I shut down the NAS, although I later read this is unnecessary and the drives can be hot swapped, selected the previous drive from the list in RAID management in the admin pages. Clicked the MIGRATE button, selected the two new drives and chose RAID 5. Full documentation <a href="http://docs.qnap.com/nas/en/index.html?raid_management.htm" target="_blank">here</a>.<br />
<br />
The system warns that all services will be shut down and shows a % progress for the migration. This took about 12 hrs to get to 49% where it got stuck and without intervention aborted the migration and reverted &nbsp;back to the single drive setup.<br />
<br />
Second try, after googling&nbsp;my problem, this time I manually&nbsp;disabled&nbsp;all of the QPKG applications through the admin pages. Again took about 12 hrs to get to 49% where it stuck for a few hrs. Further reading on the forums mentions mySQL and JAVA as being two particular&nbsp;packages&nbsp;that might need a manual kill (SSH in and use the kill -9 command<pid>).&nbsp;</pid><br />
<br />
After Java was stopped the progress updated to 50% and the screen displayed the 3 drives as a RAID 5 array, the remainder of the migration took another 12 hrs to complete. Here is the item in the RAID&nbsp;management&nbsp;table.<br />
<br />


<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
