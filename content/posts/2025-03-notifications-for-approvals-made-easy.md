---
title: "Notifications for Approvals Made Easy"
date: 2025-03-01T15:56:00Z
lastmod: 2025-05-03T10:27:35Z
url: "/2025/03/notifications-for-approvals-made-easy.html"
tags: ["d365bc", "approvals"]
hero: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrDU_TZUYg0FIuEFUVUCKPJcj47eQmCCoOE00R2lyWgeFHgH1VuMmdZWLutw8pwszqqc6p5GVbfsXZVP2oXqVvGvasZv8bzsqJMzWpNc8Z-JqqROrDNKVELPlLr4UXQUAqgcMtbvFJ4xg37LwR-Jqa_m5cojHNUWZDL92B41VluFxMbOx4HYxf/w640-h348/2025-03-01_15h39_39.png"
author: "Andy Wingate"
linkedin: "https://www.linkedin.com/posts/andywingate_msdyn365bc-businesscentral-d365-activity-7301634046625812480-batk"
---
<p>&nbsp;</p><br /><p></p><p>Here is a video to show the step-by-step process to check and modify the notifications that are sent at different stages of an native BC approval workflow. Inspired by listening to Steve Endowâ€™s latest podcast, his team are trying out both Power Automate Approvals and Native Approvals to meet various client requirements.&nbsp;&nbsp;</p><div class="separator" style="clear: both; text-align: center;"><iframe allowfullscreen="" class="BLOG_video_class" height="266" src="https://www.youtube.com/embed/4xwi5LXfx28" width="320" youtube-src-id="4xwi5LXfx28"></iframe></div><div><br /></div><p></p>
<h2 style="text-align: left;"><strong>Step-by-Step: Setting Up General Journal Batch Approval in Business Central</strong></h2>
<p>Approvals are a critical part of any financial process, and Business Central provides a robust <strong>General Journal Batch Approval</strong> workflow right out of the box. However, a common request from users is <strong>to notify the requestor once their batch has been approved</strong>â€”so Iâ€™ve added that as well!</p>
<p>This guide walks through:<br />
âœ… <strong>Setting up the standard General Journal Batch Approval workflow</strong><br />
âœ… <strong>Tweaking the workflow to include an extra notification for the requestor</strong></p>
<p>This idea came after listening to <strong>Steve Endowâ€™s podcast on Friday</strong>, which inspired me to share this tip!</p>
<hr />
<h3 style="text-align: left;"><strong>Step 1: Enable the General Journal Batch Approval Workflow</strong></h3>
<ol>
<li><strong>Go to Business Central</strong> and open the <strong>Workflows</strong> page.</li>
<li>Search for <strong>General Journal Batch Approval Workflow</strong>â€”this is the <strong>out-of-the-box setup</strong> provided by Microsoft.</li>
<li>Open the workflow and review its conditions:
<ul>
<li>It triggers when a <strong>journal batch approval is requested</strong>.</li>
<li>It checks if the batch is balanced before proceeding.</li>
<li>It assigns the approval request to the designated approver.</li>
<li>Once approved, it allows posting.</li>
</ul>
</li>
</ol>
<hr />
<h3 style="text-align: left;"><strong>Step 2: Test the Standard Workflow</strong></h3>
<ol>
<li><strong>Create a new General Journal batch</strong> in the General Journal window.</li>
<li>Enter some transactions and <strong>request approval</strong>.</li>
<li>As an approver, <strong>approve the batch</strong> and ensure it moves through the workflow correctly.</li>
</ol>
<p>At this stage, the approval is workingâ€”but the requestor is <strong>not notified</strong> when their batch gets approved. Letâ€™s fix that!</p>
<hr />
<h3 style="text-align: left;"><strong>Step 3: Add a Notification to the Requestor</strong></h3>
<p>Many users ask: <em>â€œHow can I notify the person who submitted the batch once itâ€™s approved?â€</em> Hereâ€™s how to add this extra step:</p>
<ol>
<li><strong>Go back to the Workflow page</strong> and edit the General Journal Batch Approval Workflow.</li>
<li><strong>Insert a new workflow response action</strong> after the batch is approved.</li>
<li>Choose <strong>"Send an email notification"</strong>.</li>
<li>Select <b>"Notify Sender"</b> and choose type <b>"Approval"</b>.</li>
<li>Save and activate the workflow.</li>
</ol>
<p>Now, whenever a journal batch is approved, the requestor will get a <strong>confirmation notification</strong>!</p>
<hr />
<h3 style="text-align: left;"><strong>Step 4: Test the Enhanced Workflow</strong></h3>
<ol>
<li>Repeat the test process by submitting another journal batch for approval.</li>
<li>Approve the batch as an approver.</li>
<li>Check if the requestor receives the notificationâ€”either by email or within Business Central.</li>
</ol>
<hr />
<h2><strong>Final Thoughts</strong></h2>
<p>ðŸŽ¯ With this small tweak, your approval workflow becomes <strong>more transparent and user-friendly</strong>. The requestor no longer has to <strong>chase the approver</strong> to check if their batch was approvedâ€”they get notified automatically!</p>
