---
title: "Migrate Mediawiki installation"
date: 2018-02-18T12:11:00Z
lastmod: 2018-02-18T12:11:25Z
url: "/2018/02/migrate-mediawiki-installation.html"
author: "Andy Wingate"
---
<h3>
Old server</h3>
<li>backup existing database - mysql dump</li>
<li>copy files folder frp, public_html</li>
<br />
<h3>New Server</h3>
<li>create new database, with same name/username </li>
<li>restore into new database - mysql -u username -p new_database &lt; data-dump.sql <a href="https://www.digitalocean.com/community/tutorials/how-to-import-and-export-databases-in-mysql-or-mariadb" target="_blank">source</a></li>
<li>copy files to public_html</li>
<li>edit LocalSettings.php:&nbsp;<a href="https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgServer" style="background-attachment: initial; background-clip: initial; background-image: none; background-origin: initial; background-position: initial; background-repeat: initial; background-size: initial; color: #0b0080; font-family: monospace, Courier; font-size: 14px; text-decoration-line: none;" title="Special:MyLanguage/Manual:$wgServer">$wgServer</a>&nbsp;- update to new URL</li>
