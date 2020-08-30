# Prototype Inheritance in Javascript


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

```js
var obj = {
    func: function () {
        return this.x;
    },
};

var newObj = Object.create(obj);

newObj.__proto__ == obj; // true

newObj; // {}
newObj.func; // f(){return this.x}
newObj.x = 10;
newObj.y = 20;
newObj; // {x: 10, y: 20}
newObj.func(); // 10
obj.func(); // undefined
```

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

