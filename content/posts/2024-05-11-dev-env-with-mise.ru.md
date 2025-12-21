+++
date = 2024-05-11T09:46:33+03:00
title = "mise-en-place: среда разработки в мире cargo"
description = "Менеджер среды разработки, который не разочарует"
taxonomies.tags = ["ai-translation"]
+++

Пару дней назад я открыл для себя [mise](https://mise.jdx.dev) (произносится как «meez»). Это универсальный менеджер версий инструментов, похожий на asdf или pyenv, а также менеджер окружения, как direnv, который отличается высокой скоростью работы, надёжностью, декларативной конфигурацией и таким же удобством использования, как у cargo.

Я отказался от [hatch](https://hatch.pypa.io/latest/), который ранее использовал исключительно для загрузки Python из [python-build-standalone](https://github.com/indygreg/python-build-standalone) с помощью команды [`hatch python install all --update`](https://hatch.pypa.io/1.10/blog/2023/12/11/hatch-v180/#python-management). Я также перестал использовать Node из Homebrew и удалил собственные скрипты из dotfiles, которые синхронизировали установки pipx между рабочим и личным ноутбуками.

Мой `~/.config/mise/config.toml` теперь выглядит так:

```toml
[tools]
python = ["3.12", "3.11", "3.10", "3.9", "3.8"]
node = "lts"
usage = "latest"  # требуется самим mise
"pipx:maturin" = "latest"
"pipx:poetry" = "latest"
"pipx:pypi-command-line" = "latest"
"pipx:watchfiles" = "latest"

[settings]
experimental = true  # бэкенд pipx находится в экспериментальном режиме
```

Кроме того, я начал использовать функцию управления окружением от mise. Файл `.mise.local.toml` с переменными окружения, специфичными для компании, я разместил в директории с рабочими репозиториями:

```toml
[env]
PIP_INDEX_URL = "..."
CERT_PATH = "..."
GITLAB_TOKEN = "..."
...
```

Пока что всё работает отлично.