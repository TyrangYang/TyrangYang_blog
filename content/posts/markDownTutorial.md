---
title: MarkDown overview
date: 2019-06-16
author: Haolin Yang
categories: ['Overview']
tags: ['markdown', 'html']
toc:
    enable: true
    auto: true
linkToMarkdown: true
math:
    enable: false
---

This is learning note for MarkDown

# Heading 1

or

# Heading 1

## Heading 2

or

## Heading 2

## Italic and bold

_italic_ or _italic_
**bold** or **bold**
**_italic and bold_** or **_italic and bold_**

## Unordered list

-   line 1
-   line 2
-   line 3
    -   sub 1
    -   sub 2

or

-   line 1
-   line 2
-   line 3
    -   sub 1
    -   sub 2

## Ordered list

1. line 1
2. line 2
    1. sub 1
    2. sub 2
3. line 3

## BlockQuotes

Use '>' for a quotes

> This is a quote.
>
> All other syntax can use in quote
>
> > This is a nested quote
> > Use '>>'

## Code block

Just on tab

    <html>
      <head>
      </head>
    </html>

## Code

This is a code part `function foo()`

`` Escaping Tick Marks `function foo()` ``

```cpp
int add(int a, int b){
    return a+b;
}
```

```javascript
function add(a, b) {
    return a + b;
}
```

```python
def add(self, a, b):
    return a+b
```

## Table (For github)

| a    | pdf | fed | afd | 2   |
| ---- | --- | --- | --- | --- |
| adf  | sda | pdf | 1   | 3   |
| fads | pdf | 1   | 1   | 3   |
| fast | 1   | 1   | 2   | 3   |

Here is the [markdown table generator](https://www.tablesgenerator.com/markdown_tables)

## Url and Email

<haolinyang95@sina.com>

<https://www.markdownguide.org/basic-syntax/>

## Links

This the official [guide](https://www.markdownguide.org/basic-syntax/ 'cool link')

## Horizontal rule

`---`

---

`===`

## Subscript element

H<sub>2</sub>O

## Superscript element

E=MC<sup>2</sup>

## Special sign using HTML **(HTML symbol entity)**

[Website for all symbol entity](https://dev.w3.org/html5/html-author/charref)
[Blog for HTML]({{< ref "cool-website-archive#html-symbol-entity" >}})

**&plusmn;** &plusmn; &radic; &rArr; &hArr;
space: &nbsp;

![Special symbol](/images/markDownTutorial/specialSymbol.png)

[Website](https://blog.csdn.net/qiao13633426513/article/details/85112664)

## Image

![what is here](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png 'Logo Title Text 1')
![anything?][logo]

Write by Haolin Yang

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png 'Logo Title Text 2'
