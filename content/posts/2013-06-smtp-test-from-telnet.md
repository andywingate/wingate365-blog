---
title: "SMTP test from telnet"
date: 2013-06-22T14:23:00Z
lastmod: 2013-06-22T14:24:59Z
url: "/2013/06/smtp-test-from-telnet.html"
tags: ["networking"]
author: "Andy Wingate"
---
Need to test out access to a mail server?<br />
<br />
From GNU/linux is easiest, fire up the terminal<br />
<br />
You will need your username and password as base64, to get these use perl<br />
<br />
perl -MMIME::Base64 -e 'print encode_base64("username");'<br />
perl -MMIME::Base64 -e 'print encode_base64("password");'<br />
<br />
Save this output to use later<br />
<br />
telnet mail.yourserver.com 25<br />
EHLO mail.yourserver.com<br />
AUTH LOGIN<br />
[paste in your base64 username]<br />
[paste in your base64 password]<br />
<br />
Now you know if your server is working with those access details or not...
<br />
<br />
Thanks NDCHost<br />
<a href="http://www.ndchost.com/wiki/mail/test-smtp-auth-telnet">http://www.ndchost.com/wiki/mail/test-smtp-auth-telnet</a>

