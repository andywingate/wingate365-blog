---
title: "How to filter the current user with measures in your Dynamics 365 Business Central embedded Power BI report."
date: 2023-04-07T14:53:00Z
lastmod: 2025-02-01T13:12:39Z
url: "/2023/04/filter-for-current-user-with-measure-of.html"
tags: ["d365bc", "power bi"]
hero: "https://blogger.googleusercontent.com/img/a/AVvXsEj82yZIa5BWQ4pQKoI44od-Eyy3TM5j-h_SbWmwRZxz-bw6EedT33xZ7toZiUZj6iw3JilOS9X27Ctvc3cREPvUeZXdne-QaFnyM9Umq4Kfs79KVZFm9Di6USaf3dGbwn4iEOU7cxA6rLTYAA2CPyhL8356KrTVYI-ya-vb1INfXSJPsbPZVA"
author: "Andy Wingate"
---
Embedding&nbsp;<a href="https://powerbi.microsoft.com/" target="_blank">Power BI</a> reports directly in <a href="https://dynamics.microsoft.com/en-gb/business-central/overview" target="_blank">Dynamics 365 Business
    Central</a> is one of the many synergies of the <a href="https://www.office.com/" target="_blank">Microsoft 365</a>
platform. Giving users context relevant analysis right on the page where they need to see it helps make faster and better decisions.&nbsp;&nbsp;<div><br /></div>
<div>Previously I have looked at <a href="https://blog.wingateuk.com/2023/02/yellow-excel-or-how-i-learned-to-stop.html" target="_blank">how to easily publish a new data set as a web service from BC and use this data in a Power BI
        report shown on the BC role center page</a>.</div>
<div><br /></div>
<div>An interesting requirement that came up this week was the need to filter a BI report to only show
    data related to the current user.</div>
<div><br /></div>
<div>Initially <a href="https://learn.microsoft.com/en-us/power-bi/enterprise/service-admin-rls" target="_blank">row
        level security</a> was considered; but this was not as easy to implement as using a basic visual filter and the
    'Measure of a Measure' approach. Credit goes to the Power BI community, the original solution was described&nbsp;<a href="https://community.powerbi.com/t5/Desktop/Show-Current-Logged-in-User-data-only/td-p/2219446" target="_blank">here </a>and <a href="https://community.powerbi.com/t5/Developer/RLS-vs-Filter-for-current-user/m-p/329584" target="_blank">here</a>.&nbsp;&nbsp;</div>
<div><br /></div>
<div>This approach relies on your data model having the user emails on the rows you wish to filter to. Add
    2 new measures to your data model to the table that shows the user emails.&nbsp;</div><div><br /></div><div><b>Adding a measure:</b></div><div><br /></div><div><br />
      <p><b>Measure 1:</b></p></div><div>
  <pre>CurrentUser = USERPRINCIPALNAME()&nbsp;</pre>
      <p><b>Measure 2:</b></p>
  <pre>FilterByViewer = IF(SELECTEDVALUE(UserApprovalSetup[E_Mail])=[CurrentUser],1,0)</pre>
   
<p>In this example the current table was 'UserApprovalSetup' and the column with user email in was 'E_Mail'.</p><p>The second measure now returns a 1 on any row where the 'E_mail' in the underlying table matches the current user. So we can do a simple visual filter:&nbsp;</p><p></p><table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto;"><tbody><tr><td style="text-align: center;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEiLABpnIcJGOkHWu_YgbsrDwrtyWZvGpIn9e2rAKhbuD-iT2sNBcnt9QCWFNQMMvruH9VR4Z0LmhQMJR8EAG4yb1rvZ7HQ5-FxLR4qBsHOHSnfrWCvGB4UQgRT0wLO13nn4YhX0nredEvy9wgUSeSnl0DlHwmh5IMWiV76-255EGn_E0aDaTg" style="margin-left: auto; margin-right: auto;"><img alt="" data-original-height="521" data-original-width="204" height="240" src="https://blogger.googleusercontent.com/img/a/AVvXsEiLABpnIcJGOkHWu_YgbsrDwrtyWZvGpIn9e2rAKhbuD-iT2sNBcnt9QCWFNQMMvruH9VR4Z0LmhQMJR8EAG4yb1rvZ7HQ5-FxLR4qBsHOHSnfrWCvGB4UQgRT0wLO13nn4YhX0nredEvy9wgUSeSnl0DlHwmh5IMWiV76-255EGn_E0aDaTg" width="94" /></a></td></tr><tr><td class="tr-caption" style="text-align: center;">Visual filter on the 2nd measure 'FilterByViewer'. Lock or hide if necessary.</td></tr></tbody></table><p>That's it! very simple to use.<br /><br /></p></div>
