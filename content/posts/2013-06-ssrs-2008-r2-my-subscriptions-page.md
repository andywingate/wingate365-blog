---
title: "SSRS 2008 R2 'My Subscriptions' page blank - Fix"
date: 2013-06-22T14:28:00Z
lastmod: 2013-06-22T14:28:22Z
url: "/2013/06/ssrs-2008-r2-my-subscriptions-page.html"
tags: ["ssrs"]
author: "Andy Wingate"
---
Really annoying bug this one, fixed the same way as Ant describes at...<br />
<div style="background-color: white; border: 0px; clear: both; font-family: Arial, 'Liberation Sans', 'DejaVu Sans', sans-serif; font-size: 14px; line-height: 18px; margin-bottom: 1em; padding: 0px; vertical-align: baseline; word-wrap: break-word;">
<br />
original post at&nbsp;<a href="http://stackoverflow.com/questions/12157528/ssrs-my-subscriptions-is-empty" style="background-color: transparent;">http://stackoverflow.com/questions/12157528/ssrs-my-subscriptions-is-empty</a></div>
<div style="background-color: white; border: 0px; clear: both; font-family: Arial, 'Liberation Sans', 'DejaVu Sans', sans-serif; font-size: 14px; line-height: 18px; margin-bottom: 1em; padding: 0px; vertical-align: baseline; word-wrap: break-word;">
</div>
<div style="border: 0px; clear: both; margin-bottom: 1em; padding: 0px; vertical-align: baseline; word-wrap: break-word;">
<span style="background-color: white; font-family: Arial, 'Liberation Sans', 'DejaVu Sans', sans-serif; font-size: 14px; line-height: 18px;">The users were authenticating in Report Manager as&nbsp;</span><code style="background-color: #eeeeee; border: 0px; font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; font-size: 14px; line-height: 18px; margin: 0px; padding: 1px 5px; vertical-align: baseline;">SOMEDOMAIN\MyUser</code><span style="background-color: white; font-family: Arial, 'Liberation Sans', 'DejaVu Sans', sans-serif; font-size: 14px; line-height: 18px;">, while the ReportServer database was storing the users without the domain.</span></div>
<div style="background-color: white; border: 0px; clear: both; font-family: Arial, 'Liberation Sans', 'DejaVu Sans', sans-serif; font-size: 14px; line-height: 18px; margin-bottom: 1em; padding: 0px; vertical-align: baseline; word-wrap: break-word;">
All I had to do was prepend the domain to the applicable users' names in&nbsp;<code style="background-color: #eeeeee; border: 0px; font-family: Consolas, Menlo, Monaco, 'Lucida Console', 'Liberation Mono', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Courier New', monospace, serif; margin: 0px; padding: 1px 5px; vertical-align: baseline;">[ReportServer].[dbo].Users</code>.</div>

