---
title: "Home and Cloud Storage"
date: 2012-12-09T19:12:00Z
lastmod: 2012-12-21T20:13:19Z
url: "/2012/12/home-and-cloud-storage.html"
tags: ["qnap", "cloud-backup"]
author: "Andy Wingate"
---
With the recent death of an HHD in my space PC I decided it was time to sort out my home storage of irreplaceable data (photos and documents) and my home media setup. <br />
<br />
<h4>
Old Setup</h4>
Storage: An old Windows box, 2x200GB HHD, Cloud Backup via <a href="http://mozy.co.uk/" target="_blank">Mozy</a>, wired to ethernet<br />
Media Player: <a href="http://xbmc.org/" target="_blank">XBMC</a> running on an XBOX, wired to ethernet, SCART to old TV<br />
Music Player: Old windows netbook, sitting on top of the amp; WiFi to ethernet, wired to amp<br />
<br />
The older of the two disks gave out on the&nbsp;windows&nbsp;box and I lost a pile of downloaded media plus many old digital photos. The photos at least were recoverable from Mozy, best ~£50 quid I spent that year.<br />
<br />
<h4>
New Setup</h4>
Storage: <a href="http://www.qnap.com/en/index.php?lang=en&amp;sn=822&amp;c=351&amp;sc=514&amp;t=522&amp;n=3418" target="_blank">QNAP TS-419P</a>, 1x3TB HHD, Cloud Backup via Symform<br />
Media Player: <a href="http://www.twonky.com/" target="_blank">Twonky Media</a> Server. Wired to ethernet. New TV (Samsung SMART) also wired to the ethernet via a gigabit switch.<br />
Music Player: Same as before<br />
<br />
QNAP is a network attached storage device (NAS) it's basically a box with space for 4 HHDs and a linux&nbsp;operating&nbsp;system to run everything. I will add 3 more drives in due course, when I need the space, also by staggering the purchase/installation disks they wont all fall out of warranty at the same time.<br />
<br />
I no longer needed the old XBOX/XMBC as the video (and photos) now streams directly from the NAS over the ethernet to the TV via the DLNA service Twonky Media Server. While this was not pre-loaded on the QNAP it was a simple click of a button to install it from the QNAP web admin pages. The XBMC file browser <i>is</i> more&nbsp;flexible&nbsp;than&nbsp;Samsung's&nbsp;interface&nbsp;on the TV and with Twonky you lose the ability to 'mark' a file watched or resume from where you stopped, but its small price to pay.<br />
<br />
<h4>
Local Storage Redundancy&nbsp;</h4>
I plan to use the following <a href="http://en.wikipedia.org/wiki/RAID" target="_blank">RAID</a> set-up as I fill up the NAS box<br />
<br />
1x3TB: RAID 0,&nbsp;Available&nbsp;Storage 3TB, Fault Tolerance: None  [current setup]<br />
2x3TB: RAID 1,&nbsp;Available&nbsp;Storage&nbsp;3TB, Fault Tolerance: 1 disk<br />
3x3TB: RAID 5,&nbsp;Available&nbsp;Storage&nbsp;6TB, Fault Tolerance: 1 disk<br />
4x3TB: RAID 5,&nbsp;Available&nbsp;Storage&nbsp;9TB, Fault Tolerance: 1 disk<br />
<br />
I am (and plan to continue) using <a href="http://www.wdc.com/en/products/products.aspx?id=810" target="_blank">WD RED</a>&nbsp;drives designed for NAS devices.<br />
<br />
Once I get the second drive installed (in a ~years time) I will also have local redundancy on all the data which means I will only have to reply on the cloud backup if there is a biblical level disaster (fire/ flood/ locusts/ angel of death etc) and all the disks in the NAS die at once.<br />
<br />
<h4>
Cloud Backup</h4>
I decided to move away from Mozy, mainly because it's not supported by QNAP! these were my alternatives; <a href="http://aws.amazon.com/s3/" target="_blank">Amazon S3</a>, <a href="http://home.elephantdrive.com/" target="_blank">ElephantDrive</a>&nbsp;and <a href="http://www.symform.com/" target="_blank">Symform</a>.<br />
<br />
Of these I chose Symform; they offers unlimited free cloud storage if you contribute spare empty space from your system (at a ratio of 'your data : contributed space' = 1:2). On the flip side its only a simple data mirror, no versioning or backup sets; but for my needs this is just fine.<br />
<br />
The upload over my ADSL connection is a bit on the slow side, but it's getting there and soon my ~100Gb of photos and docs will be safely mirrored. To get the 100Gb for free I had to 'give up' 200Gb of space ~ 7% of my 3TB drive, not a bad trade.<br />
<br />
<h4>
QPKG (QNAP apps)</h4>
As QNAP is running on an Open Source OS there is a wide range of free applications that it can run/host; transmission, wordpress, FTP, SSH, webserver, VPN, LDAP, syslog, iTunes server, mySQL to name but a few. It comes pre-loaded with all the basics and though the web admin interface you can install more. Even more than that if you are prepared to SSH in and use an 'apt-get' type application named ipkg (currently 1329 packages listed).<br />
<br />
<h4>
Other Handy Apps</h4>
There are a variety of handy iOS apps that I use to control the media at home.<br />
<ul>
<li><a href="https://itunes.apple.com/us/app/twonky-beam/id445754456?mt=8" target="_blank">Twonky Beam</a>; this allows me to browse my NAS folders and choose what file to play on the TV, it also allows browsing on the web for any videos (eg youtube etc) and 'beams' them onto the telly. Very neat.&nbsp;</li>
<li><a href="https://itunes.apple.com/gb/app/wmote-remote-controller-for/id377215263?mt=8" target="_blank">Wmote</a>: remote control for Winamp; which is running on the netbook&nbsp;</li>
<li><a href="http://remoteless.no/" target="_blank">Remoteless</a>: remote control for Spotify; also running on the netbook, for those times when mine own music collection is lacking (I think I stopped&nbsp;acquiring mp3's when I left university)&nbsp;</li>
<li><a href="http://rogueamoeba.com/airfoil/mac/" target="_blank">Airfoil</a>; cross platform&nbsp;app that allows the audio output on an iOS device to be broadcast to another device (windows/mac), in this case to the netbook running Airfoil speakers; this lets me for example listed to BBC radio from the iPlayer app on the iPad and have the sound coming out of the main speakers.&nbsp;</li>
</ul>
On top of these I also use :<br />
<ul>
<li><a href="http://www.teamviewer.com/en/index.aspx" target="_blank">Teamviewer </a>for remote desktop connection to the PCs in the house&nbsp;</li>
<li><a href="https://itunes.apple.com/gb/app/fileexplorer/id499470113?mt=8" target="_blank">FileExplore </a>which as the name suggests allows simle file browsing and moving etc from the iPhone/iPadAnd last but not least&nbsp;</li>
<li><a href="http://www.zinger-soft.com/iSSH_features.html" target="_blank">iSSH </a>which is an iOS SSH terminal, which I use for basic system admin on the QNAP.</li>
</ul>
