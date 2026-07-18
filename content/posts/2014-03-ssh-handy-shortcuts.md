---
title: "SSH Handy Shortcuts"
date: 2014-02-01T00:30:00Z
lastmod: 2014-03-15T00:30:42Z
url: "/2014/03/ssh-handy-shortcuts.html"
tags: ["networking"]
author: "Andy Wingate"
---
<b>File/Disk Browsing</b><br />
Lists summary size (-s) in Gb/Mb/Kb (-h) units for all sub-directories of the current path (./*)
<br />
<pre># du -sh ./*</pre>
<br />
Show everything, human readable file sizes, in a list
<br />
<pre># ls -lah</pre>
<pre></pre>
<br />
<b>Pipes</b><br />
Use the | after the first command to pipe the output to the next command e.g. Show all processes with the string apache in the command<br />
<pre>#ps | grep apache</pre>
<br />
<b>Screen</b><br />
Is a pretty handy tool if you do much work via an SSH terminal<br />
<br />
Launch app<br />
<pre># screen

</pre>
Detach current screen<br />
<pre>Ctrl-a d</pre>
<br />
List screens running<br />
<pre># screen -ls</pre>
<br />
Reattach a single screen<br />
<pre># screen -R</pre>
<br />
<b>TCP/IP</b><br />
<pre># ifconfig</pre>
<pre># sudo iwlist wlan0 scan</pre>
<br />
<br />
<br />

