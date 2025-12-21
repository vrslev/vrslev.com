+++
date = 2024-05-14T14:51:08+03:00
title = "Декларативный Homebrew"
taxonomies.tags = ["ai-translation"]
+++

Мне важно поддерживать единообразную среду разработки на обоих моих MacBook — рабочем и личном. (Именно поэтому я [использую](../dev-env-with-mise) mise и храню [dotfiles](https://github.com/vrslev/dotfiles) в репозитории.)

Ранее меня беспокоил один момент в этом процессе — поддержание актуальности установленных пакетов Homebrew. Раньше я время от времени запускал команду `make dump`, которая обновляла Brewfile с помощью `brew bundle dump`. Проблема заключалась в том, что состояние файла всегда отставало от реального состояния системы.

Теперь у меня есть функция Fish, которая обновляет Brewfile при каждом выполнении потенциально разрушительной команды brew:

```fish
function brew
  command brew $argv; and\
  switch $argv[1]
    case install uninstall reinstall tap untap
      brew bundle dump --file $DOTFILES_ROOT/Brewfile --force
  end
end
```