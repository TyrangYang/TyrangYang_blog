# Js Trick


## Convert to boolean

```js
!!false; // false
!!undefined; // false
!!null; // false
!!NaN; // false
!!0; // false
!!''; // false

!!variable == Boolean(variable);
```

## Convert to integer

```js
Number('100');
+'100';
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

Array destructing is ES6 feature
Object destructing is ES9 feature....

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

