+++
date = 2024-05-14T14:51:08+03:00
title = "Declarative Homebrew"
taxonomies.tags = ["original-lang"]
+++

I want to keep my development environment consistent across both my work and personal MacBooks. (That's why I [use](../dev-env-with-mise) mise and [have](https://github.com/vrslev/dotfiles) dotfiles repository.)


One thing that didn't sit well with me about the process was keeping my Homebrew installations up to date. Presiously, I had used the `make dump` command that I would run occasionally to update Brewfile with `brew bundle dump`. The problem was that it always lagged behind the actual state of my machine.

Now, I have Fish function that updates Brewfile every time I run a potentially destructive brew command:

```fish
function brew
  command brew $argv; and\
  switch $argv[1]
    case install uninstall reinstall tap untap
      brew bundle dump --file $DOTFILES_ROOT/Brewfile --force
  end
end
```
