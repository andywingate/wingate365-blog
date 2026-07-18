---
title: "Mastering Dynamics 365 BC Security - Admin Center"
date: 2025-02-08T11:48:00Z
lastmod: 2025-02-16T18:11:37Z
url: "/2025/02/mastering-dynamics-365-bc-security.html"
tags: ["d365bc", "video", "security"]
hero: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj8TQKQeP4cowsz_aD2d8aiJwqf_jXBvtZgs8krYPi1lSdbyVfgaSHcGDagEyIAiaA1sut6qcCeQyOS6HC56COwZgGfkQaEpqdmw98zaJGTklsCoxtu_mqWQwSuMgdgEeNZ-1gfVwweq1LM7oR0oevP5L77AWGnQNZu5My7sY0pfzeWsV-_AW_8/w640-h360/2025-02-08_11h25_26%20yt.png"
author: "Andy Wingate"
linkedin: "https://www.linkedin.com/posts/andywingate_msdyn365bc-cybersecurity-bcadmin-activity-7293961578297593856-9OV7"
---
<p></p>This short video covers two important security settings in the Business Central Admin Center. Learn how to configure these settings to enhance security and protect your system!<p></p><div class="separator" style="clear: both; text-align: center;"><iframe allowfullscreen="" class="BLOG_video_class" height="266" src="https://www.youtube.com/embed/tVQ9R43r63g" width="320" youtube-src-id="tVQ9R43r63g"></iframe></div><p></p>
<h3><strong>Essential Security Settings in the Business Central Admin Center</strong></h3>
<p>Securing a Business Central environment is crucial to protecting company data and ensuring only authorised users have access.<br /><br />This guide outlines two key security settings in the Business Central Admin Center that help enhance system security.</p>

<h4 style="text-align: left;"><strong>1. Manage Environment Level Access</strong></h4>
<p>An important steps in securing a Business Central environment is properly configuring the environment level user access.</p><p>
To do this:</p>
<ul>
<li>Navigate to the <strong>Business Central Admin Center</strong>.</li>
<li>Go to <strong>Environments</strong> and select the target environment.</li>
<li>Check the <b>Security Group</b>&nbsp;settings.</li>
<li>Assign a suitable&nbsp;<strong>Security Group</strong>.</li>
</ul>
<p>Setting a security groups at the environment level allows administrators to control access efficiently and broadly across Production and Non-Production environments.</p>

<h4 style="text-align: left;"><strong>2. Understanding the Partner Access Setting</strong></h4>
<p>Another crucial security setting is <strong>Partner Access</strong>. If an external Microsoft partner manages Business Central, they may require access to your environment for support.<br /><br />To review and configure this:</p>
<ul>
<li>Open the&nbsp;<strong>Business Central Admin Center</strong>.</li>
<li>Click to open an Environment and check the&nbsp;<strong>Partner Access</strong>&nbsp;setting.</li>
<li>You can toggle access on and off - very handy to ensure total exclusion of any third party</li><li>You can also review see and manage all the partners that have been granted GDAP access to your Business Central environments.</li>
<li>Remove or restrict access if necessary.</li>
</ul>
<p>I would always recommend limiting partner access to only those who actively support your system as a bare minimum. Even where you only have 1 partner with access, should another be added in future the won't immediately have access to all areas with this feature turned on.</p>

<h3><strong>Best Practices for Business Central Security</strong></h3>
<ul>
<li><strong>Regularly review Security Group membership </strong>to ensure only authorised users have access.</li>
<li><strong>Use Security Groups</strong> to simplify access control across environments.</li>
<li><strong>Monitor partner access</strong> to prevent unnecessary external access.</li>
</ul>
<p>By configuring these two simple security settings in the <strong>Business Central Admin Center</strong>, businesses can strengthen their ERP environment against potential risks.</p><p><b><i>Next time I'll look at how to use Security Groups for BC application permissions.</i></b></p>
<h3 style="text-align: left;">Handy Links</h3><div><a href="https://learn.microsoft.com/en-us/dynamics365/business-central/">Microsoft Dynamics 365 Business Central documentation - Business Central | Microsoft Learn</a></div><div><a href="https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-manage-access">Manage Access to Environment - Business Central | Microsoft Learn</a></div>
