---
title: "phpmyadmin mcrypt issue / Ubuntu Server 14.04 / Fixed"
date: 2014-07-26T18:00:00Z
lastmod: 2014-07-26T18:00:14Z
url: "/2014/07/phpmyadmin-mcrypt-issue-ubuntu-server.html"
author: "Andy Wingate"
---
myphpadmin says: "The mcrypt extension is missing. Please check your PHP configuration"<br />
<pre>
</pre>
<pre>apt-get purge libapache2-mod-php5 php5 
apt-get install libapache2-mod-php5 php5

sudo apt-get install php5-mcrypt
sudo php5enmod mcrypt 
sudo service apache2 restart
</pre>
