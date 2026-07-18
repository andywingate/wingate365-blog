# Wingate365 Brand and Style Guide

The single reference for the Wingate365 blog: colour, typography, voice, and article
conventions. Use this at the start of any AI session that writes articles, designs a
component, generates an image, or produces any Wingate365-branded output.

Wingate365 is the personal blog of Andy Wingate - Microsoft MVP for Business Central.
The tone is a practical field notebook: real problems, real fixes, written by a
practitioner who has sat on both the customer and partner side of a Dynamics
implementation.


## 1. Brand personality

| **Trait** | **What it means for output** |
|---|---|
| **Practitioner, not marketer** | First-person, hands-on, "here is what I did and why". No sales language. |
| **Clear over clever** | Short sentences. Plain UK English. Explain the fix, then the context. |
| **Warm and human** | The blog has a personality. The Copper accent (below) is the visual signal of this - it is what sets Wingate365 apart from a cold corporate deck. |
| **Authoritative but generous** | Confident because the experience is real, but always sharing, never gatekeeping. |
| **Technical, current** | Business Central, Dynamics 365, Microsoft cloud, and the occasional off-topic tinkering (homelab, brewing). |


## 2. Relationship to the Venture palette (important)

The blog historically borrowed the Venture Systems Group blues (`#12212E`, `#336687`).
Wingate365 is a **personal brand** and must read as distinct from Venture. The divergence
is deliberate and rests on two moves:

1. **A warmer, deeper foundation.** The primary blue shifts from Venture's `#336687`
   to **Steel Blue `#3D6B8F`** (drawn from the Precision set), and the dark anchor
   deepens to **Deep Ink `#0F1E2A`**.
2. **A signature warm accent.** Venture is entirely cool blue. Wingate365 introduces
   **Copper `#B87333`** as its signature accent for calls to action, active states, and
   emphasis. This single warm tone is the fastest visual cue that a page is Wingate365,
   not Venture.

Never present Wingate365 output using the Venture gradient `#12212E -> #336687` as the
hero identity. Use the Wingate365 primary gradient defined below.


## 3. Colour palette

### 3.1 Foundation (cool, authoritative)

These carry most of the visual weight: backgrounds, headings, body text, links.

| **Name** | **Hex** | **Role** |
|---|---|---|
| **Deep Ink** | `#0F1E2A` | Darkest anchor. Headings on light, dark-mode backgrounds, primary gradient start. |
| **Steel Blue** | `#3D6B8F` | Primary brand blue. Links, active nav, section labels, gradient end. |
| **Sky** | `#6FB0D4` | Bright readable blue. Dark-mode links, light accents, hover on dark. |
| **Mist Blue** | `#8CC7E3` | Subtle fills, quiet badges, supporting text on dark panels. |

### 3.2 Signature accent (the divergence marker - warm)

| **Name** | **Hex** | **Role** |
|---|---|---|
| **Copper** | `#B87333` | Signature accent. Primary CTAs, "read more", highlight underlines, active/emphasis. |
| **Copper Deep** | `#9A5E27` | Hover and pressed state for Copper elements. |

Use Copper sparingly - it is a spark, not a wash. One or two Copper elements per view.

### 3.3 Extended and semantic (Precision set)

Mixed into the palette for callouts, diagrams, tags, and multi-series data. All share a
cool, authoritative base that sits happily next to the foundation blues.

| **Name** | **Hex** | **Semantic role** |
|---|---|---|
| **Forest** | `#2E7D5A` | Success, tips, "what worked", positive results, RAG green. |
| **Steel Blue** | `#3D6B8F` | Neutral data series, authority, depth. |
| **Burgundy** | `#8B2E52` | Warnings, gotchas, breaking changes, deprecations, RAG red. |
| **Slate** | `#5B5EA6` | Info, notes, side commentary, secondary accent. |
| **Copper** | `#B87333` | Caution, "heads up", at-risk, RAG amber. |
| **Sage** | `#6A8A7E` | Muted, quiet callouts, secondary data. |

### 3.4 Neutrals

| **Name** | **Hex (light)** | **Hex (dark)** | **Role** |
|---|---|---|---|
| **Paper / Night** | `#FFFFFF` | `#0E1720` | Page background |
| **Mist / Panel** | `#F4F7FA` | `#16232F` | Subtle panels, cards, code blocks |
| **Cloud / Line** | `#E2E8EE` | `#24333F` | Borders and dividers |
| **Body text** | `#1A2530` | `#D7E0E7` | Paragraph text |
| **Muted text** | `#5A6B78` | `#8FA3B1` | Meta, captions, secondary |

### 3.5 Gradients

- **Primary gradient** (hero identity): `linear-gradient(135deg, #0F1E2A 0%, #3D6B8F 100%)`
- **Cool gradient** (subtle bands): `linear-gradient(135deg, #3D6B8F 0%, #6FB0D4 100%)`
- **Signature band** (thin accent rule only): `linear-gradient(90deg, #3D6B8F, #B87333)`

### 3.6 Hero placeholder gradient pairs

The six per-post placeholder gradients (used when a post has no hero image). These mix
the foundation and Precision sets so auto-generated cards feel on-brand and varied:

1. `#0F1E2A` -> `#3D6B8F`  (Deep Ink to Steel)
2. `#3D6B8F` -> `#6FB0D4`  (Steel to Sky)
3. `#3D6B8F` -> `#5B5EA6`  (Steel to Slate)
4. `#2E7D5A` -> `#6A8A7E`  (Forest to Sage)
5. `#5A3A1C` -> `#B87333`  (Umber to Copper - the warm one)
6. `#8B2E52` -> `#5B5EA6`  (Burgundy to Slate)


## 4. CSS tokens (ready to paste)

These map directly to the variables in `assets/css/main.css`. Apply this block to move
the site from the legacy Venture blues to the Wingate365 palette.

```css
:root {
  /* Foundation */
  --ink:            #0F1E2A;
  --steel:          #3D6B8F;
  --sky:            #6FB0D4;
  --mist-blue:      #8CC7E3;

  /* Signature accent */
  --copper:         #B87333;
  --copper-deep:    #9A5E27;

  /* Extended / semantic */
  --forest:         #2E7D5A;
  --burgundy:       #8B2E52;
  --slate-accent:   #5B5EA6;
  --sage:           #6A8A7E;

  /* Light theme roles */
  --bg:             #ffffff;
  --bg-subtle:      #f4f7fa;
  --bg-card:        #ffffff;
  --text:           #1a2530;
  --text-muted:     #5a6b78;
  --heading:        #0f1e2a;
  --accent:         #3d6b8f;   /* links, primary */
  --accent-strong:  #2c5271;   /* link hover */
  --cta:            #b87333;   /* call to action */
  --cta-hover:      #9a5e27;
  --border:         #e2e8ee;

  --gradient-primary: linear-gradient(135deg, #0F1E2A 0%, #3D6B8F 100%);
}

[data-theme="dark"] {
  --bg:            #0e1720;
  --bg-subtle:     #16232f;
  --bg-card:       #16232f;
  --text:          #d7e0e7;
  --text-muted:    #8fa3b1;
  --heading:       #f1f6f9;
  --accent:        #6fb0d4;
  --accent-strong: #8cc7e3;
  --cta:           #cf8a4a;   /* Copper lifts slightly on dark for contrast */
  --cta-hover:     #e0a061;
  --border:        #24333f;
}
```

Notes:
- Links and primary UI use `--accent` (Steel Blue). Calls to action, "Read post", and
  emphasis underlines use `--cta` (Copper). Keep the two roles distinct.
- On dark backgrounds Copper is lightened to `#CF8A4A` so it stays legible.


## 5. Typography

**Figtree** is the brand typeface for everything - headings, body, and UI. It is loaded
from Google Fonts, weights 400, 500, 600, 700, 800.

```html
<link rel="stylesheet"
  href="https://fonts.googleapis.com/css2?family=Figtree:wght@400;500;600;700;800&display=swap">
```

Fallback stack:
`"Figtree", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif`

Code uses a system mono stack:
`"SFMono-Regular", "Cascadia Code", Consolas, "Liberation Mono", Menlo, monospace`

### 5.1 Weights and usage

| **Element** | **Weight** | **Notes** |
|---|---|---|
| Brand wordmark / display headings | 800 | Tight tracking, `letter-spacing: -0.02em` |
| H1, H2, H3 | 600-700 | `letter-spacing: -0.015em`, `line-height: 1.25` |
| Body | 400 | `1.0625rem`, `line-height: 1.7` |
| Emphasis / labels / nav | 600 | |
| Eyebrows / section labels | 700 | Uppercase, `letter-spacing: 0.08em` |

### 5.2 Type scale (rem)

| **Token** | **Size** | **Use** |
|---|---|---|
| Display | 2.6 - 3.4 | Hero / cover titles |
| H1 | 2.0 - 2.25 | Page and post title |
| H2 | 1.5 | Major section |
| H3 | 1.2 | Sub-section |
| Body | 1.0625 | Paragraphs |
| Small | 0.85 | Meta, captions |
| Eyebrow | 0.7 | Uppercase labels |


## 6. Logo and wordmark

- **Wordmark:** "Wingate365" set in Figtree 800, `letter-spacing: -0.02em`, in Deep Ink
  on light or Paper white on dark. Never restyle or add effects.
- **Monogram:** the letter "W" - used in generated placeholders as a large translucent
  glyph at ~22% white opacity over a brand gradient.
- **Placeholder wordmark:** "WINGATE365" in caps, 700 weight, ~55% white opacity,
  bottom-right of generated hero cards.
- **MVP:** Andy is a Microsoft MVP for Business Central. Use official Microsoft MVP
  Digital RGB assets (72 dpi PNG) for web. Never the Print CMYK versions on screen.
  The MVP badge lives in the home sidebar, not inline in the header.

Clear space: keep at least the height of the "W" clear around the wordmark. Do not place
the wordmark on a busy image without a gradient scrim behind it.


## 7. UI components and patterns

- **Theme:** every surface supports light and dark via `[data-theme]` plus
  `prefers-color-scheme`. Never hard-code a colour that only works in one mode - use the
  role tokens.
- **Links:** Steel Blue, no underline at rest, underline on hover.
- **Primary button / CTA:** Copper fill, white text, `border-radius: 6px`. Hover to
  Copper Deep.
- **Cards:** Paper/Panel background, 1px Cloud/Line border, `border-radius: 12px`, soft
  shadow. Rounded and calm, not sharp.
- **Eyebrow label:** uppercase, 0.08em tracking, Steel Blue or muted text.
- **Hero images:** every post shows a hero. Real image if present, otherwise a generated
  gradient placeholder (section 3.6) with monogram and wordmark.
- **Accent rule:** a thin top band using the primary gradient or the signature band is a
  recurring device for section tops and cards.

### 7.1 Article callouts (semantic colours)

Use the extended set to give callouts consistent meaning:

| **Callout** | **Left border / accent** | **Use** |
|---|---|---|
| **Tip / what worked** | Forest `#2E7D5A` | Positive guidance, a fix that worked |
| **Note / info** | Slate `#5B5EA6` | Context, side commentary |
| **Heads up / caution** | Copper `#B87333` | Something to watch, a gotcha in passing |
| **Warning / breaking** | Burgundy `#8B2E52` | Breaking change, data loss, deprecation |

Example (inline HTML, works in migrated content):

```html
<div style="border-left:4px solid #2E7D5A; background:#f4f7fa; border-radius:6px;
            padding:12px 16px; margin:16px 0;">
  <strong style="color:#0F1E2A;">Tip:</strong> This is what worked for me.
</div>
```


## 8. Writing voice and content rules

- **Person:** first person singular. "I hit this error", "here is how I fixed it".
- **Language:** UK English (colour, organise, whilst is fine, licence/practise).
- **Tone:** practical, friendly, direct. Assume a competent technical reader who is short
  on time. Lead with the problem or the answer, then the detail.
- **Structure:** short paragraphs. Use H2/H3 to break up steps. Code in fenced blocks.
- **Titles:** plain and searchable - describe the problem or task, not a clever pun.
  Good: "Fixing email for guest users in Dynamics 365". The reader arrived from a search.
- **No dashes:** never use em dashes or en dashes. Use hyphens or restructure the sentence.
- **No historical narration** in evergreen posts unless the history is the point.
- **Attribution:** credit sources and link out generously.
- **Off-topic posts** (homelab, brewing) are welcome but keep the same practical voice.

### 8.1 Post front matter template

```yaml
---
title: "Descriptive, searchable title"
date: 2026-01-15T09:00:00Z
lastmod: 2026-01-15T09:00:00Z
url: "/2026/01/descriptive-searchable-title.html"
tags: ["business central", "dynamics 365"]
hero: "https://.../image.jpg"      # optional; omit to auto-generate a placeholder
heroCaption: "Optional caption"     # optional
author: "Andy Wingate"
---
```

Conventions:
- `url` preserves the Blogger shape `/YYYY/MM/slug.html`. The month in the URL can differ
  from the date month for migrated posts - match the original.
- `tags` are lowercase, human phrases. Reuse existing tags; do not invent near-duplicates
  ("bc" vs "business central"). Say "Tags" everywhere, never "Labels".
- Keep tags focused - two to four per post.


## 9. Do and do not

**Do**
- Use Steel Blue for links and Copper for calls to action.
- Let Copper be the one warm spark that signals "Wingate365".
- Support light and dark on every surface via role tokens.
- Write in first person, UK English, problem-first.
- Give every post a hero (real or generated placeholder).

**Do not**
- Present Wingate365 as the Venture `#12212E -> #336687` identity.
- Flood a layout with Copper - it is an accent, not a background.
- Mix a second display typeface. Figtree does everything.
- Use em or en dashes anywhere.
- Invent duplicate tags or restyle the wordmark.


## 10. Quick reference card

```
FONT     Figtree (400/500/600/700/800) + system mono for code
PRIMARY  Steel Blue #3D6B8F   DARK  Deep Ink #0F1E2A
CTA      Copper #B87333       (hover #9A5E27, dark #CF8A4A)
SUCCESS  Forest #2E7D5A       WARNING Burgundy #8B2E52
INFO     Slate #5B5EA6        MUTED   Sage #6A8A7E
GRADIENT linear-gradient(135deg,#0F1E2A,#3D6B8F)
VOICE    First person, UK English, problem-first, practical, no dashes
```
