# Hugo Blog CheatSheet


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

