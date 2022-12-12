---
title: 'Flex and Grid in CSS'
date: 2020-08-18T12:04:51-07:00
Categories: ['Posts']
tags: ['css', 'grid', 'flex']
toc:
    enable: true
    auto: true
linkToMarkdown: true
math:
    enable: false
---

{{< figure src="/images/flex-grid/01-container.svg" width="30%" height="30%">}}
{{< figure src="/images/flex-grid/02-items.svg" width="30%" height="30%">}}

## Flex

[**Cheat Sheet**](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) provide by CSS-tricks.com

A [Flexbox code Example](https://codepen.io/TyrangYang/pen/GRZjQgg)

### display

```css
.container {
    display: flex;
}
```

### flex-direction

```css
.container {
    flex-direction: row | row-reverse | column | column-reverse;
}
```

{{< figure src="/images/flex-grid/flex-direction.svg" title="flex-direction" width="50%" height="50%" >}}

### flex-warp

```css
.container {
    flex-wrap: nowrap | wrap | wrap-reverse;
}
```

{{< figure src="/images/flex-grid/flex-wrap.svg" title="flex-wrap" width="50%" height="50%" >}}

### flex-flow

This is a shorthand for the flex-direction and flex-wrap properties.

```css
.container {
    flex-flow: column wrap;
}
```

### order

```css
.item {
    order: 5; /* default is 0 */
}
```

{{< figure src="/images/flex-grid/order.svg" title="order" width="40%" height="40%" >}}

### flex-grow

This defines the ability for a flex item to grow when there is extra space from container.

`0` means fix

```css
.container {
    display: flex;
    width: 1100px;
}
.item-1 {
    flex-basis: 100px;
    flex-grow: 1; /* default 0 */
    /* Negative numbers are invalid */
}

.item-2 {
    flex-basis: 100px;
    flex-grow: 2;
}

.item-3 {
    flex-basis: 100px;
    flex-grow: 1;
}
```

In this example, container is `1100px,` item base width is `100px`. The left space is `1100 - 100 * 3 = 800`. This `800px` will base on the proportion `1 : 2 : 1` to distribute to each item.

`800 / 4 = 200` the final with will be `300px (100+200); 500px (100+400); 300px`

{{< figure src="/images/flex-grid/flex-grow.svg" title="flex-grow" width="50%" height="50%" >}}

### flex-shrink

This defines the ability for a flex item to shrink when item size overflow.

`0` means fix

```css
.container {
    display: flex;
    width: 300px;
}
.item-1 {
    flex-basis: 300px;
    flex-shrink: 1; /* default 1 */
    /* Negative numbers are invalid */
}

.item-2 {
    flex-basis: 300px;
    flex-shrink: 2; /* default 1 */
}
```

In this example, item will overflow `300 - 300 * 2 = 300px`.item will shrink base on the proportion `1 : 1`. Item will be `200px (300-100); 100px(300-200)`

### flex-basis

This defines the default size of an element before the remaining space is distributed.

If set to auto, it will take width as starting size to distribute space.
If set to a number, it will take the given number as starting size to distribute space.

```css
.item {
    flex-basis: 300px;
}

// equivalent to

.item {
    width: 300px;
    flex-basis: auto;
}
```

If set to 0, the item actual width will be decided by space distribution only. Because this item is no space at beginning.

```css
.item {
    flex-basis: 0;
}
```

#### 0 vs auto after distribute space

If set to 0, the extra space around content isn’t factored in. If set to auto, the extra space is distributed based on its flex-grow value.

{{< figure src="/images/flex-grid/rel-vs-abs-flex.svg" title="All space distributed vs Extra space distributed" width="70%" height="70%" >}}

### flex

This is the shorthand for flex-grow, flex-shrink and flex-basis combined.

Default is `0 1 auto`

```css
.item {
    flex: none | [ < 'flex-grow' > < 'flex-shrink' >? || < 'flex-basis' > ];
}
```

#### flex: 1

```css
.item {
    flex: 1;
}
// equivalent to
.item {
    flex: 1 0 0;
}
// equivalent to
.item {
    flex-grow: 1;
    flex-shrink: 0;
    flex-basis: 0;
}
```

This is a common styling that given to an item which can take all the extra space for a flexbox.

We analysis this line and see why it is work. item starting from 0 size, Not shrink and take extra space for 1 proportion. If no other item give `flex-grow`(default is 0), this item will take all extra space

### justify-content

This defines the alignment along the main axis.

```css
.container {
    justify-content: flex-start | flex-end | center | space-between |
        space-around | space-evenly | start | end | left | right... + safe |
        unsafe;
}
```

{{< figure src="/images/flex-grid/justify-content.svg" title="justify-content" width="40%" height="40%" >}}

### align-content

This aligns a flex container’s lines within when there is extra space in the **cross-axis**, similar to how `justify-content` aligns individual items within the main-axis.

{{< figure src="/images/flex-grid/align-content.svg" title="align-content" width="40%" height="40%" >}}

### align-items

```css
.container {
    align-items: stretch | flex-start | flex-end | center | baseline | first
        baseline | last baseline | start | end | self-start | self-end +... safe
        | unsafe;
}
```

{{< figure src="/images/flex-grid/align-items.svg" title="align-items" width="40%" height="40%" >}}

### align-self

This allows the alignment to be overridden for individual flex items.

```css
.item {
    align-self: auto | flex-start | flex-end | center | baseline | stretch;
}
```

{{< figure src="/images/flex-grid/align-self.svg" title="align-self" width="40%" height="40%" >}}

## grid

[**Cheat Sheet**](https://css-tricks.com/snippets/css/complete-guide-grid/) provide by CSS-tricks.com

A [Grid code Example](https://codepen.io/TyrangYang/pen/jOqMZVG)

### display

```css
.container {
    display: grid | inline-grid;
}
```

### grid-template-columns & grid-template-rows

values:

-   \<track-size> – can be a length, a percentage, or a fraction of the free space in the grid (using the **fr** unit)
-   \<line-name> – an arbitrary name of your choosing

```css
.container {
    grid-template-columns: ... | ...;
    grid-template-rows: ... | ...;
}
```

Example:

```css
.container {
    grid-template-columns: 40px 50px auto 50px 40px;
    grid-template-rows: 25% 100px auto;
}
```

{{< figure src="/images/flex-grid/template-columns-rows-01.svg" title="grid example" width="40%" height="40%" >}}

If assign name to each line:

```css
.container {
    grid-template-columns: [first] 40px [line2] 50px [line3] auto [col4-start] 50px [five] 40px [end];
    grid-template-rows: [row1-start] 25% [row1-end] 100px [third-line] auto [last-line];
}
```

{{< figure src="/images/flex-grid/template-columns-rows-02.svg" title="grid example" width="50%" height="50%" >}}

### grid-column & grid-row

Determines a grid item’s location within the grid by referring to specific grid lines.

```css
.item {
    grid-column: <start-line> / <end-line> | <start-line> / span <value>;
    grid-row: <start-line> / <end-line> | <start-line> / span <value>;
}
```

Example:

```css
.item {
    grid-column: 3 / span 2; /* or 3/5 or line3/line5 */
    grid-row: third-line / 4; /* or 3/4 or 3/span 2 */
}
```

{{< figure src="/images/flex-grid/grid-column-row.svg" title="grid-column-row" width="50%" height="50%" >}}

### grid-template-areas & grid-area

```css
.container {
    display: grid;
    grid-template-columns: 50px 50px 50px 50px;
    grid-template-rows: auto;
    grid-template-areas:
        'header header header header'
        'main main . sidebar'
        'footer footer footer footer';
}
.item-a {
    grid-area: header;
}
.item-b {
    grid-area: main;
}
.item-c {
    grid-area: sidebar;
}
.item-d {
    grid-area: footer;
}
```

{{< figure src="/images/flex-grid/grid-template-areas.svg" title="grid-template-area" width="50%" height="50%" >}}

### grid-template

A shorthand for setting `grid-template-rows`, `grid-template-columns`, and `grid-template-areas` in a single declaration.

```css
.container {
    grid-template:
        'header header header header' 1fr
        'main main . sidebar' 1fr
        'footer footer footer footer' 1fr / 1fr 1fr 1fr 1fr;
}
```

### gap (grid-gap)

```css
.container {
    gap: 15px 10px;

    /*equal to*/
    row-gap: 15px;
    column-gap: 10px;
}
```

{{< figure src="/images/flex-grid/grid-gap.svg" title="grid-gap" width="40%" height="40%" >}}

### justify-items

```css
.container {
    justify-items: start | end | center | stretch;
}
```

<div style="display: grid; grid-template-columns: repeat(2, 1fr);">

{{<figure src="/images/flex-grid/justify-items-center.svg" title="justify-items-center" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/justify-items-start.svg" title="justify-items-start" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/justify-items-end.svg" title="justify-items-end" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/justify-items-stretch.svg" title="justify-items-stretch" width="60%" height="60%" >}}

</div>

### align-items

```css
.container {
    align-items: start | end | center | stretch;
}
```

<div style="display: grid; grid-template-columns: repeat(2, 1fr);">

{{<figure src="/images/flex-grid/align-items-center.svg" title="align-items-center" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/align-items-start.svg" title="align-items-start" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/align-items-end.svg" title="align-items-end" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/align-items-stretch.svg" title="align-items-stretch" width="60%" height="60%" >}}

</div>

### place-items

`place-items` sets both the `align-items` and `justify-items` properties in a single declaration.

### justify-content

```css
.container {
    justify-content: start | end | center | stretch | space-around |
        space-between | space-evenly;
}
```

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));">

{{<figure src="/images/flex-grid/justify-content-center.svg" title="justify-content-center" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/justify-content-start.svg" title="justify-content-start" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/justify-content-end.svg" title="justify-content-end" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/justify-content-stretch.svg" title="justify-content-stretch" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/justify-content-space-around.svg" title="justify-content-space-around" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/justify-content-space-between.svg" title="justify-content-space-between" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/justify-content-space-evenly.svg" title="justify-content-space-evenly" width="60%" height="60%" >}}

</div>

### align-content

```css
.container {
    align-content: start | end | center | stretch | space-around | space-between
        | space-evenly;
}
```

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));">

{{<figure src="/images/flex-grid/align-content-center.svg" title="align-content-center" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/align-content-start.svg" title="align-content-start" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/align-content-end.svg" title="align-content-end" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/align-content-stretch.svg" title="align-content-stretch" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/align-content-space-around.svg" title="align-content-space-around" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/align-content-space-between.svg" title="align-content-space-between" width="60%" height="60%" >}}

{{<figure src="/images/flex-grid/align-content-space-evenly.svg" title="align-content-space-evenly" width="60%" height="60%" >}}

</div>

### place-content

`place-content` sets both the `align-content` and `justify-content` properties in a single declaration.

### justify-self

```css
.item-a {
    justify-self: start | end | center | stretch;
}
```

<div style="display: grid; grid-template-columns: repeat(2, 1fr);">

{{< figure src="/images/flex-grid/justify-self-center.svg" title="justify-self-center" width="60%" height="60%" >}}

{{< figure src="/images/flex-grid/justify-self-start.svg" title="justify-self-start" width="60%" height="60%" >}}

{{< figure src="/images/flex-grid/justify-self-end.svg" title="justify-self-end" width="60%" height="60%" >}}

{{< figure src="/images/flex-grid/justify-self-stretch.svg" title="justify-self-stretch" width="60%" height="60%" >}}

</div>

### grid-auto-columns & grid-auto-rows

Specifies the size of any auto-generated grid tracks (aka implicit grid tracks).

Example:

```css
.container {
    grid-template-columns: 60px 60px;
    grid-template-rows: 90px 90px;
}
.item-a {
    grid-column: 1 / 2;
    grid-row: 2 / 3;
}
.item-b {
    grid-column: 5 / 6;
    grid-row: 2 / 3;
}
```

{{< figure src="/images/flex-grid/grid-auto-columns-rows-01.svg" title="explicit grid" width="60%" height="60%" >}}

If use `grid-auto-columns`:

```css
.container {
    grid-auto-columns: 60px;
}
```

{{< figure src="/images/flex-grid/grid-auto-columns-rows-02.svg" title="implicit grid" width="60%" height="60%" >}}

### grid-auto-flow

If you have grid items that you don’t explicitly place on the grid, the auto-placement algorithm kicks in to automatically place the items.

```css
.container {
    grid-auto-flow: row | column | row dense | column dense;
}
```

Example:

```css
.container {
    display: grid;
    grid-template-columns: 60px 60px 60px 60px 60px;
    grid-template-rows: 30px 30px;
    grid-auto-flow: column;
}

.container div {
    border: 1px #ccc solid;
}

.item-a {
    grid-column: 1;
    grid-row: 1 / 3;
}
.item-e {
    grid-column: 5;
    grid-row: 1 / 3;
}
```

{{< figure src="/images/flex-grid/grid-auto-flow-01.svg" title="implicit grid" width="50%" height="50%" >}}

```css
.container {
    grid-auto-flow: column;
}
```

{{< figure src="/images/flex-grid/grid-auto-flow-02.svg" title="implicit grid" width="50%" height="50%" >}}

### grid

A shorthand for setting all of the following properties in a single declaration: `grid-template-rows`, `grid-template-columns`, `grid-template-areas`, `grid-auto-rows`, `grid-auto-columns`, and `grid-auto-flow`

### The Most Powerful Lines in Grid

> ```css
> .container {
>     grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
> }
> ```
