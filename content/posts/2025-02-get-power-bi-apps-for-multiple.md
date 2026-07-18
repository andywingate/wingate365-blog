---
title: "Get the Power BI apps for Multiple Companies in Dynamics 365 Business Central"
date: 2025-02-01T12:55:00Z
lastmod: 2025-03-14T14:25:24Z
url: "/2025/02/get-power-bi-apps-for-multiple.html"
tags: ["power bi", "video"]
hero: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhioutFIaIctx7Y3oz5XSTBh3wTTLC_KV1185Wu5jkmpqwMnbx0eCHVt9tCE0FHmC3rx9oFOl7x5npd9tL9yp5BmFi2_g0fgtGhc7sw0cgfwRq3uMWihwoqVOvZCG_3it96ZCG21ewWDRsqZsCnmLRPMB_cvYt9LSu0AvRIe4N7YY3XUOSO76Mt/w640-h302/2025-02-01_11h56_57.png"
author: "Andy Wingate"
---
<p>In this short video I run through the steps for the basic setup for the new Power BI app for Dynamics 365 Business Central that were released last year, specifically looking the steps to install them multiple times - for multiple companies.&nbsp;</p><div class="separator" style="clear: both; text-align: center;"><iframe allowfullscreen="" class="BLOG_video_class" height="266" src="https://www.youtube.com/embed/-jLI_A18tZc" width="320" youtube-src-id="-jLI_A18tZc"></iframe></div><h3 style="text-align: left;"><br /></h3><div>In this short follow-up video I complete the connection to 2 companies and check it's really working by posting a couple of large invoices and refreshing the datasets in Power BI.&nbsp;&nbsp;</div><div><br /></div><div class="separator" style="clear: both; text-align: center;"><iframe allowfullscreen="" class="BLOG_video_class" height="266" src="https://www.youtube.com/embed/1dQKnKFXZwc" width="320" youtube-src-id="1dQKnKFXZwc"></iframe></div><div><p></p>
<h3><strong>Setting Up and Configuring Power BI Reports in Business Central</strong></h3>
<p>The Power BI apps provided my Microsoft for Business Central enhance reporting capabilities, allowing businesses to gain deeper insights into financial and operational data. This guide walks through the process of setting up Power BI reports, ensuring correct configurations, and troubleshooting common issues.</p>
<h4 style="text-align: left;"><strong>Step 1: Accessing Business Central Reporting</strong></h4>
<p>To begin, check out the docs, navigate to <a href="https://aka.ms/BCReporting">https://aka.ms/BCReporting</a>, which provides documentation and details on available reports. Business Central includes pre-built Power BI reports covering key financial metrics, such as general ledger (GL) balances, receivables, and payables.</p>
<h4 style="text-align: left;"><strong>Step 2: Understanding Data Categories and Account Mapping</strong></h4>
<p>A common issue when setting up reports is missing or incorrect data due to GL account categories not being mapped properly. To ensure accurate reporting, verify that all relevant accounts are assigned correctly.</p>
<p>Consider the following:</p>
<ul>
<li>Accounts receivable and accounts payable categories must be correctly defined in Business Central.</li>
<li>If reports display missing or inaccurate data, reviewing and updating category mappings can often resolve the issue.</li>
</ul>
<p>After making any adjustments, refresh the Power BI reports to reflect the latest financial data.</p>
<h4 style="text-align: left;"><strong>Step 3: Checking Power BI App Connections</strong></h4>
<p>Ensuring the correct <strong>Business Central environment and company</strong> are linked in Power BI is essential for accurate reporting. This can be checked by:</p>
<ol>
<li>Opening the <strong>Power BI app workspace</strong>.</li>
<li>Reviewing the <strong>semantic model settings</strong>.</li>
<li>Verifying that the correct <strong>environment and company name</strong> are assigned under the <b>Parameters </b>section&nbsp;</li>
</ol>
<p>For multi-company setups, confirming that each company’s reports are correctly connected is essential.&nbsp;</p>
<h4 style="text-align: left;"><strong>Step 4: Refreshing Data and Validating Reports</strong></h4>
<p>To ensure changes are applied and data is up to date:</p>
<ul>
<li>Refresh the Power BI data model to sync the latest Business Central data.</li>
<li>Validate updates by checking key financial reports, such as payables and receivables.</li>
<li>Test with different companies to confirm multi-company reporting is functioning correctly.</li>
</ul>
<p>Once refreshed, verify that all categories and mappings appear correctly in the Power BI dashboards.</p>
<h3><strong>Common Troubleshooting Tips</strong></h3>
<ul>
<li>If data does not appear correctly, check the <strong>GL account categories</strong> in Business Central.</li>
<li>Ensure the <strong>correct company</strong> is selected in Power BI settings.</li>
<li>For multiple companies, confirm that each is assigned to the correct dataset.</li>
<li>Refresh the Power BI dataset after making any configuration changes.</li>
</ul>
<h3><strong>Conclusion</strong></h3>
<p>By following these steps, businesses can ensure that Power BI reports in Business Central are properly set up and provide accurate, real-time financial data. Correct configuration of account categories and data mappings is crucial for generating reliable insights and improving business intelligence.</p>
<p>For additional guidance, refer to Microsoft’s official documentation or seek expert advice if challenges persist.</p>
</div><h3 style="text-align: left;">Here are some handy links - for the Finance Power BI App</h3><p></p><ul style="text-align: left;"><li>Main landing page for all things reporting in BC <a href="https://aka.ms/bcreporting">https://aka.ms/bcreporting</a></li><li><a href="https://learn.microsoft.com/en-us/dynamics365/business-central/across-powerbi-apps-by-functional-area">Power BI apps/reports for functional areas - Business Central | Microsoft Learn</a></li><li><a href="https://learn.microsoft.com/en-us/dynamics365/business-central/finance-powerbi-app">Finance Power BI app - Business Central | Microsoft Learn</a></li><li>All the new Power BI Apps -&nbsp;<a href="https://learn.microsoft.com/en-us/dynamics365/business-central/across-working-with-powerbi">Working with Power BI reports in Business Central - Business Central | Microsoft Learn</a></li><li><a href="https://learn.microsoft.com/en-us/dynamics365/business-central/finance-powerbi-app-setup">Set up the Finance Power BI app - Business Central | Microsoft Learn</a></li><li><a href="https://learn.microsoft.com/en-us/dynamics365/business-central/across-powerbi-install-business-central-apps">Installing Power BI apps for Business Central - Business Central | Microsoft Learn</a></li><li>Power BI Connector Setup Page, in BC:&nbsp;<a href="https://businesscentral.dynamics.com/?page=36951">Power BI Connector Setup</a></li></ul>
<h2>What do you think?</h2>
<p>Please let me know your thoughts in the <a href="https://www.linkedin.com/posts/andywingate_msdyn365bc-powerbi-businesscentral-activity-7291442759947714561-3Qn1?utm_source=share&amp;utm_medium=member_desktop" target="_blank">comments</a><br /></p>
<p>Connect or follow me on LinkedIn to get all my updates&nbsp;<a href="https://www.linkedin.com/in/andywingate/" target="_blank">Andrew Wingate | LinkedIn</a></p>
<style>
    .libutton {
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 7px;
      text-align: center;
      outline: none;
      text-decoration: none !important;
      color: #ffffff !important;
      width: 200px;
      height: 32px;
      border-radius: 16px;
      background-color: #0A66C2;
      font-family: "SF Pro Text", Helvetica, sans-serif;
    }
  </style>
  <a class="libutton" href="https://www.linkedin.com/comm/mynetwork/discovery-see-all?usecase=PEOPLE_FOLLOWS&amp;followMember=andywingate" target="_blank">Click to Follow</a><br />
