# Js Trick


{{< admonition type=warning title="warning" open=true >}}
Many of JavaScript cool feature or syntactic sugar included since ES6(ES2015).
{{< /admonition >}}

> You can read this [Article to know What new feature brings in since ES6](https://medium.com/engineered-publicis-sapient/javascript-es6-es7-es10-where-are-we-8ac044dfd964)

## Conversion

### Any => Boolean

```js
!!false; // false
!!undefined; // false
!!null; // false
!!NaN; // false
!!0; // false
!!''; // false

!!variable == Boolean(variable);
```

### String => Integer

```js
Number('100'); //100
+'100'; // 100

+'abc'; // NAN
```

### Object <=> Array

#### Array => Object

```js
let arr = [1, 2, 3, 4, 5];

let objFromArr1 = Object.assign({}, arr);

let objFromArr2 = { ...arr };

console.log(objFromArr1); // { '0': 1, '1': 2, '2': 3, '3': 4, '4': 5 }

console.log(objFromArr2); // { '0': 1, '1': 2, '2': 3, '3': 4, '4': 5 }

let pair = [
    ['key1', 'val1'],
    ['key2', 'val2'],
]; // Map works as well

let objFromPair = Object.fromEntries(arr); // ES10

console.log(objFromPair); //{ key1: 'val1', key2: 'val2' }
```

> `Object.fromEntries(arr)` included in ES10 (ES2019). Before ES10 or convert a complex array, `arr.reduce(()=>{}, {})` is a good method

#### Object => Array

```js
let obj = {
    name: 1,
    age: 2,
};

let keys = Object.keys(obj);
let values = Object.values(obj);
let entries = Object.entries(obj);

console.log(keys); // [ 'name', 'age' ]
console.log(values); // [  1, 2 ]
console.log(entries); // [ [ 'name', 1 ], [ 'age', 2 ] ]
```

> `Object.values` & `Object.entries` are from ES8 (ES2017)

## let vs var

-   var is function-scoped
-   let (and const) are block-scoped

```js
function doMoreStuff() {
    if (2 + 4 === 4) {
        // Here, `a` will be available for the whole function
        var a = 5;
        // But `b` will be available only inside this if block
        let b = 5;
    }
    console.log(a); // undefined
    console.log(b); // ​​b is not defined​​
}

doMoreStuff(); // ​​b is not defined​​
```

## Shallow copy & Deep copy

### Shallow copy

```js
// array
let nums1 = [1, 2, 3, 4, 5];

let nums2 = [...nums1];

let num3 = nums1.concat();

let num3 = nums1.slice();

// Object
let obj1 = {
    test1: 1,
    test2: {
        test3: 2,
        test4: 3,
    },
};
let obj2 = { ...obj1 };
let obj3 = Object.assign({}, obj1);
```

### deep copy

```js
// array and obj`
let copy = JSON.parse(JSON.stringify(orig));
```

## Exponential

ES7 feature

```js
let res = Math.pow(x, 2);
// new operator added in ES7
res = x ** 2;
```

## Nullish coalescing

MDN: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_operator

The nullish coalescing operator (??) is a logical operator that returns its right-hand side operand when its left-hand side operand is _null_ or _undefined_, and otherwise returns its left-hand side operand.

This operator used to replace `||` in some situations that `or` logic cannot handle elegantly.

```js
let calTax = (price, taxRate) => {
    taxRate = taxRate || 0.05; // if taxRate not provided (undefined), set default to 0.05
    // But there is a problem when taxRate to 0
    return price * (1 + taxRate);
};

let res1 = calTax(100, 0); // 105 WRONG X
let res2 = calTax(100); // 105 correct ✓

let calTax2 = (price, taxRate) => {
    taxRate = taxRate ?? 0.05; // if taxRate not provided (undefined), set default to 0.05
    // But there is a problem when taxRate to 0
    return price * (1 + taxRate);
};

let res3 = calTax2(100, 0); // 100 correct X
let res4 = calTax2(100); // 105 correct ✓

console.log(res3, res4);
```

## Optional chaining

```js
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }

    getAge() {
        return this.age;
    }
}

let p1 = new Person(undefined, 12);

console.log(p1.getAge()); // 12
console.log(p1.name.firstName); // Error
console.log(p1.getSex()); // Error
console.log(p1.name?.firstName); // undefined
console.log(p1.getSex?.()); // undefined
```

## Naming object

If object key has same name with the variable in value, just use variable name.

```js
let a = 1,
    b = 2,
    c = 3;

let res = { a, b, c }; // this is equal to // res = {a: a, b: b, c: c};
console.log(res); // { a: 1, b: 2, c: 3 }
```

## Destruct

> _Array destructing_ is ES6 feature, **But** _Object destructing_ is ES9 feature....

```js
let array = [1, 2, 3, 4];
let [a1, a2, ...a3] = array;
console.log(a1, a2, a3); // 1 2 [ 3, 4 ]

let test = {
    a: 1,
    b: 2,
    c: {
        d: 3,
        e: 4,
    },
    f: 5,
    g: 6,
};

let {
    a,
    b,
    c: { d, e },
    ...f
} = test;

console.log(a, b, d, e, f); // 1 2 3 4 { f: 5, g: 6 }
```

### Add space for every four digit

```js
let value = '123456789';
value = value
    .replace(/\W/gi, '')
    .replace(/(.{4})/g, '$1 ')
    .trim();

console.log(value); // 1234 5678 9
```

> `.trim()` for supporting deletion

## Function compose

Compose a list of function into one. I saw this in create middleware

```js
const f1 = (val) => `1<${val}>`;
const f2 = (val) => `2<${val}>`;

const compose = (...functionList) => {
    return functionList.reduce((prevFn, curFn) => {
        return (val) => curFn(prevFn(val));
    });
};

const composedFun = compose(f1, f2);
console.log(composedFun('hello world')); // 2<1<hello world>>
```

But we can improve this compose function.

1. not need those `return`
2. the final reduced function `(val) => curFn(prevFn(val));` may have several arguments, therefore `val` change to `...args`
3. reduce function should give the second parameter as initial state in case the function list is empty

```js
const f1 = (val) => `1<${val}>`;
const f2 = (val) => `2<${val}>`;

const compose = (...functionList) =>
    functionList.reduce(
        (prevFn, curFn) => (...args) => curFn(prevFn(...args)),
        (val) => val
    );

const composedFun = compose(f1, f2);
console.log(composedFun('hello world')); // 2<1<hello world>>
const composedFun2 = compose();
console.log(composedFun2('hello world')); // hello world
```

## tagged template

Since es6, js provide a special function called tagged template which use template string as parameter

```js
function normal(...args) {
    console.log(args);
}

normal(1, 2, 'string1', 'string2');
// [ 1, 2, 'string1', 'string2' ]

function tag(...args) {
    console.log(args);
}

tag`string1${1}string2${2}string3`;
// [ [ 'string1', 'string2', 'string3' ], 1, 2 ]
```

Normally, the tagged template function will handle arguments like:

```js
function tag(strings, ...args) {
    console.log(strings, args);
}

tag`string1${1}string2${2}string3`;
// [ 'string1', 'string2', 'string3' ] [ 1, 2 ]
```

## Debounce & throttle

> Here is my Example: [Try it Now](/html/debounce&throttle.html)
>
> Play in [CodePen](https://codepen.io/TyrangYang/pen/YzqJZJX)

### Debounce

The debounce function delays the processing of event until the user has stopped trigger it.

The core logic is using HOF to only keep the last trigger.

```js
const debounce = (fn, delay) => {
    let timer = null;
    return (...args) => {
        clearTimeout(timer);
        timer = setTimeout(() => {
            fn(...args);
        }, delay);
    };
};
```

### Throttle

The Throttle function only allows one event running in a period of time

The core logic is using HOF to only keep the first trigger.

```js
const throttle = (fn, delay) => {
    let timer = null;
    return (...args) => {
        if (timer !== null) {
            return;
        }
        clearTimeout(timer);
        timer = setTimeout(() => {
            timer = null;
            fn(...args);
        }, delay);
    };
};
```

## Snapshot & current value

This problem due to the fact that every time you log out base on same reference or different variable

```js
for (var i = 0; i < 10; i++) {
    setTimeout(() => console.log('val:', i)); // current value
}
// 10 10 ... 10 10

for (let i = 0; i < 10; i++) {
    setTimeout(() => console.log('val:', i)); // snapshot
}
// 1 2 ... 8 9

// var is function scope, let is block scope

for (var i = 0; i < 10; i++) {
    setTimeout(((val) => console.log('val:', val)).bind(null, i)); // snapshot
}
// 1 2 3 4 ... 9

const ref = { current: null };
for (var i = 0; i < 10; i++) {
    ref.current = i;
    setTimeout(((val) => console.log('val:', val.current)).bind(null, ref)); // current val
}
// 9 9 ... 9 9

for (var i = 0; i < 10; i++) {
    // snapshot
    const t = i;
    setTimeout(() => {
        console.log('t:', t);
    });
}
// 1 2 3 4 ... 9
```

## bind <==> callback

`fn.bind(context, ...args)` will return a new function with a given context and given several arguments.

If `context` is **null**, `bind()` same like callback

`newFn = fn.bind(null, ...args);` == `newFn = (...newArgs) => fn(...args,...newArgs);`

