+++
date = 2024-05-11T09:46:33+03:00
title = "mise-en-place: dev env in a world with cargo"
description = "Dev env manager that doesn't suck"
+++

A couple of days ago I discovered [mise](https://mise.jdx.dev) (pronounced "meez"). It's a polyglot tool version manager similar to asdf or pyenv, and an environment manager, like direnv, that is fast, reliable, has a declarative configuration and feels as good as cargo.

I got rid of [hatch](https://hatch.pypa.io/latest/) which I had previously been using only for downloading Pythons from [python-build-standalone](https://github.com/indygreg/python-build-standalone) with the command [`hatch python install all --update`](https://hatch.pypa.io/1.10/blog/2023/12/11/hatch-v180/#python-management). I have also stopped using Node from Homebrew, and removed custom scripts from my dotfiles that were used to keep pipx installations synchronized between my work and personal laptops.

My `~/.config/mise/config.toml` now looks like this:

```toml
[tools]
python = ["3.12", "3.11", "3.10", "3.9", "3.8"]
node = "lts"
usage = "latest"  # required by mise itself
"pipx:maturin" = "latest"
"pipx:poetry" = "latest"
"pipx:pypi-command-line" = "latest"
"pipx:watchfiles" = "latest"

[settings]
experimental = true  # pipx backend is experimental
```

I have also started using mise's environment management feature. I placed the `.mise.local.toml` file containing organization-specific environment variables in the folder with work repositories:

```toml
[env]
PIP_INDEX_URL = "..."
CERT_PATH = "..."
GITLAB_TOKEN = "..."
...
```

Everything is great so far.
