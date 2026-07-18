---
title: "Graph API Email account types for D365 BC"
date: 2026-06-07T10:13:30Z
lastmod: 2026-06-07T10:22:36Z
url: "/2026/06/graph-api-email-account-types-for-d365.html"
tags: ["d365bc", "bcopensource", "graph"]
hero: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjKooGzo3-E2Nq216oqWj1NkMaLbljv-vRYda3Kvn0EdZSjxPVyLLhj4HvsfIY-000zA2t2eqi30XRNvJRRPKP_i4InEFXk9wlna7Kz4Ck7blNpYEt9tEiLabiLFkJXX-SwCYkcm8QuJzwHVBM4yV2HAtph0U1ysQEB4JCFnALH-oIDAs-7v69y/w640-h316/2026-06-07_10h54_20.png"
author: "Andy Wingate"
---
<p></p><div style="text-align: center;"><span style="text-align: left;">&nbsp;</span></div><p></p>


<div class="post-note">
  <strong>Previous post in this series:</strong> <a href="https://blog.wingate365.com/2026/04/fixing-email-for-guest-users-in-d365.html">Fixing Email for Guest Users in D365 Business Central</a>
</div>

<p>Back in April I wrote about a long-standing gap in Business Central: <strong>guest users can't send email from their own home tenancy address</strong>. BC's built-in connectors simply don't work for Entra B2B guests. I built an open source extension to fix that, and Phase 3 is now complete - with some significant changes since that first post.</p>

<p>If you haven't read the original post, the link above is worth a quick read for context. This post covers what's changed and where it's heading next.</p>

<h2>What's Changed</h2>

<p>The original proof of concept used an <strong>OAuth 2.0 Authorization Code + PKCE delegated flow</strong> - meaning each user had to go through a consent step to connect their account. It worked, but it wasn't ideal. The current app has rearchitected the approach significantly.</p>

<p>The extension now uses <strong>Client Credentials (app-only) authentication</strong> via AJ Kauffmann's <a href="https://github.com/ajkauffmann/RestClientOAuth">RestClientOAuth</a> library. No browser popup, no per-user consent, no token storage per user. An admin registers one or more Entra app registrations - one per home domain - and that's the entire setup. Every user then sends email automatically.</p>

<p>This is a fundamentally cleaner model for enterprise environments. There is nothing for end users to do.</p>

<h2>What Phase 3 Delivers</h2>

<ul>
  <li>âœ… Token security hardened - <code>SecretText</code>, <code>[NonDebuggable]</code>, encrypted <code>IsolatedStorage</code></li>
  <li>âœ… Full multi-tenancy support - one App Registration per home domain, matched automatically at send time</li>
  <li>âœ… User mailbox and shared mailbox support via Graph API</li>
  <li>âœ… CC, BCC and attachment support</li>
</ul>

<h2>How It Works Now</h2>

<p>The architecture is straightforward. A single email account called <strong>Current User (Microsoft Graph)</strong> is registered with BC's email framework and set as the default once by an admin.</p><p></p><div class="separator" style="clear: both; text-align: center;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEijnnTJ0zYu8mtcPppfECYwKWBonZpxBYDXhxV3Zs_BLVA6eMU3QzoEjmtuKo8T6uOtTHYqKmZbxfd203obRCDfJYBtXd2UxunXt9J_jyEdXJ1I-d6Wk3jAq0fZSmCNczdwvICaDvRx3aTHrkKeZEJ6JIu4iXmn7gHLzy0Yr5zVRYQ5GGM_CvL7" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="1160" data-original-width="1472" height="504" src="https://blogger.googleusercontent.com/img/a/AVvXsEijnnTJ0zYu8mtcPppfECYwKWBonZpxBYDXhxV3Zs_BLVA6eMU3QzoEjmtuKo8T6uOtTHYqKmZbxfd203obRCDfJYBtXd2UxunXt9J_jyEdXJ1I-d6Wk3jAq0fZSmCNczdwvICaDvRx3aTHrkKeZEJ6JIu4iXmn7gHLzy0Yr5zVRYQ5GGM_CvL7=w640-h504" width="640" /></a></div><p>At send time, the connector reads the current user's BC identity, decodes their home domain, and selects the matching App Registration. Internal users send as <code>user@contoso.com</code>; B2B guests send as <code>user@their-domain.com</code>. No routing flags, no per-user config, no ongoing admin work.</p>

<h3>Multi-Tenancy in Practice</h3>

<p>As more larger organisations adopt Business Central, we're increasingly seeing multi-tenant environments. Organisations with complex structures, subsidiaries, or shared service arrangements often have BC users from more than one Entra tenancy. This is where the guest email problem really bites - and where this extension adds the most value.</p>

<p>The setup for a multi-tenant environment is an <strong>admin-only, one-time task</strong>: create an App Registration in Azure for each home domain you need to support, enter the details in BC's App Registrations page, and you're done. The Domain Filter on each registration tells the connector which users it applies to. The connector does the rest automatically at send time.</p><table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto;"><tbody><tr><td style="text-align: center;"><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEioZSRlo9nq-auplAy7o9pOhPzbY3huQwJ1zllOY7anB6UQgxlpBKTIPL6d1pK6CriAorExpLGCRZybIZdc6TqRAL4j1SH31_dOca_7veNkNatev2kQ6W3NfbrsDzC90qoGaw3PEXOBC2Pi3_ZpfQ_bqrM666VrDEor67XbcBJLiRMQB4CG44CJ/s1235/2026-06-07_10h21_17.png" imageanchor="1" style="margin-left: auto; margin-right: auto;"><img border="0" data-original-height="259" data-original-width="1235" height="134" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEioZSRlo9nq-auplAy7o9pOhPzbY3huQwJ1zllOY7anB6UQgxlpBKTIPL6d1pK6CriAorExpLGCRZybIZdc6TqRAL4j1SH31_dOca_7veNkNatev2kQ6W3NfbrsDzC90qoGaw3PEXOBC2Pi3_ZpfQ_bqrM666VrDEor67XbcBJLiRMQB4CG44CJ/w640-h134/2026-06-07_10h21_17.png" width="640" /></a></td></tr><tr><td class="tr-caption" style="text-align: center;">Email Accounts page showing Current User (Microsoft Graph) set as default<br /></td></tr></tbody></table><br /><p><table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto;"><tbody><tr><td style="text-align: center;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEgk0ce_iCN--yhgbcWu57Gyld5LtHy3b0eVWmx2DN3KG6yHa70kuGDdb1zM4vWsgbfzJZoRjx5G4N0tdb-DLZ-fqZK1Zo7ch6Z89BRonKR_qUSnN7B7_OKHVpuqzlNphZgFzrGvUWKYeetcxEBc_itIPjUnnacKSobEwtoXDjb3V3zUUYW8EoY0" style="margin-left: auto; margin-right: auto;"><img alt="" data-original-height="300" data-original-width="1230" height="156" src="https://blogger.googleusercontent.com/img/a/AVvXsEgk0ce_iCN--yhgbcWu57Gyld5LtHy3b0eVWmx2DN3KG6yHa70kuGDdb1zM4vWsgbfzJZoRjx5G4N0tdb-DLZ-fqZK1Zo7ch6Z89BRonKR_qUSnN7B7_OKHVpuqzlNphZgFzrGvUWKYeetcxEBc_itIPjUnnacKSobEwtoXDjb3V3zUUYW8EoY0=w640-h156" width="640" /></a></td></tr><tr><td class="tr-caption" style="text-align: center;">App Registrations page - multiple tenancy support</td></tr></tbody></table><br /></p>

<h2>Built with AI</h2>

<p>As with the earlier phases, the code was written almost entirely by <strong>GitHub Copilot (Claude Sonnet)</strong>, with me providing direction, testing, and debugging. The Lessons Learned file documents the journey in detail - including the diagnostics approach that eventually tracked down the SingleInstance/TryFunction issue.</p>

<p>AI-assisted development is genuinely fast for AL extension work, but it absolutely requires someone who understands the platform to review what's being generated. The subtle edge cases - like the collectible error behaviour described above - are not something an AI is likely to get right first time without being pointed at the right documentation.</p>

<p>Big thanks to <strong><a href="https://github.com/ajkauffmann">Arend-Jan Kauffmann</a></strong> for the RestClientOAuth library that underpins the entire OAuth flow, and for his code review and feedback on the security implementation.</p>

<h2>What's Next</h2>

<ul>
  <li>âœ… Submit to <strong>AppSource as a free app</strong> - the big next step</li>
  <li>âœ… System Application module adoption</li>
</ul>

<p>Publishing to AppSource is the next challenge.</p>

<h2>Try It / Contribute</h2>

<p>The extension is open source (MIT licence) and available on GitHub:</p>

<p><a href="https://github.com/andywingate/D365BC-graph-api-email"><strong>github.com/andywingate/D365BC-graph-api-email</strong></a></p>

<p>The <a href="https://github.com/andywingate/D365BC-graph-api-email/blob/main/QUICKSTART.md">QUICKSTART guide</a> walks through the full setup: creating the Entra app registration, deploying the extension to BC, and configuring the App Registrations. If you're running BC in a multi-tenant environment and guest email is a problem, it's worth a look.</p>

<p>Feedback, issues, and pull requests are all welcome on GitHub.</p>

<h2>Resources</h2>

<ul>
  <li><a href="https://github.com/andywingate/D365BC-graph-api-email">GitHub - D365BC-graph-api-email</a></li>
  <li><a href="https://github.com/andywingate/D365BC-graph-api-email/blob/main/QUICKSTART.md">QUICKSTART setup guide</a></li>
  <li><a href="https://github.com/ajkauffmann/RestClientOAuth">AJ Kauffmann's RestClientOAuth library</a></li>
  <li><a href="https://learn.microsoft.com/en-us/dynamics365/business-central/admin-how-setup-email">Microsoft Learn - Set up email in Business Central</a></li>
  <li><a href="https://learn.microsoft.com/en-us/graph/api/user-sendmail">Microsoft Graph - sendMail API reference</a></li>
  <li><a href="https://blog.wingate365.com/2026/04/fixing-email-for-guest-users-in-d365.html">Previous post - Fixing Email for Guest Users in D365 BC</a></li>
</ul>
