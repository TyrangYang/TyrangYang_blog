# Callback, Promise and Async/await in js


## Synchronous & asynchronous

Function run synchronously means code is running as same as your writing.

But in real situation, some code may need time to running but you don't want all code is block. Therefore, you may need some technique to let this part running asynchronously which means this part of code is block and the rest of code is not.

But things going ridiculous. Sometimes, the all code need to be async so that make sure is running synchronously.

For example, your code maybe like:

```
// get some data from api (async part)
// print data
// update data through api (async part)
// print success
// print title
```

Js may running like:

```
// print data first (data is undefined)
// print success (probably is undefined)
// print title
// get some data from api (async part)
// update data through api (async part)
```

You have to make all of code asynchronously so that you code can running synchronously.

```
(all async)
// get some data from api (async part)
// print data
// update data through api (async part)
// print success
(all async)
// print title
```

The reason is that js have two thread running background. The main thread find async part of code and let another thread (which is a queue) to process. In my example, all three print will processed by main thread and two async part process by queue. Actually you want the fist two print is process in sequence, therefore you need to move these two print into queue so that they can running synchronously. For print title, it really doesn't matter when is actual running and it still processed by main thread.

There are three different ways to move some part of code into queue. Callback, Promise and Async/await.

## Callback

Callback is not a technique just for asynchronous code. It exist in any language actually. It means you pass a function as a parameter.

```js
let calculate = (num1, num2, callback) => {
    return callback(num1, num2);
};

console.log(
    calculate(1, 2, (a, b) => {
        return a - b;
    })
);
```

The basic idea using callback to solve async is that bundle two function into one async function.

setTimeout(callback, time) is a async function which means callback will be run after a given time.

```js
console.log('Getting data');
setTimeout(() => {
    console.log('Data got!');
}, 500);
```

> `Data got!` will be printed after `Getting data` printed 0.5 second

This a fake example for getting data.

```js
function printData(data) {
    console.log(data);
}

function getData(callback) {
    setTimeout(() => {
        console.log('Getting data');
        let data = 'DATA';
        callback(data);
    }, 500);
}

getData(printData);
```

## Promise

Promise is like a technique to deal with async. It actually use callback but make it more readable and useable.

```js
function printData(data) {
    console.log(data);
}

function getData() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            console.log('Getting data');
            let data = 'DATA';

            let error = false;
            if (!error) {
                resolve(data);
            } else {
                reject('Some Error.');
            }
        }, 500);
    });
}

getData()
    .then(printData)
    .catch((err) => console.log(err));
```

resolve will get val and passing to the next step which then() and reject is for handle error which catch by catch().

Promise also provide some other feature. Like Promise.all([list of promise])

all() will pass val contained all promise return val after all promise is finish

```js
let promise1 = Promise.resolve('First');
let promise2 = 'Second';
let promise3 = new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve('Goodbye');
    }, 1000);
});

Promise.all([promise1, promise2, promise3]).then((val) => console.log(val));
// [ 'First', 'Second', 'Goodbye' ] (after one second)
```

## Async & Await

async and await is another syntax to deal with Promise.

Basically, await will add behind a function which return a promise and get the data will passing to then. You can have a variable to get the data and go next. All await must inside a function notified as async. Now your code is same with writing code synchronously.

Like example from beginning:

```
// get some data from api (async part)
// print data
// update data through api (async part)
// print success
// print title
```

using Async & Await is like

```
async function{
    let data = await// get some data from api (async part)
    // print data
    let success = await// update data through api (async part)
    // print success
}

// print title
// run function
```

Another example from promise:

```js
function printData(data) {
    console.log(data);
}

function getData() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            console.log('Getting data');
            let data = 'DATA';

            let error = false;
            if (!error) {
                resolve(data);
            } else {
                reject('Some Error.');
            }
        }, 500);
    });
}

async function main() {
    let data = await getData();
    printData(data);
}

main();
```

