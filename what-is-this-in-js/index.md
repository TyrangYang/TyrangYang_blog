# What is "this" in javascript


Author: Dmitri Pavlutin

Reference: [https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/](https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/)

## Concept

-   **Invocation** of a function is executing the code that makes the body of a function, or simply calling the function. For example `parseInt` function invocation is `parseInt('15')`.
-   **Context** of an invocation is the value of this within function body. For example the invocation of `map.set('key', 'value')` has the context `map`.
-   **Scope** of a function is the set of variables, objects, functions accessible within a function body.

## Invocations

-   **function invocation:** alert('Hello World!')
-   **method invocation:** console.log('Hello World!')
-   **constructor invocation:** new RegExp('\\d')
-   **indirect invocation:** alert.call(undefined, 'Hello World!')

## _this_ in different invocations

`this` is base on **the context of calling this function**

### Function invocation

Example:

```js
const numbers = {
    numberA: 5,
    numberB: 10,
    sum: function () {
        console.log(this === numbers); // => true
        const calculate = () => {
            console.log(this === numbers); // => true
            return this.numberA + this.numberB;
        };
        return calculate();
    },
};
numbers.sum(); // => 15
```

`console.log(this === window);` returns `true` only when your running in a browser otherwise it will give an ERR from Node.js

#### _this_ in a function invocation

`this` means `windows`

```js
function sum(a, b) {
    console.log(this === window); // => true
    this.myNumber = 20; // add 'myNumber' property to global object
    return a + b;
}
// sum() is invoked as a function
// this in sum() is a global object (window)
sum(15, 16); // => 31
window.myNumber; // => 20
```

#### _this_ in a function invocation, strict mode

this is `undefined`

```js
function nonStrictSum(a, b) {
    // non-strict mode
    console.log(this === window); // => true
    return a + b;
}

function strictSum(a, b) {
    'use strict';
    // strict mode is enabled
    console.log(this === undefined); // => true
    return a + b;
}

// nonStrictSum() is invoked as a function in non-strict mode
// this in nonStrictSum() is the window object
nonStrictSum(5, 6); // => 11
// strictSum() is invoked as a function in strict mode
// this in strictSum() is undefined
strictSum(8, 12); // => 20
```

#### Pitfall: _this_ in an inner function

⚠️ A common trap with the function invocation is thinking that this is the same in **an inner function as in the outer function.**

👍Correctly the context of the inner function depends only on its invocation type, but not on the outer function’s context.

`this` is `windows` for inner function.

```js
const numbers = {
    numberA: 5,
    numberB: 10,

    sum: function () {
        console.log(this === numbers); // => true

        function calculate() {
            // this is window or undefined in strict mode
            console.log(this === numbers); // => false
            return this.numberA + this.numberB;
        }

        return calculate();
    },
};

numbers.sum(); // => NaN or throws TypeError in strict mode
```

⚠️ `numbers.sum()` is a **method invocation**. But `calculate()` is a **function invocation**

There are two ways to fix this:

Use `calculate.call(this)` that an indirect invocation of a function.

```js
const numbers = {
    numberA: 5,
    numberB: 10,
    sum: function () {
        console.log(this === numbers); // => true

        function calculate() {
            console.log(this === numbers); // => true
            return this.numberA + this.numberB;
        }

        // use .call() method to modify the context
        return calculate.call(this);
    },
};
numbers.sum(); // => 15
```

of use arrow function

```js
const numbers = {
    numberA: 5,
    numberB: 10,
    sum: function () {
        console.log(this === numbers); // => true

        const calculate = () => {
            console.log(this === numbers); // => true
            return this.numberA + this.numberB;
        };

        return calculate();
    },
};

numbers.sum(); // => 15
```

### Method invocation

Example:

```js
const myObject = {
    // helloFunction is a method
    helloFunction: function () {
        return 'Hello World!';
    },
};
// method invocation
const message = myObject.helloFunction();
```

#### _this_ in a method invocation

`this` is `object` who call the function

```js
// Object
const calc = {
    num: 0,
    increment() {
        console.log(this === calc); // => true
        this.num += 1;
        return this.num;
    },
};
// method invocation. this is calc
calc.increment(); // => 1
calc.increment(); // => 2

// Object inherits a method from its prototype
const myDog = Object.create({
    sayName() {
        console.log(this === myDog); // => true
        return this.name;
    },
});
myDog.name = 'Milo';
// method invocation. this is myDog
myDog.sayName(); // => 'Milo'

// class syntax
class Planet {
    constructor(name) {
        this.name = name;
    }
    getName() {
        console.log(this === earth); // => true
        return this.name;
    }
}
const earth = new Planet('Earth');
// method invocation. the context is earth
earth.getName(); // => 'Earth'
```

#### Pitfall: Separating method from its object

⚠️ A method can be extracted from an object into a separated variable like:

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
console.log(setTimeout(myCat.logInfo, 1000));
// logs "The undefined has undefined legs"
// or throws a TypeError in strict mode
```

In this code `myCat.logInfo` is extracted from object `myCat` as a function. Therefore is equal to:

```js
setTimeout(function () {
    console.log(this === myCat); // => false
    console.log(`The ${this.type} has ${this.legs} legs`);
}, 1000);
```

Now you can see that `this` is invocated by **function invocation** rather than **method invocation**.

> To fix this, Use bind `setTimeout(myCat.logInfo.bind(myCat))` or arrow function for `logInfo`.

### Constructor invocation

Example:

```js
function Country(name, traveled) {
    this.name = name ? name : 'United Kingdom';
    this.traveled = Boolean(traveled); // transform to a boolean
}
Country.prototype.travel = function () {
    this.traveled = true;
};
// Constructor invocation
const france = new Country('France', false);
// Constructor invocation
const unitedKingdom = new Country();
france.travel(); // Travel to France

// class since ECMAScript 2015
class City {
    constructor(name, traveled) {
        this.name = name;
        this.traveled = false;
    }

    travel() {
        this.traveled = true;
    }
}
// Constructor invocation
const paris = new City('Paris', false);
paris.travel();
```

#### _this_ in a constructor invocation

`this` is the newly created object

```js
function Foo() {
    // this is fooInstance
    this.property = 'Default Value';
}

// Constructor invocation
const fooInstance = new Foo();
console.log(fooInstance.property); // => 'Default Value'
```

#### Pitfall: Forgetting about new

```js
function Vehicle(type, wheelsCount) {
    this.type = type;
    this.wheelsCount = wheelsCount;
    return this;
}
// Function invocation
const car = Vehicle('Car', 4);
car.type; // => 'Car'
car.wheelsCount; // => 4
car === window; // => true PROBLEM!
```

Although it looks good in this code, But actually this is a **function invocation** not **constructor invocation**. Since it is not return any error, losing `new` may cause potential problem.

The correct way is to prevent the function invocation.

```js
function Vehicle(type, wheelsCount) {
    if (!(this instanceof Vehicle)) {
        throw Error('Error: Incorrect invocation');
    }

    this.type = type;
    this.wheelsCount = wheelsCount;
    return this;
}

// Constructor invocation
const car = new Vehicle('Car', 4);
car.type; // => 'Car'
car.wheelsCount; // => 4
car instanceof Vehicle; // => true

// Function invocation. Throws an error.
const brokenCar = Vehicle('Broken Car', 3);
```

### Indirect invocation

**Indirect invocation** is performed when a function is called using `myFun.call()` or `myFun.apply()` methods.

The main difference between the two is that `.call()` accepts a list of arguments, for example `myFun.call(thisValue, 'val1', 'val2')`. But `.apply()` accepts a list of values in an array-like object, e.g. `myFunc.apply(thisValue, ['val1', 'val2'])`.

```js
function increment(number) {
    return ++number;
}
increment.call(undefined, 10); // => 11
increment.apply(undefined, [10]); // => 11
```

#### _this_ in an indirect invocation

`this` is the first argument of `.call()` or `.apply()`

```js
function Runner(name) {
    console.log(this instanceof Rabbit); // => true
    this.name = name;
}

function Rabbit(name, countLegs) {
    console.log(this instanceof Rabbit); // => true
    // Indirect invocation. Call parent constructor.
    Runner.call(this, name);
    this.countLegs = countLegs;
}

const myRabbit = new Rabbit('White Rabbit', 4);
myRabbit; // { name: 'White Rabbit', countLegs: 4 }
```

### Bound function

**A bound function** is a function whose context and/or arguments are bound to specific values.

```js
function multiply(number) {
    'use strict';
    return this * number;
}
// create a bound function with context
const double = multiply.bind(2);
// invoke the bound function
double(3); // => 6
double(10); // => 20
```

#### _this_ inside a bound function

`this` is the **first argument** of `.bind()`

```js
const numbers = {
    array: [3, 5, 10],

    getNumbers() {
        return this.array;
    },
};

// method invocation
const getNumbersResult = numbers.getNumbers(numbers);
console.log(getNumbersResult); // => [3, 5, 10]

// Create a bound function
const boundGetNumbers = numbers.getNumbers.bind(numbers);
console.log(boundGetNumbers()); // => [3, 5, 10]

// Extract method from object
const simpleGetNumbers = numbers.getNumbers;
console.log(simpleGetNumbers()); // => undefined or throws an error in strict mode
```

#### Tight context binding

`.bind()` makes a **permanent context link**

```js
function getThis() {
    'use strict';
    return this;
}

const one = getThis.bind(1);

console.log(one.call(2)); // => 1
console.log(one.apply(2)); // => 1
console.log(one.bind(2)()); // => 1
// construct invocation
console.log(new getThis()); // => Object
```

### Arrow function

**Arrow function** is designed to declare the function in a shorter form and lexically bind the context.

Example of arrow function

```js
const sumArguments = (...args) => {
    return args.reduce((result, item) => result + item);
};

console.log(sumArguments.name); // => 'sumArguments'
console.log(sumArguments(5, 5, 6)); // => 16
```

#### _this_ in arrow function

_this_ is the enclosing context

```js
class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
    log() {
        console.log(this === myPoint); // => true
        setTimeout(() => {
            console.log(this === myPoint); // => true
            console.log(this.x + ':' + this.y); // => '95:165'
        }, 1000);
    }
}
const myPoint = new Point(95, 165);
myPoint.log();
```

An arrow function is bound with the lexical context **once and forever**.

```js
const numbers = [1, 2];
(function () {
    const get = () => {
        console.log(this === numbers); // => true
        return this;
    };
    console.log(this === numbers); // => true
    get(); // => [1, 2]
    // Try to change arrow function context manually
    get.call([0]); // => [1, 2]
    get.apply([0]); // => [1, 2]
    get.bind([0])(); // => [1, 2]
}.call(numbers));
```

#### Pitfall: defining method with an arrow function

```js
function Period(hours, minutes) {
    this.hours = hours;
    this.minutes = minutes;
}

Period.prototype.format = () => {
    console.log(this === window); // => true
    return this.hours + ' hours and ' + this.minutes + ' minutes';
};

const walkPeriod = new Period(2, 30);
walkPeriod.format(); // => 'undefined hours and undefined minutes'
```

In this particular situation, better use regular function.

## Conclusion

Because the function invocation has the biggest impact on this, from now on **do not ask yourself**:

_Where is this taken from?_

but **do** ask yourself:

_How is the function invoked?_

For **an arrow function** ask yourself:

_What is this where the arrow function is defined?_

