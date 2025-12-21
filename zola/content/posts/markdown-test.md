+++
title = "Markdown Test"
date = 2025-07-25
+++

# Heading 1

## Heading 2

### Heading 3

#### Heading 4

##### Heading 5

###### Heading 6

This is a paragraph with some **bold text**, *italic text*, and ***bold italic text***.

This paragraph has `inline code` and [a link to Google](https://google.com).

> This is a blockquote.
> 
> It can span multiple lines.
> 
> > Nested blockquote

```
This is a code block
with multiple lines
and no language specified
```

```python
# This is a Python code block
def hello():
    print("Hello, world!")
```

```javascript
// This is a JavaScript code block
function hello() {
    console.log("Hello, world!");
}
```

Unordered list:

- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
    - Nested item 2.2.1
- Item 3

Ordered list:

1. First item
2. Second item
   1. Nested first item
   2. Nested second item
3. Third item

Horizontal rule:

---

Table:

| Header 1 | Header 2 | Header 3 |
|-----------|-----------|-----------|
| Cell 1   | Cell2     | Cell3     |
| Cell4   | Cell5     | Cell6     |

Definition list:

Term 1
: Definition 1

Term 2
: Definition 2
  
  Second paragraph of definition 2

[Link reference][reference]

[reference]: https://example.com "Optional title"

![Image alt text](https://via.placeholder.com/150)

![Image with title](https://via.placeholder.com/150 "Image title")

<!-- HTML comment -->

<details>
<summary>Click to expand</summary>

This content is hidden by default.

</details>

<!--
Multi-line
HTML
comment
-->

~~Strikethrough text~~

Emoji: 😊 🚀 🎉

Math: $E = mc^2$

Math block:

$$
\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}
$$

Footnote[^1]

[^1]: This is a footnote.