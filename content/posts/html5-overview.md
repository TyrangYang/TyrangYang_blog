---
title: 'HTML5 Overview 🏗'
date: 2020-08-13T14:02:26-07:00
Categories: ['Overview']
tags: ['html', 'front-end', 'web']
toc:
    enable: true
    auto: true
linkToMarkdown: true
math:
    enable: false
---

## table

```
table
├── thead
│   └── tr
│       └── th
├── tbody
│   └── tr
│       └── td
└── tfoot
    └── tr
        └── td
```

## Intersection Observer API

```js
const option = {
    root: null,
    rootMargin: '0px',
    threshold: 0.7, // or an array [0.1, 0.2, ...]
};

const callback = (entries, observer) => {
    entries.forEach((entry) => {
        // Each entry describes an intersection change for one observed
        // target element:
        //   entry.boundingClientRect
        //   entry.intersectionRatio
        //   entry.intersectionRect
        //   entry.isIntersecting
        //   entry.rootBounds
        //   entry.target
        //   entry.time
    });
};
const observer = new IntersectionObserver(callBack, option);

observer.observer(nodeOne); //observing only nodeOne
observer.observer(nodeTwo); //observing both nodeOne and nodeTwo
observer.unobserve(nodeOne); //observing only nodeTwo
observer.disconnect(); //not observing any node
```

> When node fulfilled observer option, callback function will run directly
