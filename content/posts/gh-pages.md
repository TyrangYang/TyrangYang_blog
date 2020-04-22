---
title: How to demonstrate your front end application on Github by gh-page
date: 2020-03-29
author: Haolin Yang
categories: ["Posts"]
tag:
    - github
    - gh-page
    - npm
---

Github provide a tech called github pages that can hosted your project directly from repository. Basely push you project into gh-pages branch and the index.html will show on the page which is `{<github username>.github.io}/{<repository name>}`

## gh-pages

[gh-pages](https://github.com/tschaub/gh-pages) provide by [Tim Schaub](https://github.com/tschaub) is a npm package that can help you push something directly into gh-page branch

[Read more detail in repository](https://github.com/tschaub/gh-pages)

### command line usage

This package also provide a command line tool:

add `"deploy": "gh-pages -d build"` and run `npm run deploy`.

This command will push all file inside a folder called build.

### React app

Run `npm run build` will build a front end app. If you host on github page, however, the root url should unified by changing `"homepage: "<url>"` in package.json file.

> `"homepage: "."` works as well
