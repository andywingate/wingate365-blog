---
title: "SSRS Access Logs - Big Brother is Watching"
date: 2014-03-15T00:20:00Z
lastmod: 2014-03-15T00:20:18Z
url: "/2014/03/ssrs-access-logs-big-brother-is-watching.html"
author: "Andy Wingate"
---
T-SQL is

<br />
<pre> 
Use ReportServer
select * from ExecutionLog3 order by TimeStart DESC
</pre>
<pre>
</pre>
Source <a href="http://technet.microsoft.com/en-us/library/ms159110(v=sql.105).aspx#bkmk_executionlog3">here</a>
