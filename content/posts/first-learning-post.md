---
title: 'Learning Jekyll'
date: 2019-06-11
author: Haolin Yang
categories: ["'Posts'"]
# permalink: first/:title
# The page is store in _site folder. The default url is decided by date. However the url will be change when you have categories. Permalink can decided the url ultimately if that exist.
---

This is learning note for Jekyll

## Folder

-   \_posts

> Store all the blog post
>
> The naming convention is like 2019-01-01-this-is-the-name.md(.html)

-   \_site

> Store all the static file for your page

-   \_config.yml

> The setting for your jekyll website

-   Gemfile

> Use with Ruby and contain all the dependency

-   index.md

> Main page

## Commend for Jekyll

Initialize the bundle:

```
    jekyll new <folder name>
```

For the first time start the server:

```
    bundle exec jekyll serve
```

Start the server later:

```
    jekyll serve
```

Start the server with drafts

```
    jekyll serve --draft
```

## Theme

-   jekyll-theme-so-simple
