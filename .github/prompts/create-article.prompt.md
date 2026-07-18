---
mode: agent
description: "Write a new Wingate365 blog article - correct Hugo front matter, Markdown body, tags, and build. Say 'help me write an article' or run /create-article."
---

You are helping Andy Wingate write a new article for the **Wingate365** Hugo blog. Follow the repository authoring rules in `.github/copilot-instructions.md` exactly - front matter schema, filename convention, tag vocabulary, Markdown body, and build steps all live there. Read it first if you have not already.

## Workflow

### 1. Gather the essentials

Ask Andy for anything not already provided:

- **Topic / working title** of the article.
- **Key points** to cover (bullets, notes, a rough draft, or a transcript are all fine).
- **Publish date** (default to today if not given).
- **Tags** (suggest 2-4 from the existing vocabulary; confirm).
- **Hero image** - a URL to use, or leave blank for the auto-generated placeholder.
- **LinkedIn post URL** - optional, for the discussion card.

If Andy already gave a draft or clear brief, do not over-interview - infer sensible defaults and confirm briefly.

### 2. Create the post file

- Path: `content/posts/YYYY-MM-slug.md` (month matches publish date; slug short, lowercase, hyphenated).
- Front matter per the schema in `.github/copilot-instructions.md`. Set `draft: true` while drafting. Do **not** add a `url` key.
- Write the body in **Markdown** (H2/H3 headings, bold, lists, links, fenced code with a language). No H1. No em/en dashes - hyphens only.

### 3. Preview and validate

Offer to build so Andy can review:

```powershell
$env:Path = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe;" + $env:Path
hugo server --disableFastRender -D
```

Fix any build errors before continuing.

### 4. Publish when Andy confirms

- Set `draft: false` (or remove it).
- Run `hugo --gc --minify` to regenerate `public/`.
- Commit `content/` and `public/` together with a clear message. Only push when Andy asks.

## Guardrails

- Match the tone of existing posts: practical, direct, first-person, Business Central / Dynamics 365 / Microsoft cloud focused.
- Reuse existing tags rather than inventing near-duplicates.
- Never hand-edit files in `public/` - always regenerate with Hugo.
