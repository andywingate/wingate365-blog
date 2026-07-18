---
title: "Mastering Dynamics 365 BC Security - License Security Groups"
date: 2025-02-16T18:36:00Z
lastmod: 2025-05-03T10:27:23Z
url: "/2025/02/mastering-dynamics-365-bc-security_16.html"
tags: ["d365bc", "admin"]
hero: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj8TQKQeP4cowsz_aD2d8aiJwqf_jXBvtZgs8krYPi1lSdbyVfgaSHcGDagEyIAiaA1sut6qcCeQyOS6HC56COwZgGfkQaEpqdmw98zaJGTklsCoxtu_mqWQwSuMgdgEeNZ-1gfVwweq1LM7oR0oevP5L77AWGnQNZu5My7sY0pfzeWsV-_AW_8/w640-h360/2025-02-08_11h25_26%20yt.png"
author: "Andy Wingate"
linkedin: "https://www.linkedin.com/posts/andywingate_msdyn365bc-cybersecurity-bcadmin-activity-7293961578297593856-9OV7"
---
<p></p>This short video is the 2nd in this Mastering Security for BC mini-series. Here I'm looking at the use of Entra Security Groups to manage license assignment. Not something restricted D365 BC licenses, but important to understand none the less!<div><br /></div><div class="separator" style="clear: both; text-align: center;"><iframe allowfullscreen="" class="BLOG_video_class" height="266" src="https://www.youtube.com/embed/FVLy4EvPaLM" width="320" youtube-src-id="FVLy4EvPaLM"></iframe></div><div><p></p>
<h2 style="text-align: left;">Assigning Licenses in Business Central Using Security Groups</h2><p>Managing user licenses efficiently is crucial for maintaining a streamlined Business Central environment.&nbsp;</p><p>In this short video I look at how to use&nbsp;<strong>security groups</strong> for license assignment, ensuring a controlled and scalable approach to user access management.</p><table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto;"><tbody><tr><td style="text-align: center;"><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjduMEc752eqyeapbVBD9E-gfHDU2SmrEn34Z-J0Jr_9ZI2fJ8bgRi7p8BprWL2qjsrpG5qPDz82tdxPNawLstAOS47YdpoJKxfgtInTQA8HFBuHxXAxUAf8BvkPsdPKLRqbYFMXVsMwaH1LIvgcvziC_lkpw2Vemh7kCE4MXhYn0MGsgA3oeyW/s772/BC%20Security%20v2.drawio.png" style="margin-left: auto; margin-right: auto;"><img border="0" data-original-height="772" data-original-width="633" height="640" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjduMEc752eqyeapbVBD9E-gfHDU2SmrEn34Z-J0Jr_9ZI2fJ8bgRi7p8BprWL2qjsrpG5qPDz82tdxPNawLstAOS47YdpoJKxfgtInTQA8HFBuHxXAxUAf8BvkPsdPKLRqbYFMXVsMwaH1LIvgcvziC_lkpw2Vemh7kCE4MXhYn0MGsgA3oeyW/w525-h640/BC%20Security%20v2.drawio.png" width="525" /></a></td></tr><tr><td class="tr-caption" style="text-align: center;">My recommended Security Group approach for D365 BC</td></tr></tbody></table><div style="text-align: left;"><br /></div><h2>Using Security Groups for License Assignment</h2><h3>Step 1: Create a Security Group</h3><ol>
<li>Navigate to the <strong>Microsoft 365 Admin Center</strong>.</li>
<li>Select <strong>Groups &gt; Active Groups</strong> and click <strong>Create a Group</strong>.</li>
<li>Choose <strong>Security Group</strong>, provide a relevant name, and complete the setup.</li>
</ol><div>Use consistent naming, in this example I follow the style set by the Device License security group&nbsp;<a href="https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/deployment/licensing?wt.mc_id=MVP_422407#device-licenses">Licensing in Business Central - Business Central | Microsoft Learn</a></div><h3>Step 2: Assign Licenses to the Security Group</h3><ol>
<li>Go to <strong>Billing &gt; Licenses</strong> in the Admin Center.</li>
<li>Select the license type you want to assign.</li>
<li>Click on <strong>Assign to Group</strong> and select the previously created <strong>Security Group</strong>.</li>
<li>Confirm the assignment, ensuring all users within the group receive the necessary licenses automatically.</li>
</ol><h3>Step 3: Add Users to the Security Group (..not shown in the video)</h3><ol>
<li>Navigate back to <strong>Groups &gt; Active Groups</strong>.</li>
<li>Select the security group and click <strong>Add Members</strong>.</li>
<li>Search for and add the users who require the license.</li>
</ol><h2>Benefits of Using Security Groups</h2><ul>
<li><strong>Scalability:</strong> Easily manage licenses for multiple users at once.</li>
<li><strong>Consistency:</strong> Ensures users receive the correct access based on role or department.</li>
<li><strong>Efficiency:</strong> Reduces manual work and potential errors in license management.</li></ul><h2>Conclusion</h2><p>In the next video we will create the final Security Group type - for Application Permissions. The real reason for going to the lengths of creating 3 different types of Security Groups will become apparent! Stay tuned...</p><p>Handy Links</p><p><a href="https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/deployment/licensing?WT.mc_id=MVP_422407">Licensing in Business Central - Business Central | Microsoft Learn</a><br /><a href="https://learn.microsoft.com/en-us/entra/fundamentals/concept-learn-about-groups?WT.mc_id=MVP_422407">Learn about groups, group membership, and access - Microsoft Entra | Microsoft Learn</a><br /></p>
