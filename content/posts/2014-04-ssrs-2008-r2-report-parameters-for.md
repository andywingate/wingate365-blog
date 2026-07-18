---
title: "SSRS 2008 R2 Report parameters for MySQL datasources "
date: 2014-04-08T07:41:00Z
lastmod: 2014-04-08T07:41:59Z
url: "/2014/04/ssrs-2008-r2-report-parameters-for.html"
author: "Andy Wingate"
---
If you are using MySQL databases in SSRS you have to manually add the parameters.<br />
<br />
For a date range<br />
<br />
Manually add two parameters<br />
@start (date/time)<br />
@end (date/time)<br />
<br />
Go into dataset properties<br />
Updated the query with appropriate where clause:<br />
<br />
e.g. WHERE table.date between @start and @end<br />
<br />
# The system gives an error warning about defining the parameters, ignore this.<br />
<br />
Define parameters in dataset properties<br />
link parameter name "@start" with Parameter Value "@start" and same for @end<br />
<br />
<br />
