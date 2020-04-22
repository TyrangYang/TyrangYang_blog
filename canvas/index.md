# Canvas in html5


Canvas is a new feature since **html5** that allows you draw something on your web page

Reference from [MDN](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API)

## Draw on canvas

### Get start

Jquery to get canvas. ctx mean canvas content which used to draw on canvas

```js
const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');
```

### fill & stroke rectangle

```js
// fillRect()
ctx.fillStyle = 'red';
ctx.fillRect(20, 20, 150, 100); // up left point and weight and height

// strokeRect()
ctx.lineWidth = 4;
ctx.strokeStyle = '#555';
ctx.strokeRect(180, 130, 150, 100);
```

### Text

```js
// fillText();
ctx.font = '30px Arial';
ctx.fillStyle = 'green';
ctx.fillText('hello world', 400, 100);

// strokeText();
ctx.lineWidth = 1;
ctx.strokeStyle = 'red';
ctx.strokeText('hello world', 400, 200);
```

### Path

`moveTo` set the start point and `lineTo` set the end point.

```js
ctx.beginPath();
ctx.moveTo(20, 20);
ctx.lineTo(150, 150);
ctx.lineTo(20, 150);
ctx.lineTo(20, 20);
// or
ctx.closePath();
ctx.stroke();
ctx.fillStyle = 'coral';
ctx.fill();
```

### arc

arc(centerX, centerY, Radius, startAngle, endAngel, isClockWise)

```js
// arc(cycle)
ctx.beginPath();
const centerX = canvas.width / 2;
const centerY = canvas.height / 2;
// ctx.moveTo(0, 0);
ctx.arc(centerX, centerY, 200, 0, Math.PI * 2);
ctx.moveTo(centerX + 100, centerY);
ctx.arc(centerX, centerY, 100, 0, Math.PI, false);
ctx.moveTo(centerX - 60, centerY - 80);
ctx.arc(centerX - 80, centerY - 80, 20, 0, Math.PI * 2);
ctx.moveTo(centerX + 100, centerY - 80);
ctx.arc(centerX + 80, centerY - 80, 20, 0, Math.PI * 2);
ctx.stroke();
```

### locate a point on canvas

When you add listener for canvas, event object have `e.clientX` and `e.clientY` to locate the position one canvas. Or using `e.pageX - canvas.offsetLeft` and `e.pageY - canvas.offsetTop`. (This means the position on the page, include scroll down, minus canvas offset)

## Project by using Canvas

-   [Chaos Game](https://tyrangyang.github.io/chaos-game/)
    > Use canvas to draw the chaos game
-   [Draw panel with socket.io](https://scribble-panel.herokuapp.com)
    > A scribble panel with Websocket. Multi user can draw panel on simultaneously

## Reference

[https://wesbos.com/html5-canvas-websockets-nodejs/](https://wesbos.com/html5-canvas-websockets-nodejs/) && [https://stackoverflow.com/questions/2368784/draw-on-html5-canvas-using-a-mouse](https://stackoverflow.com/questions/2368784/draw-on-html5-canvas-using-a-mouse)

