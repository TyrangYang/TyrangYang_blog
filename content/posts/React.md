---
title: React overview
date: 2019-10-03
author: Haolin Yang
categories: ['Overview']
tags:
    - web
    - react
---

## init react

Commend

```
    npx create-react-app .
```

npx means you use this package but don't download it.

## Structure

### package.json

react & react-dom is necessary for web app. For mobile app need react-native instead of react-dom.

### public/index.html

signal page application which is index.html

Everything your do will inside \<div id="root"\>\</div\>

### src/index.js

Entry point for react

### src/App.js

All the component.

Inside the class, the render() method is called life cycle method and to render the page.

In JSX, you cannot use HTML class attribute. you have to use className.

## react

states is statement

props is property

## life cycle

Class component:
![rfc](/images/2019-10-03-react/rcc.png)

Functional component:

![rfc](/images/2019-10-03-react/rfc.jpg)

### Connection

|     Class component     |                       Functional component                       |
| :---------------------: | :--------------------------------------------------------------: |
|    state + setState     |                            useState()                            |
|   componentDidMount()   |               useEffect() with a empty input list                |
|  componentDidUpdate()   | useEffect() with a input list contained which you want to change |
| componentWillUnmount()  |           useEffect() with a return callback function            |
| shouldComponentUpdate() |                           React.memo()                           |

useState() =>

```js
const [state, setstate] = useState(initialState);
```

useEffect() =>

```js
useEffect(() => {
    <effect>;
    return () => {
        <cleanup>;
    };
}, [<input>]);
```

React.memo() =>

```js
export default React.memo(App);
```

[link](https://www.jianshu.com/p/ce5451287f1c)

## How to connect your React app to a backend on the same origin

https://flaviocopes.com/how-to-serve-react-from-same-origin/
