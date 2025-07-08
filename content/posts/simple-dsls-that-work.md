+++
date = 2025-07-08T14:34:43+03:00
title = "Simple DSLs That Work"
externalLink = ""
+++

A year ago, I released [auto-typing-final](https://github.com/community-of-python/auto-typing-final), a fixer and linter enforcing Raiffeisenbank Russia Python Community [style-guide](https://github.com/community-of-python/pylines/blob/6a9fa5d46c46fecce66749760ad745d64e1c2c14/code-style.md) rule to “use `typing.Final` for constants.” It’s now integrated throughout our codebase (there’s even a VS Code extension).

Inspired by Ty’s work on [Ruff](https://github.com/charliermarsh/ruff) and Carl Meyer’s Markdown-based test framework [PR in Ruff](https://github.com/astral-sh/ruff/pull/13636), which demonstrated how embedding example-driven tests in Markdown can simplify both testing and documentation.

To streamline both tests and documentation, I [introduced](https://github.com/community-of-python/auto-typing-final/pull/125) a simple Markdown-based internal DSL for defining transformation scenarios inline:

```md
### Multiple Assignments with `Final`

```python
a: Final = 1  # remove ("remove" means that "Final" should be stripped out. There's also "insert"—the opposite)
a = 2
```

Such examples replaced complex parametrization with multi-line strings.

**Why This Internal DSL Works:**

- Enhanced Clarity. Headings describe each test case, and fenced code blocks separate input, expected changes, and annotations.

- Single Source of Truth. The same Markdown snippet powers pytest parameterization and user-facing documentation.

## So...
Small DSLs like this work well: they’re easy to parse, easy to read and easy to write.
This showcase proves that sometimes the simplest tools have great impact.
