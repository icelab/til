---
title: Restore a file with git checkout
date: 2017-01-23
author: Daniel Nitsikopoulos
tags: git
---

If you commit and push a change to a file that you later discover you didn’t mean to make, you can restore a previous version of a file with `git checkout`

Let’s presume we have the following history:

```
*aacc272 - accidental change to foo.rb
*ac2eb0b - changes
*c688457 - bug fixes
```

We know that `foo.rb` is in the state we want in the commit with hash `ac2eb0b `. So we can run `$ git checkout ac2eb0b path/to/foo.rb`.

It's worth noting that unlike passing a branch name to `git checkout`, this method is destructive and can discard changes in the working directory.

From the git man pages:
> git checkout [-p|--patch] [<tree-ish>] [--] <pathspec>…
When <paths> or --patch are given, git checkout does not switch branches. It updates the named paths in the working tree from the index file or from a named <tree-ish> (most often a commit). In this case, the -b and --track options are meaningless and giving either of them results in an error. The <tree-ish> argument can be used to specify a specific tree-ish (i.e. commit, tag or tree) to update the index for the given paths before updating the working tree.
