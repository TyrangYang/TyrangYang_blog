# How to have a dynamic class name


In same case, you may want to have a different style depend on your state or a variable. Now we can have two ways to achieve that.

## classNames

This is a javascript for conditionally joining classNames.

Here is: [Github](https://github.com/JedWatson/classnames)

Basically, you can combine any number of classNames.

```js
const classNames = require('classNames');
classNames('foo', { bar: true, duck: false }, 'baz', { quux: true }); // => 'foo bar baz quux'
```

## ES6 template literals

You can just use template literals.

```js
let condition = true;

let res = condition ? 'first' : 'second'; // res = first
```

Therefore when your write className in react:

```js
let condition = true;
<div className={condition ? '' : 'error'; }> TEST</div> // class name can be exist or not
<div className={condition ? 'right' : 'error'; }> TEST</div> // class name can be right or error
```

I have an example in a simple react application([Github](https://github.com/TyrangYang/SpaceX_graphql_react)). The color of launch name is depend on whether it success or not.

