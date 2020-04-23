---
title: What is "this" in javascript
date: 2019-11-17
author: Haolin Yang
categories: ['Posts']
tags:
    - javascript
    - nodejs
---

author: Dmitri Pavlutin

reference: [https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/](https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/)

## Concept

-   **Invocation** of a function is executing the code that makes the body of a function, or simply calling the function. For example `parseInt` function invocation is `parseInt('15')`.
-   **Context** of an invocation is the value of this within function body. For example the invocation of `map.set('key', 'value')` has the context `map`.
-   **Scope** of a function is the set of variables, objects, functions accessible within a function body.

## Invocations

-   **function invocation:** alert('Hello World!')
-   **method invocation:** console.log('Hello World!')
-   **constructor invocation:** new RegExp('\\d')
-   **indirect invocation:** alert.call(undefined, 'Hello World!')

## this in different invocations

this is base on the context of calling this function

### Function invocation

#### this in a function invocation

this means `windows`

#### this in a function invocation, strict mode

this is `undefined`

#### Pitfall: this in an inner function

this is `windows` for inner function.

### method invocation

#### this in a method invocation

this is `object` who call the function

#### Pitfall: separating method from its object

```js
function Pet(type, legs) {
    this.type = type;
    this.legs = legs;

    this.logInfo = function () {
        console.log(this === myCat); // => false
        console.log(`The ${this.type} has ${this.legs} legs`);
    };
}

const myCat = new Pet('Cat', 4);
setTimeout(myCat.logInfo, 1000);
```

Because `setTimeout(myCat.logInfo)` consider `myCat.logInfo` this a whole part. this will represent setTimeout.

Use bind `setTimeout(myCat.logInfo.bind(myCat))` or arrow function.

### Constructor invocation

#### this in a constructor invocation

this is the newly created object

#### Pitfall: forgetting about new

## Conclusion

Because the function invocation has the biggest impact on this, from now on **do not ask yourself**:

_Where is this taken from?_

but **do** ask yourself:

_How is the function invoked?_

For **an arrow function** ask yourself:

_What is this where the arrow function is defined?_
