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
- **Tags** (suggest 2-4 from the existing vocabulary; confirm). Before suggesting, skim `content/posts/` (or `/tags/`) to see the tags already in use, so you reuse them rather than invent near-duplicates.
- **Hero image** - a real image URL (or a local path under `static/images/`), or leave blank (`""`) for the auto-generated branded placeholder. If a real image is given, offer to set `heroCaption`.
- **LinkedIn post URL** - the post that will carry the comment thread. Optional, but if omitted the "Join the conversation" module will **not** render at the foot of the article (see step 3). Clean it before use: strip the query string and any trailing slash.

If Andy already gave a draft or clear brief, do not over-interview - infer sensible defaults and confirm briefly.

### 2. Create the post file

- Prefer scaffolding with the archetype so the front matter schema stays in sync:

  ```powershell
  $env:Path = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe;" + $env:Path
  hugo new posts/YYYY-MM-slug.md
  ```

- Path: `content/posts/YYYY-MM-slug.md`. The `YYYY-MM` in the filename **must** match the month in the `date` front matter (the permalink is derived from the date). Slug short, lowercase, hyphenated.
- Front matter per the schema in `.github/copilot-instructions.md`. Set `draft: true` while drafting. Set `lastmod` equal to `date` on first publish. Do **not** add a `url` key.
- Set the `linkedin` key (cleaned URL) so the discussion module renders. Leave it `""` only if there is genuinely no LinkedIn post.
- Write the body in **Markdown** (H2/H3 headings, bold, lists, links, fenced code with a language). No H1. No em/en dashes - hyphens only.

### 3. Preview and validate

Offer to build so Andy can review:

```powershell
$env:Path = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe;" + $env:Path
hugo server --disableFastRender -D
```

The **posts archive** page and the **home** feed are generated automatically from content on build - no manual update needed. Confirm on preview:

- The post appears in the archive and on the home page.
- The **"Join the conversation" LinkedIn module** shows at the foot of the article (it renders only when `linkedin` is set).
- The hero image (real or placeholder) renders.

Fix any build errors before continuing.

### 4. Publish when Andy confirms

- Set `draft: false` (or remove it). If this is a later edit rather than first publish, bump `lastmod` to the edit date.
- Run `hugo --gc --minify` to regenerate the site locally and confirm a clean build.
- Commit the **`content/`** change (plus any `static/` image you added) with a clear message. Do **not** commit `public/` - it is gitignored and rebuilt by GitHub Actions on push. Only push when Andy asks; the deploy runs automatically on push.

## Guardrails

- Match the tone of existing posts: practical, direct, first-person, Business Central / Dynamics 365 / Microsoft cloud focused.
- Reuse existing tags rather than inventing near-duplicates.
- Never hand-edit files in `public/` - always regenerate with Hugo.
