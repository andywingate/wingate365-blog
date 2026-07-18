---
title: "SSH handy shortcuts"
date: 2014-02-01T00:30:00Z
lastmod: 2014-03-15T00:30:42Z
slug: "ssh-handy-shortcuts"
tags: ["Linux", "SSH"]
author: "Andy Wingate"
---

A few shell shortcuts I keep coming back to when working over SSH.

## File and disk browsing

Summarise sizes (`-s`) in human-readable units (`-h`) for each sub-directory:

```bash
du -sh ./*
```

List everything with human-readable sizes:

```bash
ls -lah
```

## Screen

`screen` is handy for long-running sessions over SSH.

```bash
screen        # launch
screen -ls    # list running sessions
```

Detach the current screen with `Ctrl-a d`.
