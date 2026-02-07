---
title: 'Prototype Inheritance in Javascript'
date: 2020-08-21T16:37:45-07:00
Categories: ['Posts']
tags: ['javascript', 'interview']
toc:
  enable: true
  auto: true
linkToMarkdown: true
math:
  enable: false
---

## Prototype

{{<figure src="/images/prototype-in-javascript/prototype.png" title="prototype"  >}}

```js
Foo.prototype.constructor === Foo; // true
f1.__proto__ === Foo.prototype; // true
```

```js
f1.constructor === Foo; // true
```

f1 don't have `constructor`, however depends on [prototype chain](#prototype-chain) engine will search `f1.__proto__`. This is line is equivalent to `Foo.prototype.constructor === Foo`

f1 instantiate a Foo:

1. `f1.__proto__`link `Foo.prototype`
2. `f1` have a constructor which is `Foo` since `Foo.prototype` have a constructor

## Object.create()

Syntax is `Object.create(proto[, propertiesObject])`

```js
var newObj = Object.create(obj);
newObj.__proto__ == obj; // true
```

## new

When js running this line:

```js
let person1 = new Person(...);
```

`new` actually doing:

1. Creates a blank, plain JavaScript object `person1 = {}`;
2. Links (sets the constructor of) this object to another object; `person1.constructor is Person`
3. Passes the newly created object from Step 1 as the this context; `this -> person1`
4. Returns this if the function doesn't return an object.

## Prototype Chain

This is object example. **But Object is NOT we used here**

```js
Person = {
  name: 'text',
  age: 12,
};

const p1 = {};
p1.__proto__ = Person; // it is wrong
```

### 1

```js
function Person(name, age) {
  this.name = name;
  this.age = age;
}

console.log(Person.prototype); // {} (empty obj)
console.log(Person.prototype.constructor === Person); // true
```

### 2

**Just for understanding. This is NOT right way**

```js
function Person(name, age) {
  this.name = name;
  this.age = age;
}

const p1 = Object.create(Person);
console.log(p1.__proto__ === Person); // true
```

### new instance should use function Prototype as chain

This is the right way

```js
function Person(name, age) {
  this.name = name;
  this.age = age;
}

const p1 = Object.create(Person.prototype); // build chain
console.log(p1.__proto__ === Person.prototype); // true
```

also you could link manually

```js
function Person(name, age) {
  this.name = name;
  this.age = age;
}

const p1 = {};
p1.__proto__ = Person.prototype; // link chain manually

p1.constructor('p1', 30);

console.log(p1.age);
```

### How to initialized

```js
function Person(name, age) {
  this.name = name;
  this.age = age;
}

const p1 = Object.create(Person.prototype);
Person.apply(p1, ['p1', 31]);

const p2 = Object.create(Person.prototype);
p2.constructor('p2', 32);
console.log(p1); // Person { name: 'p1', age: 31 }
console.log(p2); // Person { name: 'p2', age: 32 }
```

### If you want a instance function

```js
function Person(name, age) {
  this.name = name;
  this.age = age;
}

Person.prototype.print = function () {
  console.log(this.name, this.age);
};

const p1 = Object.create(Person.prototype);
const p2 = Object.create(Person.prototype);
p1.constructor('p1', 31);
p2.constructor('p2', 32);

p1.print();
p2.print();
```

## Summary

```js
const myNew = (constructor, ...args) => {
  const newObj = Object.create(constructor.prototype);
  const result = constructor.call(newObj, 'p1', 31);

  return typeof result === 'object' ? result : newObj;
};
const p1 = (Person, 'p1', 31);
// equivalent to
const p1 = new Person('p1', 31);
```

`Person.prototype` can be consider as a share level.

## ES5 inheritance

```js
function SuperType(name) {
  this.name = name;
  this.colors = ['red', 'blue', 'green'];
}
SuperType.prototype.sayName = function () {
  alert(this.name);
};
function SubType(name, age) {
  SuperType.call(this, name);
  this.age = age;
}
SubType.prototype = Object.create(SuperType.prototype, {
  constructor: {
    value: SubType,
    enumerable: false,
    writable: true,
    configurable: true,
  },
});
SubType.prototype.sayAge = function () {
  alert(this.age);
};
let instance = new SubType('gim', '17');
instance.sayName(); // 'gim'
instance.sayAge(); // '17'
```

{{<figure src="/images/prototype-in-javascript/es5" title="es5"  >}}

## ES6 inheritance

```js
class SuperType {
  constructor(name) {
    this.name = name;
    this.colors = ['red', 'blue', 'green'];
  }
  sayName() {
    alert(this.name);
  }
}
class SubType extends SuperType {
  constructor(name, age) {
    super(name);
    this.age = age;
  }
  sayAge() {
    alert(this.age);
  }
}
let instance = new SubType('gim', '17');
instance.sayName(); // 'gim'
instance.sayAge(); // '17'
```

{{<figure src="/images/prototype-in-javascript/es6" title="es6"  >}}
