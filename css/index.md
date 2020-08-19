# CSS Overview


CSS cheat sheet: [html](/csscrashcourse/csscheatsheet/index.html) & [css](/csscrashcourse/csscheatsheet/css/style.css) provided by [Traversy Media](https://youtu.be/yfoY53QXEnI)

## Font

`font-size` size

`font-family: <FAMILY_NAME>, <GENERIC_NAME>;` font-family: Lobster monospace;

GENERIC_NAME: sans-serif serif monospace;

sans-serif force on connected and serif force on single alphabet.

`line-height: 25px;`

### Import font

Could use google font and add link into index.html or in style.css

## Control space

There are three important properties to control the space: `padding`, `margin` and `border`

### Border

`border-size`

`border-color`

`border-width`

`border-style`

### padding

`Padding` control the amount of space between the element's content and its border;

`padding-top` `padding-right` `padding-bottom` `padding-left`

or specify them all in one line clockwise:

`padding: 20px 10px 20px 10px;`

or specify top-bottom and left-right

`padding: 20px 10px;`

### Margin

`margin` controls the amount of space between an element's border and surrounding elements.

`margin-top` `margin-right` `margin-bottom` `margin-left`

or specify them all in one line clockwise:

`margin: 20px 10px 20px 10px;`

or specify top-bottom and left-right

`margin: 20px 10px;`

## CSS inheritance

Afterword can overwrite previous.

Id will always take precedence.

```html
<style>
    body {
        background-color: black;
        font-family: monospace;
        color: green;
    }
    #orange-text {
        color: orange;
    }
    .pink-text {
        color: pink !important;
    }
    .blue-text {
        color: blue;
    }
</style>
<h1 id="orange-text" class="pink-text blue-text" style="color: white">
    Hello World!
</h1>
```

## text

`text-align: justify`; causes all lines of text except the last line to meet the left and right edges of the line box.

`text-align: center`; centers the text

`text-align: right`; right-aligns the text

`And text-align: left`; (the default) left-aligns the text.

### decoration

`font-weight: bold;` <strong></strong>

`text-decoration: underline;` <u></u>

`font-style: italic;` <em></em>

`text-decoration: line-through;` <s></s>

### transform

The text-transform property in CSS is used to change the appearance of text. It's a convenient way to make sure text on a webpage appears consistently, without having to change the text content of the actual HTML elements.

|   Value    |                        Result                        |
| :--------: | :--------------------------------------------------: |
| lowercase  |                    "transform me"                    |
| uppercase  |                    "TRANSFORM ME"                    |
| capitalize |                    "Transform Me"                    |
|  initial   |                Use the default value                 |
|  inherit   | Use the text-transform value from the parent element |
|    none    |            Default: Use the original text            |

## Box shadow

The `box-shadow` property applies one or more shadows to an element.

The `box-shadow` property takes values for

-   `offset-x` (how far to push the shadow horizontally from the element),
-   `offset-y` (how far to push the shadow vertically from the element),
-   `blur-radius`,
-   `spread-radius` and
-   `color`, in that order.

The blur-radius and spread-radius values are optional.

_Multiple box-shadows_ can be created by using commas to separate properties of each box-shadow element.

## opacity

The `opacity` property in CSS is used to adjust the opacity, or conversely, the transparency for an item.

> A value of 1 is opaque, which isn't transparent at all.
> A value of 0.5 is half see-through.
> A value of 0 is completely transparent.

## pseudo-classes

tag can be changed for its hover state using the :hover

```css
a:hover {
    color: red;
}
```

## position

The position property specifies the type of positioning method used for an element.

you have `top left bottom right` to set the position

There are five different position values:

-   static: default
-   relative: relative to normal position
-   absolute: target wherever position inside of a relative element (
-   fixed: fix to browser window
-   sticky

## color

## linear-gradient

`background: linear-gradient(30deg, #cff, #fcc);`

```css
    repeating-linear-gradient(
        90deg,
        yellow 0px,
        blue 40px,
        green 40px,
        red 80px
    );
```

0px [yellow -- blend -- blue] 40px [green -- blend -- red] 80px

## animate

```html
<style>
    button {
        border-radius: 5px;
        color: white;
        background-color: #0f5897;
        padding: 5px 10px 8px 10px;
    }
    button:hover {
        animation-name: background-color;
        animation-duration: 500ms;
        animation-fill-mode: forwards;
    }
    @keyframes background-color {
        100% {
            background-color: #4791d0;
        }
    }
</style>
<button>Register</button>
```

## cubic-bezier

A curve about about animation speed.

Use two point to decide the curve

![curve](/images/2020-03-17-css/curve.jpg)

## tabindex

```html
<style>
    p:focus {
        background-color: yellow;
    }
</style>
<p tabindex="0">
    Instructions: Fill in ALL your information then click <b>Submit</b>
</p>
```

## Layout

[Sample code](https://jsfiddle.net/bradtraversy/bu0ecodm/1/) provided by [Traversy Media](https://youtu.be/JJSoEo8JSnc)

> **There is an another compare flex and grid**: [Flex and Grid in CSS]({{< ref "posts/flex-grid.md">}})

### Flex

> [**More Detail**]({{< relref "posts/flex-grid.md#flex">}}) in Flex and Grid in CSS

[**Cheat Sheet**](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) provide by CSS-tricks.com

A [Flexbox code Example](https://jsfiddle.net/tyrang/oqu9p5ch/)

### grid

[**More Detail**]({{< relref "posts/flex-grid.md#grid">}}) in Flex and Grid in CSS

[**Cheat Sheet**](https://css-tricks.com/snippets/css/complete-guide-grid/) provide by CSS-tricks.com

A [Grid code Example](https://jsfiddle.net/tyrang/Ljbd3gy4/)

## z-index

Move some element to the front or back.

`z-index = 10;`

## Personal default style

### button

```css
.btn {
    display: inline-block;
    padding: 5px 30px;
    background: var(--primarily-color);
    color: #fff;
    border: 1px #fff solid;
    border-radius: 5px;
    margin-top: 25px;
    opacity: 0.7;
}
.btn:hover {
    transform: scale(0.98);
}
```

