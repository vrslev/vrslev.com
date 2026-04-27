+++
date = 2026-04-27T17:23:00+03:00
title = "cmp-cov: Track Python test coverage during refactoring"
taxonomies.tags = ["ai-translation"]
+++

When test coverage isn't 100%, it's hard to track how it changes during refactoring. I used to either ignore it or copy the coverage section and diff it by hand in VS Code. Diffs like this had to be eyeballed (and I only added a single test here! — this is a toy example):


```diff
13c13
< chatbotfront/api/rest/system.py                                  9      1    89%   14
---
> chatbotfront/api/rest/system.py                                  9      0   100%
62c62
< tests/api/test_system.py                                         3      0   100%
---
> tests/api/test_system.py                                         7      0   100%
92,93c92,93
< TOTAL                                                         2388    105    96%
< ==================================== 208 passed in 44.62s =====================================
---
> TOTAL                                                         2392    104    96%
> ==================================== 209 passed in 44.35s =====================================

```

To make such checks easier and more humane, I wrote a tool — [cmp-cov](https://github.com/vrslev/cmp-cov). It compares the current coverage against a saved baseline. Example usage:

```shell
❯ uv run pytest --cov && uvx cmp-cov save-baseline
...<pytest output>...
Saved baseline 'default' for /Users/lev/web/chat/bot/front
  path:    /Users/lev/.cache/cmp-coverage/%2FUsers%2Flev%2Fweb%2Fchat%2Fbot%2Ffront/default/coverage.xml
  sources: 85 files in /Users/lev/.cache/cmp-coverage/%2FUsers%2Flev%2Fweb%2Fchat%2Fbot%2Ffront/default/sources
  total:   95.69%

# Add new test, and run again, this time diff.

❯ uv run pytest --cov && uvx cmp-cov diff
...<pytest output>...
Project:  /Users/lev/web/chat/bot/front
Baseline: 'default' (/Users/lev/.cache/cmp-coverage/%2FUsers%2Flev%2Fweb%2Fchat%2Fbot%2Ffront/default/coverage.xml)
Saved:    2026-04-27 17:16:58

Total: 95.69% → 95.69% (+0.00)

↑ uncovered → covered (1 lines, 1 runs):
  chatbotfront/api/rest/system.py:14

+ new covered (4 lines, 1 runs):
  tests/api/test_system.py:7-10
```

Now it's clear what changed in coverage.

There's a similar tool, [`diff-cover`](https://github.com/Bachmann1234/diff_cover), but it only shows coverage for lines changed in a git diff. I needed to compare coverage before and after, as the code itself changes.

Source code: [github.com/vrslev/cmp-cov](https://github.com/vrslev/cmp-cov). You can try it this way: `uvx cmp-cov save-baseline`, change some code, then `uvx cmp-cov diff`.
