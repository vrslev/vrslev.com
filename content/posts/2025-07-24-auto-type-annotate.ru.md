+++
date = 2025-07-24T00:49:28+03:00
title = "Автоматическая аннотация функций Python одной комбинацией клавиш в VS Code"
taxonomies.tags = ["ai-translation"]
+++

Я посмотрел [это видео](https://www.youtube.com/watch?v=YTDpiP1-PRg) от [Энтони Соттиле](https://github.com/asottile) о полезном инструменте для автоматической генерации аннотаций функций: [auto-type-annotate](https://github.com/getsentry/auto-type-annotate). Он, в свою очередь, вдохновлён не поддерживаемым инструментом [PyAnnotate](https://github.com/dropbox/pyannotate).

Вдохновившись этим, я [добавил](https://github.com/vrslev/dotfiles/compare/955fa16aef44ab094c598028352b088b10954666...68f096e10f46dcdfb5f55c4552cbe26616a28c47) собственную комбинацию клавиш в VS Code: теперь при нажатии Cmd+K, а затем Cmd+M, аннотации волшебным образом появляются у [некоторых] функций!