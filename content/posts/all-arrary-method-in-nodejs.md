---
title: All array method in Nodejs
date: 2020-04-06
author: Haolin Yang
categories: ["Overview"]
tag:
    - js
    - nodejs
    - array
toc: true
autoCollapseToc: true
---

-   [All methods](#all-methods)
    -   [foreach](#foreach)
    -   [map](#map)
    -   [filter](#filter)
    -   [reduce](#reduce)
    -   [slice](#slice)
    -   [splice](#splice)
    -   [sort](#sort)
    -   [concat](#concat)
    -   [fill](#fill)
    -   [include](#include)
    -   [join](#join)
    -   [reverse](#reverse)
    -   [push](#push)
    -   [pop](#pop)
    -   [unshift](#unshift)
    -   [shift](#shift)
    -   [indexOf & lastIndexOf](#indexof--lastindexof)
    -   [every](#every)
    -   [some](#some)
    -   [find](#find)
    -   [findIndex](#findindex)
    -   [from](#from)
    -   [isArray](#isarray)
    -   [flat](#flat)

## All methods

### foreach

```js
let numbers = [1, 2, 3, 4, 5];
// each element in a func
numbers.forEach((element, index, arr) => {
    console.log(`a[${index}] = ${element}`);
});
// a[0] = 1
// a[1] = 2
// a[2] = 3
// a[3] = 4
// a[4] = 5
```

### map

```js
let numbers = [1, 2, 3, 4, 5];

// [] => [] (some size)
let numbers2 = numbers.map((e, index, arr) => {
    return e * index;
});
console.log(numbers2); // [0, 2, 6, 12, 20]
```

### filter

```js
let numbers = [1, 2, 3, 4, 5];
// [] => fuc => [] (some left)
let numbers3 = numbers.filter((e, index, arr) => {
    return arr.indexOf(e) === index;
}); // remove duplication
```

### reduce

```js
let numbers = [1, 2, 3, 4, 5];
// [] => 1
let numbers4 = numbers.reduce((prev, cur, curIndex, arr) => {
    return prev + cur;
}, 0);
console.log(numbers4); // 15

let maxValue = numbers.reduce((prev, cur) => {
    if (prev > cur) return prev;
    else return cur;
}, -Infinity);
console.log(maxValue); // 5
```

### slice

```js
let numbers = [1, 2, 3, 4, 5];
// [start, end)
// [start to end)
let first2 = numbers.slice(0, 2);
let sallowCopy = numbers.slice(); // could sallow copy an array
sallowCopy[5] = 100;
let last3 = numbers.slice(-3);
let startFrom1 = numbers.slice(1);
console.log([first2, sallowCopy, last3, startFrom1]);
// [ [ 1, 2 ], [ 1, 2, 3, 4, 5, 100 ], [ 3, 4, 5 ], [ 2, 3, 4, 5 ] ]
```

### splice

```js
let numbers = [1, 2, 3, 4, 5];

let deleted = numbers.splice(1, 2, 'add', 'add'); // (start point, num, ...add-in)
console.log(numbers, deleted);
//[ 1, 'add', 'add', 4, 5 ] [ 2, 3 ]
```

### sort

```js
let numbers = [75, 22, 18, 10, 100, 214, 1];
numbers.sort(); // not sort by number;
console.log(numbers); // [1, 10, 100, 18, 214, 22,  75]
numbers.sort((a, b) => {
    return a - b; // cannot a > b; 100 < 18 ; 100 - 18 > 0;
});
console.log(numbers); // [ 1, 10, 18, 22, 75, 100, 214]
```

### concat

```js
let a = [1, 2, 3];
let b = [10, 20, 30];
let c = a.concat(b);
let d = a.concat(c, 100, a);
console.log(c); // [ 1, 2, 3, 10, 20, 30 ]
console.log(d); // [ 1, 2, 3, 1, 2, 3, 10, 20, 30, 100, 1, 2, 3]
sallowCopy = d.concat(); // also a sallow copy
```

### fill

```js
let numbers = [1, 2, 3, 4, 5];
// fill
let out = numbers.fill(0, 2, 4); // (value, start, end)
console.log(out); // [ 1, 2, 0, 0, 5 ]
console.log(numbers); // [ 1, 2, 0, 0, 5 ]
let fillInNumber = (n) => {
    return Array(n)
        .fill(0)
        .map((_, idx) => idx);
};
console.log(fillInNumber(10)); // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
```

### include

```js
let names = ['andy', 'bob', 'eve'];
console.log(names.includes('bob')); // true
```

### join

```js
let names = ['andy', 'bob', 'eve'];

let res = names.join();
console.log(res); // andy,bob,eve
res = names.join(' - ');
console.log(res); // andy - bob - eve
```

### reverse

```js
let names = ['andy', 'bob', 'eve'];
let str = 'coding is fun';
res = str.split(' ').reverse().join(' ');
console.log(res); // fun is coding
```

### push

```js
let numbers = [0];

let len = numbers.push(1, 2, 3, 4, 5);
console.log(len); // 6
console.log(numbers); // [ 0, 1, 2, 3, 4, 5 ]
```

### pop

```js
let numbers = [1, 2, 3, 4, 5];

let lastItem = numbers.pop();
console.log(lastItem); // 5
console.log(numbers); // [1,2,3,4]
```

### unshift

```js
let numbers = [1, 2, 3, 4, 5];

len = numbers.unshift(-1, -2); // push at begin
console.log(len); // 7
console.log(numbers); // [-1, -2, 1, 2, 3, 4, 5]
```

### shift

```js
let numbers = [1, 2, 3, 4, 5];
let res = numbers.shift();
console.log(res, numbers); // 1 [2, 3, 4, 5]
```

### indexOf & lastIndexOf

```js
let names = ['florin', 'ivan', 'liam', 'ivan', 'liam'];

let idx = names.indexOf('jay');

console.log(idx); // -1

idx = names.indexOf('liam'); // return first index

console.log(idx); // 2

idx = names.lastIndexOf('liam');

console.log(idx); // 4
```

### every

```js
let numbers = [1, 2, 3, 4, 5];
// each => bool
let res = numbers.every((each) => {
    return each > 0;
});

console.log(res); // true

const people = [{ name: '1' }, { name: '1' }, { name: '1' }, { surname: '1' }];
res = people.every((each) => each.name !== undefined);
console.log(res); // false
```

### some

```js
let numbers = [1, 2, 3, 4, 5];

let res = numbers.some((each) => {
    return each > 4;
});

console.log(res); // true
```

### find

```js
let people = [
    {
        name: 'florin',
        age: 25,
    },
    {
        name: 'ivan',
        age: 20,
    },
    {
        name: 'lima',
        age: 18,
    },
];

let res = people.find((each) => {
    return each.name == 'ivan';
}).age;

console.log(res); // 20
```

### findIndex

```js
const numbers = [1, 2, 3, 4, 5];

let res = numbers.findIndex((each) => {
    return each === 4;
});

console.log(res); // 3
```

### from

Make a shallow copy from a iterable object

```js
const str = '1234567';

const res = Array.from(str, (each) => Number(each));

console.log(res);

let numbers = [1, 2, 3, 4, 3, 2, 1, 3, 3, 4, 3, 5, 2];

let s = new Set(numbers);

numbers = Array.from(s);

console.log(numbers);
```

### isArray

```js
let numbers = [1, 2, 3, 4, 3, 2, 1, 3, 3, 4, 3, 5, 2];
const str = '1234567';
let number = 12;

console.log(Array.isArray(numbers)); // true
console.log(Array.isArray(str)); // false
console.log(Array.isArray(number)); // false
```

### flat

```js
```
