---
title: "NTFS partitions and ntfs-config"
date: 2009-08-01T18:51:00Z
lastmod: 2009-10-31T12:31:37Z
url: "/2009/08/ntfs-partitions-and-ntfs-config.html"
tags: ["ubuntu"]
author: "Andy Wingate"
---
Using windows partitions in Ubuntu is no problem, however if you need to rely on a stable mount point you will want to add ntfs-config.<br /><pre><br />$ sudo apt-get install ntft-config && sudo ntfs-config<br /></pre><br />If while playing around with this you lose the partitions and then can't see them listed any more in the "New Partirions Found" popup when you load ntfs-tools you will need to clean your /etc/fstab file.<br /><pre><br />$ sudo gedit /etc/fstab<br /></pre><br />Be careful to only remove the windows mounts, these will have "ntfs-3g" written in the line.
