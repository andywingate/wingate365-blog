---
title: "New disk for existing VM"
date: 2018-02-18T12:08:00Z
lastmod: 2018-02-18T12:08:08Z
url: "/2018/02/new-disk-for-existing-vm.html"
author: "Andy Wingate"
---
<h3>
"Disk offline with error – the disk is offline because of a policy set by an administrator"</h3><br />
After adding a new hard drive to an existing VM, it will show as offline, this can be corrected using the steps below in the&nbsp;diskpart&nbsp;cmd prompt<br />
<pre>san policy=OnlineAll </pre>
This will result in the following message: Diskpart successfully changed the SAN policy for the current operating system.<br />
<pre>list disk</pre>
Check the number of any offline disks and select them<br />
<pre>select disk 1
attributes disk clear readonly
online disk</pre>
The disk will now be available in Disk Management.<br />
<br />
<a href="http://jeffwouters.nl/index.php/2011/06/disk-offline-with-error-the-disk-is-offline-because-of-a-policy-set-by-an-administrator/" target="_blank">Source</a>
