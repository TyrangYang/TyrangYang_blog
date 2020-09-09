# Js Trick


> Many of JavaScript cool feature or syntactic sugar included since ES6(ES2015).

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

