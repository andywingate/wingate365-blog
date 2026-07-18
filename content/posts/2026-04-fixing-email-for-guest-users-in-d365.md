---
title: "Fixing Email for Guest Users in D365 Business Central"
date: 2026-04-26T20:41:00Z
lastmod: 2026-06-07T10:05:00Z
url: "/2026/04/fixing-email-for-guest-users-in-d365.html"
hero: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgD_tgKvPVaoeOc1509VK7bJu5oc_hFYoI-QF8G2etdokdMZAq4_JCGqSWiRoSLcJAwIvnT2NvZWqkS2I6cQr-cV9Y1UunPX8XlPPOaNqFe2wvMjKhcbRRpIvBETsz63aLoFx0fouVnYMQ6DXFyh_ua54BEEz-dW8ddb8RtmBKyTTHnvSTrXnCD/w640-h344/2026-04-26_21h39_24.png"
tags: ["d365bc", "d365", "m365", "azure", "ai", "ssrs"]
author: "Andy Wingate"
---
<!--Blog Post: Fixing Email for Guest Users in Business Central - Open Source Extension-->
<!--Labels: D365BC, SECURITY, ADMIN, VIBE CODING, COMMUNITY-->

<p>If you manage any Dynamics 365 Business Central clients where users sign in as Entra B2B guests (aka M365 Guest Users) you've probably hit this issue:&nbsp;<b>the built-in email connectors don't work properly for guest users.</b></p>

<p>The use of guest accounts in BC is becoming more common due to organisations with a multi-tenancy strategy or where companies are looking for&nbsp;very clear separation of data access &amp; governance. The expectation is simply that users email will just work in BC guest or not!&nbsp;&nbsp;</p><h3 style="text-align: left;">The Problem</h3>

<p>Business Central (2026 wave 1) ships with three email connector options:</p>

<ul>
<li><b>Current User</b> (built-in) - works great, but only for accounts native to the BC host tenant. If you're a guest user with a cross-tenant identity, BC can't send mail for you.</li>
<li><b>M365 / Shared Mailbox - </b>This is also dead-end for guest users, as they simply can't use or access other users or shared mailboxes in the tenancy where they are a guest.</li><li><b>SMTP</b> - sends messages using good old SMTP - which is as old as the internet itself! This is one way to deal with guest users, but can't meet a modern per-user approach.&nbsp;</li>
</ul>

<p>The result: the scope for guest users to send email is quite narrow, only SMTP. A key requirement of modern connected system is clarity of identity when communicating with colleagues, customers or vendors. Being able to send as yourself is an important capability!&nbsp;&nbsp;</p>

<h2>The Solution - Current User Email API</h2>

<p>The extension implements the same <b>"Current User" pattern</b> that BC uses natively - but via the Microsoft Graph API, which works regardless of whether you're a guest or a member.</p>

<p>Here's how it works:</p>

<ol>
<li><b>Admin sets up once</b> - create an Entra app registration with <code>Mail.Send</code> delegated permission, enter the details in BC. That's it for admin.</li>
<li><b>Each user consents once</b> - open the "Connect Current User Email API" page, click a button, sign in with your work account in the popup, approve access. Done.</li>
<li><b>Every email send works automatically</b> - compose dialog, customer statements, scheduled reports, background jobs, ISV extensions. The connector resolves the correct Graph token for whoever is sending at that moment.</li>
</ol><div><table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto;"><tbody><tr><td style="text-align: center;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEguBEvuRJSPJ7qTuQS9BF1S7R8-SQFdjBLq06zBl4vO3IcuHDnQFAEqLv9eqRz-gq2HUHDFKpcjo7_4B0rP2AGGCyhMQslurgvq0VWVVsufkyrWSGPkcL6d9JKZXWntrU8W_yo3Pdj1dxiUvV3HqG7GyLRVEs1Bi2lXU-RaWl3W94X_0fhGIfHm" style="margin-left: auto; margin-right: auto;"><img alt="" data-original-height="470" data-original-width="1084" height="278" src="https://blogger.googleusercontent.com/img/a/AVvXsEguBEvuRJSPJ7qTuQS9BF1S7R8-SQFdjBLq06zBl4vO3IcuHDnQFAEqLv9eqRz-gq2HUHDFKpcjo7_4B0rP2AGGCyhMQslurgvq0VWVVsufkyrWSGPkcL6d9JKZXWntrU8W_yo3Pdj1dxiUvV3HqG7GyLRVEs1Bi2lXU-RaWl3W94X_0fhGIfHm=w640-h278" width="640" /></a></td></tr><tr><td class="tr-caption" style="text-align: center;"><span style="text-align: left;">Email Setup Card with app registration details filled in...</span></td></tr></tbody></table></div><p>There is no per-user admin action required. No routing rules. No account-per-user management. One email account is registered with BC's email framework and set as the default. At send time, the connector looks up the current user's stored OAuth token and calls Graph as that user.</p>

<h3>The User Experience</h3>

<p>At present the users must access a consent page to confirm their connectin, In the next iteration I will aim to move closer to the 'current user' type experience so the users do not need to carry out this step and the necessary token for access to send email is managed from memory only and not stored at all. Currently the consent page shows a simple "Connect my Email" button. A popup opens, the user signs in with their normal work account, approves access, and the popup closes automatically. The page updates to show they're connected.</p><p></p><table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto;"><tbody><tr><td style="text-align: center;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEh3QTeX9zGX8rPjIeu4_25h220Sz9GnvOSBPsmbLF-ba6v6KlU_eUN7VmWAjuVgYIsLpuLFOMcy_3knP-McrzC-lFpmjc8mJ6ZlJFHjNiUv4kqXldquZK_AtB2evtdL6ZXqh6O94rL4yDFuFcG2exgfd8Z89KmMbKRIMFJclz7LrjM9OsXRVwN0" style="margin-left: auto; margin-right: auto;"><img alt="" data-original-height="300" data-original-width="1074" height="178" src="https://blogger.googleusercontent.com/img/a/AVvXsEh3QTeX9zGX8rPjIeu4_25h220Sz9GnvOSBPsmbLF-ba6v6KlU_eUN7VmWAjuVgYIsLpuLFOMcy_3knP-McrzC-lFpmjc8mJ6ZlJFHjNiUv4kqXldquZK_AtB2evtdL6ZXqh6O94rL4yDFuFcG2exgfd8Z89KmMbKRIMFJclz7LrjM9OsXRVwN0=w640-h178" width="640" /></a></td></tr><tr><td class="tr-caption" style="text-align: center;">1 click to connect to the email API&nbsp;</td></tr></tbody></table><p></p>

<h2>How It Works Under the Hood</h2>

<p>For those who want to know what's going on technically:</p>

<ul>
<li><b>OAuth 2.0 Authorization Code + PKCE</b> - the standard delegated flow. Each user authenticates as themselves and grants <code>Mail.Send</code> permission to the app.</li>
<li><b>Token storage in IsolatedStorage</b> - per-user (<code>DataScope::User</code>), private to each user. No other user or background task running as a different identity can access it.</li>
<li><b>Silent token refresh</b> - access tokens expire after about 60 minutes. The extension automatically refreshes them using the stored refresh token. Users don't need to re-consent unless they explicitly disconnect.</li>
<li><b>Graph API <code>POST /v1.0/me/sendMail</code></b> - the actual send. <code>/me</code> resolves to the authenticated user's mailbox, whether they're a guest or a member. The email arrives from their real work address.</li>
</ul>

<p>The architecture is simple: one fixed-GUID email account in BC's email framework, one row per user in a token tracking table, and the Graph call resolves the right identity at runtime via <code>UserSecurityId()</code>.</p><p>In the next version we will move to</p>

<h2>Built with AI, Reviewed by a Human</h2>

<p>The code was written by GitHub Copilot (Claude), with me prompting and testing. It's important to review AI generated code, especially for security. <a href="https://github.com/ajkauffmann" target="_blank">Arend-Jan Kauffmann</a> reviewed the app and identified several important improvements around token security, storage encryption, and BC platform best practices. That feedback is driving the next phase of development.</p>

<h2>What's Next</h2>

<p>The current release is a working proof of concept - Phase 1 and 2 are complete. Phase 3 is scoped and includes:</p>

<ul>
<li><b>Security hardening</b> - <code>SecretText</code> parameters, <code>[NonDebuggable]</code> attributes, encrypted storage for the client secret, and removing unnecessary token persistence</li>
<li><b>System Application adoption</b> - replacing raw <code>HttpClient</code> with BC's <code>Rest Client</code> module and evaluating the built-in <code>OAuth2</code> codeunit</li>
<li><b>Multi-tenancy support</b> - row-based setup for environments where guests come from multiple home tenancies that each need a separate Entra app registration</li>
<li><b>Email attachment support</b> - critical for BC where almost every email includes a file. The extension will handle inline attachments for small files and Graph upload sessions for files up to 30MB+</li>
</ul>

<h2>Try It / Contribute</h2>

<p>The extension is open source and available on GitHub: <a href="https://andy.ms/emailapi">https://andy.ms/emailapi</a><br /></p>

<p>It's a per-tenant extension (PTE) - you can deploy it to any BC SaaS environment. The <a href="https://github.com/andywingate/D365BC-guest-email-api/blob/main/QUICKSTART.md" target="_blank">QUICKSTART guide</a> walks through the full setup: Entra app registration, BC configuration, and user consent.</p>

<p>If you're hitting the guest email problem in your BC environment, give it a try. If you have feedback, ideas, or want to contribute - open an issue or a PR on GitHub.&nbsp;</p>

<h2>Resources</h2>

<ul>
<li><a href="https://github.com/andywingate/D365BC-guest-email-api" target="_blank">GitHub - D365BC-guest-email-api</a></li>
<li><a href="https://learn.microsoft.com/en-us/dynamics365/business-central/admin-how-setup-email" target="_blank">Microsoft Learn - Set up email in Business Central</a></li>
<li><a href="https://learn.microsoft.com/en-us/graph/api/user-sendmail" target="_blank">Microsoft Graph - sendMail API</a></li>
<li><a href="https://github.com/ajkauffmann/RestClientOAuth" target="_blank">AJ Kauffmann's RestClientOAuth library</a></li>
</ul>

<h2>What do you think?</h2>

<p>Connect or follow me on LinkedIn to get all my updates <a href="https://www.linkedin.com/in/andywingate/" target="_blank">Andrew Wingate | LinkedIn</a></p>

