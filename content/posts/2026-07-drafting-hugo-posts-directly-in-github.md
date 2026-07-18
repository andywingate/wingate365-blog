---
title: "Drafting a Research Post Directly in GitHub"
date: 2026-07-18T15:13:49Z
lastmod: 2026-07-18T15:13:49Z
tags: ["d365bc", "copilot", "ai", "powerplatform"]
hero: ""
heroCaption: ""
author: "Andy Wingate"
linkedin: ""
draft: true
---

If your blog is a repo-backed Hugo site, you can create a perfectly usable draft directly in GitHub without opening a local editor. That is especially handy for research-led posts where the value is in capturing the thinking while it is fresh.

This post is exactly that kind of draft. The topic I wanted to pin down was simple: for Business Central process analysis, what was the Microsoft tool that came from an acquisition, and is it still worth caring about now that we have AI assistants and MCP-based tooling everywhere?

## Why GitHub Works Well for Drafting Hugo Posts

For a Hugo site that stores each article as a Markdown file, GitHub is already the CMS.

The workflow is straightforward:

1. Create a new file in `content/posts/`.
2. Add the front matter.
3. Write in Markdown.
4. Commit to a branch and let the site build validate the draft.

That is enough for early-stage ideas, outlines, and research notes. You do not need the full publishing setup just to get a post started. If the site has a clean archetype and a reliable build, the browser experience is often good enough.

## The Process Mining Tool Microsoft Bought

The product Microsoft bought was **Minit**.

Microsoft announced the acquisition in [March 2022](https://blogs.microsoft.com/blog/2022/03/31/microsoft-acquires-minit-to-strengthen-process-mining-capabilities/). The capability now sits inside [Power Automate Process Mining](https://www.microsoft.com/en-us/power-platform/blog/2023/07/18/microsoft-launches-power-automate-process-mining-and-next-generation-ai/). In practical terms, if you are looking for the Microsoft-native process mining story today, that is the product line to watch rather than Minit as a standalone brand.

That matters for Business Central because the question is rarely "can I get data out?" The real question is whether I can turn events across orders, approvals, purchasing, warehousing, and finance into a view of how work actually flows.

## So Is Process Mining Still Relevant?

Yes - but for a more specific reason than before.

AI tools and MCP connections are very good at helping you **act** on data. They can answer questions, guide users, generate summaries, and trigger actions. What they do not automatically give you is a reliable picture of how a business process behaves over time across many cases, users, and exceptions.

That is where process mining still earns its place.

Process mining helps with:

- discovering the real process, not the documented one
- measuring where delays actually happen
- spotting rework, loops, and handoff problems
- comparing teams, customers, or entities across the same flow
- proving whether a change improved cycle time or compliance

AI and MCP are action layers. Process mining is an analysis layer. Those are complementary, not interchangeable.

## Where This Fits for Business Central

For Business Central, the opportunity is not just "mine everything." It is to pick process areas where event data and business value line up clearly.

Good candidates include:

- Quote-to-Cash
- Purchase-to-Pay
- approval workflows
- item replenishment and warehouse handling
- case management or service follow-up

In those scenarios, Business Central already holds much of the operational history you care about. The hard part is shaping it into an event log with the right case ID, activity names, timestamps, and attributes. Once that structure exists, process mining can show you whether the process is smooth, fragmented, delayed, or full of avoidable touches.

## What AI Changes

AI makes process mining more useful, not less.

I can see three practical shifts:

### 1. AI lowers the barrier to asking better questions

Instead of manually exploring every branch of a process map, teams can use AI assistance to interrogate the data faster and explain patterns in plain language.

### 2. MCP can connect the insight to action

If an AI tool can securely reach Business Central, supporting systems, and operational context through MCP-style integrations, it becomes easier to move from "here is the bottleneck" to "here is the next best action."

### 3. Human judgement still matters

A process map may show repeated approval loops. AI may suggest automation. But only a functional consultant or process owner can decide whether that loop is waste, control, or a symptom of bad master data.

## My Take

If you work in the Microsoft ecosystem, **Power Automate Process Mining** still looks relevant. The acquisition of Minit was not a dead-end bet. It became part of a broader process intelligence story inside Power Platform.

For Business Central specifically, I would not position process mining as a competitor to Copilot, agents, or MCP. I would position it as the evidence layer that tells you where those tools should focus.

If you want to automate a broken process faster, AI will help you do the wrong thing efficiently. If you want to understand the process first, process mining still has a very real role.

## Final Thought

This is also a nice example of why a repo-backed Hugo blog is a useful setup. I can open GitHub, create a draft like this directly in the repository, capture a research thread, and refine it later when I want to add screenshots, references, or a stronger Business Central example.

That is a good authoring model for technical blogging - small start, versioned draft, easy review, publish when ready.
