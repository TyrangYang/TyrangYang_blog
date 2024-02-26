# HTML/Document Trick


## Understanding offsetWidth, clientWidth, scrollWidth

{{< admonition type=note title="Note" open=true >}}
All these property will round the value to an integer. If you need a fractional value, use [element.getBoundingClientRect()](#element-getboundingclientrect).
{{< /admonition >}}
{{<figure src="/images/html-trick/screen-width.png" >}}

## Get Scrollbar width

Reference: https://www.30secondsofcode.org/js/s/get-scrollbar-width/

### Get window scroll bar width

```js
const getScrollbarWidth = () =>
    window.innerWidth - document.documentElement.clientWidth;

getScrollbarWidth();
```

### Get a element scroll bar width

```js
const getScrollbarWidth = (el) => {
    const leftBorder = parseInt(
        getComputedStyle(el).getPropertyValue('border-left-width'),
        10
    );
    const rightBorder = parseInt(
        getComputedStyle(el).getPropertyValue('border-right-width'),
        10
    );

    return el.offsetWidth - el.clientWidth - leftBorder - rightBorder;
};

getScrollbarWidth(el);
```

## Element: getBoundingClientRect()

`el.getBoundingClientRect()` will return: `left`, `top`, `right`, `bottom`, `x`, `y`, `width`, and `height`.

> 1. `x` === `left` & `y` === `top`
> 2. In the standard box model, `width` and `height` will automatically calculate `padding` and `border-width`.
> 3. if `box-sizing: border-box` is set for the element this would be directly equal to its `width` or `height`.

{{<figure src="/images/html-trick/element-box-diagram.png" >}}

