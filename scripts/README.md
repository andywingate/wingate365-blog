# scripts

Utility PowerShell scripts for maintaining the blog. These are **not** part of the
Hugo build (Hugo only processes `content/`, `layouts/`, `assets/`, `static/`), so
they are safe to keep in the repo.

Run from anywhere; each resolves the repo root from its own location.

| **Script** | **Purpose** |
|---|---|
| `migrate-blogger-posts.ps1` | Convert the Blogger Atom export into Hugo posts under `content/posts`. Classifies posts (Microsoft/tech/BC + brewing), preserves original URLs via `url` front matter, and promotes the first Blogger-hosted image to `hero`. Idempotent - clears and rewrites `content/posts/*.md` (except `_index.md`). Set the `$Feed` path at the top first. |
| `tag-untagged-posts.ps1` | Add tags to posts that have none, derived from title/content keywords using the blog's lowercase tag vocabulary. Leaves already-tagged posts untouched. |
| `lowercase-tags.ps1` | Normalise every post's `tags:` array to lowercase. |
| `find-hero-captions.ps1` | Strip leftover Blogger caption-table markup from migrated post bodies. |

## Notes

- The Blogger export lives outside the repo (e.g. `c:\AI\Blog Migration\...\feed.atom`).
- Always read the Atom XML with `[System.Xml.XmlDocument].Load()`, not
  `Get-Content -Raw` (PowerShell 5.1 reads as ANSI and mangles UTF-8 emoji/£).
- Rebuild after running: `hugo --gc --minify`.
