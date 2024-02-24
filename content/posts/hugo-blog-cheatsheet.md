---
title: 'Hugo Blog CheatSheet'
date: 2020-08-17T16:43:42-07:00
Categories: ['CheatSheet']
tags: ['hugo', 'cheatsheet', 'trick']
toc:
    enable: true
    auto: true
linkToMarkdown: true
math:
    enable: false
---

## Create new post

> `hugo new posts/new.md`

## Add a picture

1.  Basic markdown

    > `![<alt name](< The route start from static folder>)`

2.  hugo build-in shortcut --> _figure_ (src is start from static folder)
    > `\{\{< figure src="" title="" >}}`

## Add a reference link

[Documentation of ref and relref](https://gohugo.io/content-management/shortcodes#ref-and-relref)

```
\[Neat](\{\{< ref "blog/neat.md" >}})
\[Who](\{\{< relref "about.md#who" >}})
```

## Theme feature

This theme extended short code. See [Theme Documentation - Extended Shortcodes](https://hugoloveit.com/theme-documentation-extended-shortcodes)

### admonition

```markdown
< admonition type=note title="Here is title" open=true >
Here is text content
< /admonition >
```

{{< admonition type=note title="note (default type)" open=true >}}
Here is text content
{{< /admonition >}}
{{< admonition type=abstract title="abstract" open=false >}}
A **abstract** banner
{{< /admonition >}}
{{< admonition type=info title="info" open=false >}}
A **info** banner
{{< /admonition >}}
{{< admonition type=tip title="Tip" open=false >}}
A **tip** banner
{{< /admonition >}}
{{< admonition type=success title="success" open=false >}}
A **success** banner
{{< /admonition >}}
{{< admonition type=question title="question" open=false >}}
A **question** banner
{{< /admonition >}}
{{< admonition type=warning title="warning" open=false >}}
A **warning** banner
{{< /admonition >}}
{{< admonition type=failure title="failure" open=false >}}
A **failure** banner
{{< /admonition >}}
{{< admonition type=danger title="danger" open=false >}}
A **danger** banner
{{< /admonition >}}
{{< admonition type=bug title="bug" open=false >}}
A **bug** banner
{{< /admonition >}}
{{< admonition type=example title="example" open=false >}}
A **example** banner
{{< /admonition >}}
{{< admonition type=quote title="quote" open=false >}}
A **quote** banner
{{< /admonition >}}
