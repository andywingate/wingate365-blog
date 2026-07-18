# wingate365-blog

Source for [blog.wingate365.com](https://blog.wingate365.com/), Andy Wingate's blog on
Business Central, Dynamics 365 and Microsoft cloud technology. Built with
[Hugo](https://gohugo.io/) and published to GitHub Pages.

The site began life on Blogger; this repo is a full migration to a self-hosted Hugo
build with a custom, dependency-free theme.

## Stack

- **Generator:** Hugo Extended 0.164.0+
- **Theme:** custom and self-contained - all templates live in `layouts/`, all styling
  in `assets/css/main.css`. No external theme, no Hugo modules, no Go toolchain required.
- **Hosting:** GitHub Pages, built and deployed by `.github/workflows/deploy.yml` on
  every push to `main`.
- **Domain:** `blog.wingate365.com` (custom domain via `static/CNAME`).

## Content model

- Posts live in `content/posts/` as one Markdown file per post, named
  `YYYY-MM-slug.md`. Front matter schema (title, date, tags, hero, author, linkedin,
  draft, etc.) is defined in `archetypes/posts.md`.
- Migrated Blogger posts keep their original HTML body and explicit `url` front matter
  to preserve their exact legacy address. New posts are written in Markdown and never
  set `url`.
- Permalinks (`hugo.toml`) are configured as `/:year/:month/:slug` with `uglyURLs` on
  for posts, so new posts publish to the same `/YYYY/MM/slug.html` shape Blogger used.

## Theme features

- Light/dark mode toggle, persisted to `localStorage` and respecting
  `prefers-color-scheme`.
- Client-side search with no external dependencies (`assets/js/search.js`), powered by
  a generated JSON index (`layouts/index.json`).
- Branded hero images for every post: a real image, or an auto-generated logo-led SVG
  placeholder (`scripts/new-hero.ps1`).
- A unified comments experience that links out to the post's LinkedIn discussion
  thread rather than hosting a comments widget.
- Posts archive with a year/month filter navigation.
- [GoatCounter](https://www.goatcounter.com/) for privacy-friendly page view
  analytics, configured via `params.analytics.goatcounter` in `hugo.toml` and loaded
  in `layouts/partials/head.html`.

## Repository structure

| **Path** | **Purpose** |
|---|---|
| `hugo.toml` | Site configuration: permalinks, menus, taxonomies, params |
| `content/posts/` | Blog posts (one Markdown file each) |
| `content/about.md`, `content/whatsapp.md` | Standalone top-level pages |
| `archetypes/posts.md` | Front matter schema for new posts (`hugo new posts/...`) |
| `layouts/` | Custom templates (base, partials, list/single views) |
| `assets/css/main.css` | Site styling and design tokens |
| `assets/js/search.js` | Client-side search |
| `static/` | Static files served as-is (CNAME, favicon, brand pages, hero images) |
| `scripts/` | One-off PowerShell utilities for content maintenance (see `scripts/README.md`) |
| `.github/workflows/deploy.yml` | Build and deploy pipeline to GitHub Pages |
| `.github/copilot-instructions.md` | Article authoring conventions for AI-assisted writing |

## Deployment

Every push to `main` triggers `.github/workflows/deploy.yml`, which builds the site
with Hugo and publishes the `public/` output to GitHub Pages. `public/` itself is
gitignored and never committed - it is entirely a build artifact.

## Analytics

Page views are tracked with [GoatCounter](https://www.goatcounter.com/), a
privacy-friendly, cookie-free analytics service. The tracking endpoint is set once in
`hugo.toml` under `params.analytics.goatcounter` and injected by
`layouts/partials/head.html`. The script is skipped automatically when running
`hugo server` locally, so drafts and local previews are never counted. Dashboard:
`https://wingate365.goatcounter.com`.
