# wingate365-blog

Backend for [blog.wingate365.com](https://blog.wingate365.com/) - a Hugo static site
deployed to GitHub Pages.

## Stack

- **Generator:** Hugo (extended)
- **Hosting:** GitHub Pages via GitHub Actions
- **Content:** Markdown in `content/posts/`
- **Theme:** custom, self-contained (no external theme dependency)

## Local development

Requires [Hugo extended](https://gohugo.io/installation/) 0.164.0 or later.

```powershell
hugo server
```

Then open http://localhost:1313/.

## Structure

| **Path** | **Purpose** |
|---|---|
| `hugo.toml` | Site configuration |
| `content/posts/` | Blog posts (one Markdown file each) |
| `content/about.md` | About page |
| `layouts/` | Custom templates |
| `assets/css/main.css` | Site styling |
| `static/` | Static files (CNAME, favicon) |
| `.github/workflows/deploy.yml` | Build and deploy pipeline |

## URLs

Legacy Blogger URLs are preserved via the permalink pattern
`/:year/:month/:slug.html`.

## Build for production

```powershell
hugo --gc --minify
```
