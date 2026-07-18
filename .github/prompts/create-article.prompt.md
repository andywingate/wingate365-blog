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
- **Hero image** - Andy's go-to hero is the **logo(s) of the tools the post is about** (one logo for a single-tool post, two logos in an `A -> B` layout for a migration or comparison). These are generated on-brand with `scripts/new-hero.ps1` (see step 2.5). Alternatively a real image URL / local path under `static/images/`, or leave blank (`""`) for the auto-generated branded placeholder. If a real image is given, offer to set `heroCaption`. Ask which tools/logos the post is about so you can generate the hero.

Always tell Andy up front that drafting the LinkedIn post text is part of this workflow (step 3.5) - do not silently skip it or wait to be asked.

If Andy already gave a draft or clear brief, do not over-interview - infer sensible defaults and confirm briefly.

### 2. Create the post file

- Prefer scaffolding with the archetype so the front matter schema stays in sync:

  ```powershell
  $env:Path = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe;" + $env:Path
  hugo new posts/YYYY-MM-slug.md
  ```

- Path: `content/posts/YYYY-MM-slug.md`. The `YYYY-MM` in the filename **must** match the month in the `date` front matter (the permalink is derived from the date). Slug short, lowercase, hyphenated.
- Front matter per the schema in `.github/copilot-instructions.md`. Set `draft: true` while drafting. Set `lastmod` equal to `date` on first publish. Do **not** add a `url` key.
- Leave the `linkedin` key `""` for now - the LinkedIn post does not exist yet at this point, so there is no URL to put there. It gets filled in during step 3.5.
- Write the body in **Markdown** (H2/H3 headings, bold, lists, links, fenced code with a language). No H1. No em/en dashes - hyphens only.

### 2.5 Generate the hero image (logo-led)

Andy's house style for heroes is the logo(s) of the tools the post covers, on the bold BC gradient - it reads instantly and reshares well on LinkedIn. Full rules are in the "Hero images - logo-led" part of `static/brand-guide.html`. Generate one with the script rather than hand-rolling SVG:

```powershell
# two-logo migration / comparison hero (A -> B)
./scripts/new-hero.ps1 -Slug my-post-slug -Icon blogger,github

# single-tool hero
./scripts/new-hero.ps1 -Slug my-post-slug -Icon microsoftpowerautomate
```

- Icon slugs come from https://simple-icons.org (lowercase, no spaces). The script fetches the CC0 mark and embeds it, writing `static/images/heroes/<slug>.svg`.
- Then set `hero: "/images/heroes/<slug>.svg"` in the front matter.
- Keep heroes logo-led: **no** headline/label text baked into the image (the `-Title`/`-Label` options exist but stay off by default). Default theme is the blue gradient; `-Theme light` is the rare exception.
- If the post is not about a specific tool, leave `hero: ""` for the branded placeholder.

### 3. Preview and validate

Do not just offer to build - actually build and open the preview for Andy:

1. Run a plain `hugo --gc -D` build first (sync, foreground) to confirm there are no build errors before starting a server.
2. Start the dev server in the **background** (async):

   ```powershell
   $env:Path = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe;" + $env:Path
   hugo server --disableFastRender -D
   ```

3. Read the actual port from the server output (`Web Server is available at http://localhost:PORT/`) - port 1313 is often already in use by a leftover session, so Hugo will pick a different free port. Do not assume 1313.
4. **Do not guess the post URL from the filename slug.** Hugo slugifies the post `title`, not the filename - e.g. a file named `2026-07-ai-led-blog-migration.md` with title "How AI Rebuilt This Blog" publishes at `/2026/07/how-ai-rebuilt-this-blog-....html`, not `/2026/07/ai-led-blog-migration.html`. Get the real link by opening the home page (`http://localhost:PORT/`) first and reading the featured post link from the page snapshot, then navigate to that exact URL.
5. Open the post directly in the integrated browser tool (reuse an existing page if one is already open on that host) so Andy sees the rendered article without having to do it themselves.

The **posts archive** page and the **home** feed are generated automatically from content on build - no manual update needed. Confirm on preview:

- The post appears in the archive and on the home page.
- The **"Join the conversation" LinkedIn module** shows at the foot of the article (it renders only when `linkedin` is set).
- The hero image (real or placeholder) renders.

Fix any build errors before continuing.

### 3.5 Draft the LinkedIn post text

This step is mandatory, not optional - always do it, do not wait to be asked:

- Write a short LinkedIn-style post (a few sentences to a short paragraph, first-person, matching Andy's voice) that teases the article and links to it. LinkedIn posts read better with a hook line, 2-4 short lines of substance or a mini-list, and a soft call to action - not a summary of every section.
- Show the drafted text to Andy in the chat response as its own clearly labelled block, alongside the article preview, so he can edit or approve it before posting anywhere.
- Once Andy has posted it on LinkedIn himself and shares the resulting post URL back, clean it (strip query string and trailing slash) and set it as the `linkedin` front matter value so the "Join the conversation" module renders. Rebuild to confirm it shows.
- If Andy says there will be no LinkedIn post for this article, leave `linkedin` as `""` and move on.

### 4. Publish when Andy confirms

- Set `draft: false` (or remove it). If this is a later edit rather than first publish, bump `lastmod` to the edit date.
- Run `hugo --gc --minify` to regenerate the site locally and confirm a clean build.
- Commit the **`content/`** change (plus any `static/` image you added) with a clear message. Do **not** commit `public/` - it is gitignored and rebuilt by GitHub Actions on push. Only push when Andy asks; the deploy runs automatically on push.

## Guardrails

- Match the tone of existing posts: practical, direct, first-person, Business Central / Dynamics 365 / Microsoft cloud focused.
- Reuse existing tags rather than inventing near-duplicates.
- Never hand-edit files in `public/` - always regenerate with Hugo.
