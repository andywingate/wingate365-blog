---
title: "VLC Streaming"
date: 2016-04-03T18:44:00Z
lastmod: 2016-04-03T22:48:23Z
url: "/2016/04/vlc-streaming.html"
author: "Andy Wingate"
---
Here is my setup to use VLC running on a laptop with a webcam as a simple CCTV system that can stream to your mobile.<br />
<br />
VLC was installed on a laptop running Ubuntu 14.4. The webcam input stream was found at
<br />
<pre>v4l2:///dev/video0
</pre>
<br />
and the audio input was found at
<br />
<pre>alsa://hw:0,0
</pre>
<br />
using the command line for VLC I started capturing these two devices, transcoding and streaming to http with the following script
<br />
<script src="https://gist.github.com/andywingate/557b7e1ce7bec30d60f5927fb3ba1d45.js"></script>

For some reason .asf was the only encapsulation that worked, the filename you set pics the encapsulation. You can do all of this via the VLC gui, but you will need to change the string on the last page if you want a username and pass as VLC does not set that by default, instead sets the dst only.
<br />
Create the necessary port forward in the router if you wish to access via WAN, or leave locked down if using local only.<br />
<br />
On the receiving device open VLC and open 'Network Stream' as http://[username]:[password]@[wanip or localhost]:[port]/[file]. E.g. http://jsmith:mypass@1.2.3.4:8080/go.asf<br />
<br />
A bit more long winded but can also can be done via the VLC GUI :<br />
<br />
<ul>
<li>Media &gt; Open Capture Device&nbsp;</li>
<li>Choose your Webcam and Microphone&nbsp;</li>
<li>Use the drop-down next to 'Play' to instead choose 'Stream'</li>
<li>Source - it should fill the input source for you so just next</li>
<li>Destination Setup - use the dropdown, select http and click add.&nbsp;</li>
<li>Set the port and file name, e.g. 8080, /go.asf (the file name must match the transcoding profile encapsulation type)&nbsp;</li>
<li>Pick the transcoding profile, the only one I got to work was ASF with DIV3 and MP3&nbsp;</li>
<li>You can then edit the final string before clicking stream, but should work with no edits.</li>
</ul>
<br />
Simply test by opening another VLC window and trying to open the 'Network Stream' you just created e.g. http://localhost:8080/go.asf
