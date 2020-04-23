---
title: Why Can’t I Open My React App By Clicking Index.html?
date: 2019-10-28
author: Haolin Yang
categories: ['Posts']
tags:
    - react
---

## The app should Run when you open up your index.html file

The conclusion is add `"homepage":".",` in package.json.

[medium.com/@louis.raymond](https://medium.com/@louis.raymond/why-cant-i-open-my-react-app-by-clicking-index-html-d1778f6324cf)

## Still not work when you have client side router

If you are routing client side, index.html may still not work. In this case, you may using `BrowserRouter`. Change it to `HashRouter`.

Click: [Different between them](https://stackoverflow.com/questions/51974369/hashrouter-vs-browserrouter)
