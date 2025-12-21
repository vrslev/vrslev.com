+++
date = 2025-07-24T00:49:28+03:00
title = "Automatically annotate Python functions with a single VS Code shortcut"
taxonomies.tags = ["python", "vscode", "development-tools", "original-lang"]
+++

I watched [this video](https://www.youtube.com/watch?v=YTDpiP1-PRg) by [Anthony Sottile](https://github.com/asottile) about a neat tool for auto-generating function annotations: [auto-type-annotate](https://github.com/getsentry/auto-type-annotate). It is actually inspired by unmaintained tool called [PyAnnotate](https://github.com/dropbox/pyannotate).

Inspired by it, I [added](https://github.com/vrslev/dotfiles/compare/955fa16aef44ab094c598028352b088b10954666...68f096e10f46dcdfb5f55c4552cbe26616a28c47) a custom VS Code shortcut: now when I press Cmd+K, then Cmd+M, annotations magically appear on \[some] functions!
