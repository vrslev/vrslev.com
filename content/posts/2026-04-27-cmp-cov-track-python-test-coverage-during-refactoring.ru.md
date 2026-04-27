+++
date = 2026-04-27T17:23:00+03:00
title = "cmp-cov: Трекаем покрытие Python-кода во время рефакторинга"
taxonomies.tags = ["original-lang"]
+++

Когда покрытие кода тестами не 100%, при рефакторинге сложно отслеживать его изменения. Раньше я либо забивал на это, либо копировал секцию с покрытием и сравнивал дифф вручную в VS Code. Вот такие диффы приходилось отсматривать (тут пример игрушечный: я добавил всего один тест!):


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

Чтобы сделать такие проверки проще и человечнее, написал утилиту [cmp-cov](https://github.com/vrslev/cmp-cov). Она сравнивает текущее покрытие с сохранённым baseline. Пример использования:

```shell
❯ uv run pytest --cov && uvx cmp-cov save-baseline
#...pytest output...
Saved baseline 'default' for /Users/lev/web/chat/bot/front
  path:    /Users/lev/.cache/cmp-coverage/%2FUsers%2Flev%2Fweb%2Fchat%2Fbot%2Ffront/default/coverage.xml
  sources: 85 files in /Users/lev/.cache/cmp-coverage/%2FUsers%2Flev%2Fweb%2Fchat%2Fbot%2Ffront/default/sources
  total:   95.69%
```

Добавил тест, запустил заново — на этот раз c командой `diff`:

```shell
❯ uv run pytest --cov && uvx cmp-cov diff
#...pytest output...
Project:  /Users/lev/web/chat/bot/front
Baseline: 'default' (/Users/lev/.cache/cmp-coverage/%2FUsers%2Flev%2Fweb%2Fchat%2Fbot%2Ffront/default/coverage.xml)
Saved:    2026-04-27 17:16:58

Total: 95.69% → 95.69% (+0.00)

↑ uncovered → covered (1 lines, 1 runs):
  chatbotfront/api/rest/system.py:14

+ new covered (4 lines, 1 runs):
  tests/api/test_system.py:7-10
```

Теперь ясно видно, что изменилось в покрытии.

Из похожего есть [`diff-cover`](https://github.com/Bachmann1234/diff_cover), но он показывает покрытие только для строк, изменённых в git diff. Мне же нужно сравнивать покрытие до и после, когда меняется сам код.

---

Исходный код: [github.com/vrslev/cmp-cov](https://github.com/vrslev/cmp-cov).

Попробовать можно так: `uvx cmp-cov save-baseline`, поменяйте код, затем `uvx cmp-cov diff`.
