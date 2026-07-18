# Wingate365 blog - Copilot instructions

This repository is the **Wingate365** blog: a custom Hugo static site published to `blog.wingate365.com` via GitHub Pages. Author: Andy Wingate (Microsoft MVP, Business Central).

These instructions apply to the whole repo. The most common task is **writing a new blog article** - the rules for that are below and must be followed exactly so posts build and render correctly.

## Repository facts

- Static site generator: **Hugo Extended** (custom self-contained theme in `layouts/` + `assets/`, no external theme, no Go modules).
- Content lives in `content/posts/` as one file per post, named `YYYY-MM-slug.md`.
- Permalinks: `hugo.toml` sets `posts = "/:year/:month/:slug"` with `[uglyURLs] posts = true`, so each post publishes to `/YYYY/MM/slug.html` (the legacy Blogger URL shape).
- Raw HTML is allowed in content (`markup.goldmark.renderer.unsafe = true`), so **migrated posts are HTML and that is fine**. All **new** posts must be written in **Markdown**.
- Build output goes to `public/`, which is **gitignored** and rebuilt by GitHub Actions on push - do not commit it. Do not hand-edit anything in `public/` - it is generated.

## How to write a new article

### 1. Create the file

Path: `content/posts/YYYY-MM-slug.md`, where `YYYY-MM` matches the intended publish date and `slug` is short, lowercase, hyphenated. The slug becomes the URL, so keep it stable and descriptive.

### 2. Front matter (YAML) - required schema

```yaml
---
title: "Post Title in Title Case"
date: 2026-07-18T09:00:00Z
lastmod: 2026-07-18T09:00:00Z
tags: ["businesscentral", "d365bc"]
hero: ""
heroCaption: ""
author: "Andy Wingate"
linkedin: ""
draft: true
---
```

Rules for each key:

- **title** - quoted string, Title Case. No trailing site name.
- **date** / **lastmod** - RFC3339 with `Z` (UTC), e.g. `2026-07-18T09:00:00Z`. `lastmod` may equal `date` on first publish.
- **tags** - array of lowercase, short tags. Reuse existing tags where possible (see below). No `images` tag.
- **hero** - optional image URL or local path. Leave `""` to auto-generate a branded gradient placeholder. If set, provide a real image; optionally set **heroCaption**.
- **author** - always `"Andy Wingate"`.
- **linkedin** - optional. A clean LinkedIn post URL (strip query string and trailing slash) to render the "Join the conversation" card at the foot of the post.
- **draft** - `true` while writing (excluded from normal builds). Set to `false` or remove when ready to publish.
- Do **not** add a `url` key on new posts - the permalink config derives the correct `/YYYY/MM/slug.html` from the date and filename automatically. (Migrated posts carry an explicit `url`; new ones must not.)

### 3. Body - Markdown

Write the body in standard Markdown: `## H2` / `### H3` headings (do not use `#` H1 - the title renders it), `**bold**`, `_italic_`, `-` bullet lists, `1.` numbered lists, `[text](url)` links, fenced code blocks with a language, and `> ` blockquotes. Raw HTML is permitted when Markdown cannot express something, but prefer Markdown.

Do not use em dashes or en dashes anywhere - use hyphens.

### 4. Existing tags

Reuse the established tag vocabulary rather than inventing near-duplicates. Common tags include: `businesscentral`, `d365bc`, `dynamics365`, `powerplatform`, `powerbi`, `ai`, `copilot`, `azure`, `graph`, `bcopensource`, `talks`, `vibe coding`. Check `content/posts/` for the current set before adding new tags.

## Build and preview (Windows PowerShell)

Hugo is installed via winget but is not on PATH by default. Prepend it for the session, then build or serve:

```powershell
$env:Path = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe;" + $env:Path
hugo server --disableFastRender -D       # local preview at http://localhost:1313 (-D includes drafts)
hugo --gc --minify                       # production build into public/ (drafts excluded)
```

To scaffold a new post with the correct front matter:

```powershell
hugo new posts/2026-07-my-slug.md
```

This uses `archetypes/posts.md`.

## Publishing checklist

1. `draft` removed or set to `false`.
2. `date` / `lastmod` correct; filename `YYYY-MM` matches the date.
3. Tags reuse existing vocabulary, all lowercase.
4. `hero` is either a real image URL (with optional caption) or left `""` for a placeholder.
5. `hugo --gc --minify` builds with no errors.
6. Commit the `content/` change (plus any new `static/` image). Do not commit `public/` - it is gitignored and rebuilt by GitHub Actions on push.

## House style

- No em/en dashes - hyphens only.
- Write in current-state voice; no "previously" or migration/changelog narrative unless asked.
- Keep headings scannable; lead with the point.
