---
title: "Graph API email account types for D365"
date: 2026-06-12T09:00:00Z
lastmod: 2026-06-12T09:00:00Z
slug: "graph-api-email-account-types-for-d365"
tags: ["Business Central", "Microsoft Graph", "Email"]
author: "Andy Wingate"
---

When you set up email in Business Central using the Microsoft Graph connector, the
account type you choose matters more than it first appears. Here's a quick reference.

## Account types

Business Central exposes a few different email account options:

- **Current User** - sends as the signed-in user via delegated Graph permissions.
- **Shared Mailbox** - sends from a shared mailbox the user has rights to.
- **Microsoft 365** - an application-level account using application permissions.

## Why this matters

The permission model differs between delegated and application flows:

> Delegated permissions act on behalf of a user. Application permissions act as the
> app itself, with no signed-in user.

```powershell
# Grant Mail.Send application permission to the BC service principal
Connect-MgGraph -Scopes "Application.ReadWrite.All"
```

| **Account type** | **Permission** | **Best for** |
|---|---|---|
| **Current User** | Delegated | Individual users |
| **Shared Mailbox** | Delegated | Teams / departments |
| **Microsoft 365** | Application | Automated notifications |

That's the short version - more detail to follow once I've finished migrating the blog.
