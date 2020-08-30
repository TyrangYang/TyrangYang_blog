---
title: SASS (SCSS) features
date: 2019-09-18
author: Haolin Yang
categories: ['Note']
tags:
    - css
    - course note
toc:
    enable: true
    auto: true
---

## SCSS features

### Variables

```scss
$font-stack: Helvetica, sans-serif;
$primary-color: #333;

body {
    font: 100% $font-stack;
    color: $primary-color;
}
```

### Operator

```scss
.container {
    width: 100%;
}

article[role='main'] {
    float: left;
    width: 600px / 960px * 100%;
}

article[role='complementary'] {
    float: right;
    width: 300px / 960px * 100%;
}
```

### String interpolation

```scss
$name: foo;
$attr: border;
p.#{$name} {
    #{$attr}-color: blue;
}
```

This is compile to:

```css
p.foo {
    border-color: blue;
}
```

### Nesting

```scss
#main p {
    color: #00ff00;
    width: 90%;

    .redbod {
        background-color: #ff0000;
        color: #000000;
    }
}
```

This is compile to:

```css
#main p {
    color: #00ff00;
    width: 90%;
}
#main p .redbod {
    background-color: #ff0000;
    color: #000000;
}
```

### The parent selector

We can use the & symbol to state “for the selector I am nested inside with these other selectors” or “with this selector than the current selector”

```scss
a {
    font-weight: bold;
    text-decoration: none;
    &:hover {
        text-decoration: underline;
    }
    body.firebox & {
        font-weight: normal;
    }
}
```

This is compile to:

```css
a {
    font-weight: bold;
    text-decoration: none;
}
a:hover {
    text-decoration: underline;
}
body.firebox a {
    font-weight: normal;
}
```

### Imports

```scss
@import ’filename.scss’;
```

### Nested Media Queries

```scss
.sidebar {
    width: 300px;
    @media screen and (orientation: landscape) {
        width: 500px;
    }
}
```

This is compile to:

```css
.sidebar {
    width: 300px;
}
@media screen and (orientation: landscape) {
    .sidebar {
        width: 500px;
    }
}
```

### General control

```scss
$type: monster;
p {
    @if $type == ocean {
        color: blue;
    } @else if $type == matador {
        color: red;
    } @else if $type == monster {
        color: green;
    } @else {
        color: black;
    }
}

@for $i from 1 through 3 {
    .item-#{$i} {
        width: 2em * $i;
    }
}

@each $animal in puma, sea-slug, egret, salamander {
    .#{$animal}-icon {
        background-image: url('/image/#{$animal}.png');
    }
}
```

### Mixins

```scss
@mixin box-shadow($shadows...) {
    -moz-box-shadow: $shadows;
    -webkit-box-shadow: $shadows;
    box-shadow: $shadows;
}

.shadows {
    @include box-shadow(0px 4px 5px #666, 2px 6px 10px #999);
}
```

This is compile to:

```css
box-shadow {
    -moz-box-shadow: 0px 4px 5px #666, 2px 6px 10px #999;
    -webkit-box-shadow: 0px 4px 5px #666, 2px 6px 10px #999;
    box-shadow: 0px 4px 5px #666, 2px 6px 10px #999;
}
```

### Functions

```scss
$grid-width: 40px;
$gutter-width: 10px;

@function grid-width($n) {
    @return $n * $grid-width + ($n - 1) * $gutter-width;
}

#sidebar {
    width: grid-width(5);
}
```

This is compile to:

```scss
#sidebar {
    width: 240px;
}
```

### Extending

```scss
.error {
    border: 1px #f00;
    background-color: #fdd;
}

.seriousError {
    @extend .error;
    border-width: 3px;
}
```

### Placeholders

```scss
#context a%extreme {
    color: blue;
    font-weight: bold;
    font-size: 2em;
}

.notice {
    @extend %extreme;
}
```
