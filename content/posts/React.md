---
title: React overview
date: 2019-10-03
author: Haolin Yang
categories: ['Overview']
tags:
    - web
    - react
---

## Init react

Commend

```
npx create-react-app .
```

npx means you use this package but don't download it.

or with redux

```
npx create-react-app my-app --template redux
```

## life cycle

{{<figure src="/images/2019-10-03-react/rcc.png" title="Class component lifecycle" width="100%" height="100%" >}}

{{<figure src="/images/2019-10-03-react/rfc.jpg" title="Function component method" width="100%" height="100%" >}}

## Class Component ==> Functional Component

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

## React Posts Archive

> [See my other post]({{< ref "/react-posts-archive.md" >}})

## Structure

### package.json

react & react-dom is necessary for web app. For mobile app need react-native instead of react-dom.

### public/index.html

signal page application which is index.html

Everything your do will inside `<div id="root"></div>`

### src/index.js

Entry point for react

### src/App.js

All the component.

Inside the class, the render() method is called life cycle method and to render the page.

In JSX, you cannot use HTML class attribute. you have to use className.
