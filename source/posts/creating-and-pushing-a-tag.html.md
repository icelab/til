---
title: Creating and pushing a git tag
date: 2015-08-12
author: Tim Riley
tags: git
---

If you're releasing gems (or any other kinds of packages), git tags are a useful way to track those release milestones in the source code repo.

Creating a tag is easy:

```
git tag v1.0.0
```

So is pushing it to a remote:

```
git push origin v1.0.0
```

The [Git Basics - Tagging](https://git-scm.com/book/en/v2/Git-Basics-Tagging) section in the online git book is an easy-to-read overview of the various tag commands.
