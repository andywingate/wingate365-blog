---
title: "Fix vTiger \"SMTP Connect() failed\" Error"
date: 2014-03-18T21:21:00Z
lastmod: 2014-03-18T21:21:16Z
url: "/2014/03/fix-vtiger-smtp-connect-failed-error.html"
author: "Andy Wingate"
---
Just need to update a setting in vtigercrm/modules/Emails/class.phpmailer.php<br />
<br />
<i>from </i><br />
<pre>function IsSMTP() {
$this-&gt;Mailer = "smtp";
</pre>
<br />
<i>to</i><br />
<pre>function IsSMTP() {
$this-&gt;Mailer = "sendmail";
</pre>
<br />
Thanks <a href="https://discussions.vtiger.com/index.php?p=/discussion/169387/outgoing-email-imposible-to-get-it-working">Nathan79</a><br />
<br />
