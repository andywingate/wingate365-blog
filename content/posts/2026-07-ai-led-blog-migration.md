---
title: "How AI Rebuilt This Blog: Blogger to Hugo in One Sitting"
date: 2026-07-18T09:00:00Z
lastmod: 2026-07-18T09:00:00Z
tags: ["ai", "copilot", "vibe coding", "web"]
hero: "/images/heroes/blogger-to-github.svg"
heroCaption: ""
author: "Andy Wingate"
linkedin: "https://www.linkedin.com/posts/andywingate_ai-copilot-businesscentral-share-7484279794134765569-7gS-"
draft: false
---

This blog has been running on Blogger since 2005. That is not a typo. Twenty-one years of posts about BlackBerry keyboard shortcuts, Ubuntu upgrades, NAS backups, and eventually Business Central, all sitting on a platform Google has clearly stopped caring about. If you are reading this on `blog.wingate365.com`, you are reading it on a site that did not exist a few hours ago, built almost entirely by an AI agent while I sat next to it working on another project .

## The problem with Blogger

Blogger still works, but it has not evolved. No proper Markdown support, a clunky editor, dated theming, and a custom domain setup that always felt one DNS hiccup away from breaking. I wanted something Git-native: content as files, a proper build pipeline, full control over design, and free hosting that would not disappear. I also wanted to keep every existing URL working, because two decades of search engine indexing and old inbound links are not something you throw away for a redesign.

## Handing the plan to AI, not just the typing

The interesting part of this project was not "AI wrote some code for me." It was using an agent for the whole lifecycle: research the options, pick a stack, build a custom theme, write a migration script, classify two decades of content, fix its own bugs, and keep a running memory of decisions so it did not re-litigate the same argument three sessions later.

The stack it landed on: **Hugo Extended**, hosted on **GitHub Pages**, deployed via **GitHub Actions**, with a permalink structure (`/:year/:month/:slug` plus ugly URLs) engineered specifically to reproduce Blogger's exact URL shape. No redirects needed, no lost SEO equity. Jekyll and Eleventy were both viable, but Hugo won on build speed and how directly its config could be bent to match a legacy URL pattern.

## Turning 192 blog posts into a decision problem

The Blogger export was one 192-post Atom feed. Not every post deserved a second life. Wedding photos, film reviews, and Dundee days out are not what this blog is about anymore. So the brief to the agent was simple: classify every post as **include**, **exclude**, or **review**, based on whether it was genuinely Microsoft/tech/Business Central content (plus my brewing hobby, which gets a pass).

The result: 117 posts included, 53 excluded, and 22 flagged as ambiguous enough that a human needed to make the call. That review list still exists as a CSV, sitting in the backlog waiting for me to work through it properly instead of trusting a classifier's best guess on genuinely borderline cases.

## Two bugs, two one-line fixes

A naive read of the Blogger export mangled every non-ASCII character in the feed. The fix: load it properly as XML instead of raw text, one line changed. After DNS cutover, the live custom domain rendered with zero CSS - a GitHub Actions step was overriding Hugo's `baseURL` with the GitHub Pages staging subpath. The fix: delete that one override line. Two real production bugs, two one-line diffs, both only caught because the agent was told to check its own output rather than assume success.

## Letting Opus design the brand

The branding is where the agent did the most with the least direction. I gave it one sentence: I did not want the site to look like every other all-blue tech blog. Claude Opus turned that into a full design pass - three complete colour palette options, each with its own rationale, before we landed on one built directly from the Business Central logo itself: signature Azure `#0B71C7`, bright Cyan `#37BEF3`, Ice `#94EFFF`. That grew into a ten-colour token system (three signature, six semantic, one accent), documented on its own dedicated Brand Bible page, then re-applied consistently across every layout partial: header, tag pills, hero placeholders, both light and dark mode.

It also turned my one-off comment into a permanent rule: every page must carry a small non-blue accent, a forest green flourish now baked into the header underline and the "latest post" tag. Say a preference once, and a good agent keeps enforcing it long after you have forgotten you said it - across 117 posts and counting.

## What still needed a human

The classification of 192 posts into keep/skip/review was a first pass, not a final answer, and the 22 review posts are proof that judgment calls still need a person. One brand decision even overruled the agent: it built a gradient into the site wordmark, and I dropped it after looking at the rendered page and deciding it just looked wrong. And the actual DNS cutover, the moment the live domain started pointing somewhere new, was mine to trigger and mine to verify.

## Where it stands

The site is live at `blog.wingate365.com`, served over HTTPS through GitHub Pages, with 117 migrated posts, a client-side search index, LinkedIn-integrated comment threads on new posts, and a full brand style guide documented for future consistency. The backlog is now genuinely small: review those 22 borderline posts, prune a handful of tags that leaked across categories, and decide whether the andy.ms short-link setup is worth wiring in.

Two decades of blog posts, migrated, redesigned, and deployed, mostly by an agent that could read its own build logs and argue with itself until the DNS resolved. That is a very different kind of "vibe coding" to knocking out a quick script, and it is the part of working with AI agents I find genuinely useful: not typing faster, but staying in the loop on a long, multi-step project without having to hold every detail in my own head.
