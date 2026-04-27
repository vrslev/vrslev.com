+++
date = 2026-04-27T17:23:00+03:00
title = "cmp-cov: Трекаем покрытие Python-кода во время рефакторинга"
taxonomies.tags = ["original-lang"]
+++

Во время рефакторинга тестов в проекте с не-100% покрытием кода тестами это покрытие сложно отслеживать. Раньше я либо забивал на это, либо копировал секцию с покрытием и сравнивал дифф вручную в VS Code. Вот такие диффы приходилось отсматривать (тут я добавил всего один тест!):


```diff
13c13
< chatbotfront/api/rest/system.py                                  9      1    89%   14
---
> chatbotfront/api/rest/system.py                                  9      0   100%
42c42
< chatbotfront/services/base_state.py                             54      0   100%
---
> chatbotfront/services/base_state.py                             54      1    98%   74
49c49
< chatbotfront/use_cases/core_response_to_platform.py             74      2    97%   170-171
---
> chatbotfront/use_cases/core_response_to_platform.py             74      0   100%
62c62
< tests/api/test_system.py                                         3      0   100%
---
> tests/api/test_system.py                                         7      0   100%
92,93c92,93
< TOTAL                                                         2388    105    96%
< ==================================== 208 passed in 44.62s =====================================
---
> TOTAL                                                         2392    103    96%
> ==================================== 209 passed in 44.35s =====================================

```

Чтобы сделать такие проверки проще и человечнее, написал утилиту, которая сравнивает текущее покрытие с сохранённым baseline. Пример использования:

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

Теперь ясно видно, что изменилось в покрытии.
