---
title: Asynchronous in JS
date: 2025-07-20
author: Haolin Yang
categories: ['Posts']
tags:
  - javascript
  - nodejs
  - promise
  - generator
  - thunk
toc:
  enable: true
  auto: false
linkToMarkdown: true
math:
  enable: false
---

## Synchronous & asynchronous

Function run synchronously means code is running as same as your writing.

But in real situation, some code may need time to running (like fetch). If synchronously run all code, program will be block and wait this time consuming part finish and continue.

In the most of the time, You code logic need wait to continue but you don't want to block all progress. Maybe UI rendering or some other total unrelated code. Unfortunately, JS is single thread langrage and concurrency is not exist. Therefore, you need some technique to some part running asynchronously,

### Js event loop | Call stack | task queue

This [**website**](http://latentflip.com/loupe/?code=JC5vbignYnV0dG9uJywgJ2NsaWNrJywgZnVuY3Rpb24gb25DbGljaygpIHsKICAgIHNldFRpbWVvdXQoZnVuY3Rpb24gdGltZXIoKSB7CiAgICAgICAgY29uc29sZS5sb2coJ1lvdSBjbGlja2VkIHRoZSBidXR0b24hJyk7ICAgIAogICAgfSwgMjAwMCk7Cn0pOwoKY29uc29sZS5sb2coIkhpISIpOwoKc2V0VGltZW91dChmdW5jdGlvbiB0aW1lb3V0KCkgewogICAgY29uc29sZS5sb2coIkNsaWNrIHRoZSBidXR0b24hIik7Cn0sIDUwMDApOwoKY29uc29sZS5sb2coIldlbGNvbWUgdG8gbG91cGUuIik7!!!PGJ1dHRvbj5DbGljayBtZSE8L2J1dHRvbj4%3D) shows how js engine running with single thread to handle concurrency

Task queue will be the key for simulating asynchronous. The asynchronous part will leave the queue first and back after it is ready.

Async action will be know by js engine (like setTimeout, XMLrequest, fetch api). But need to handle what will be do next when back to task queue

## Callback

Technically Callback function is not a method to achieve async. It just a function as a parameter. And Callback function include what you need to do next. That's it.

> One concept need mention. The callback function include logic. Also could called as Thunk.

Think about a scenario: step1 -> step2 -> step3. Each step need previous one finished.

Code will be like

```js
function step1(param1, cb) {
  const res = fetch(param1); // async part. need some time
  cb(res);
}
function step2(param2, cb) {
  const res = fetch(param2); // async part. need some time
  cb(res);
}
function step3(param3, cb) {
  const res = fetch(param3); // async part. need some time
  cb(res);
}

step1(...arg1, (res1) => {
  step2(res1, (res2) => {
    step3(res2);
  });
});
```

Code will run async. During waiting time, some other thing could handle. But code will be come hard to read. 3 steps maybe readable. What about 10? All of nest together?

Therefore, developer want to make code more readable. The ultimate solution will like code is writing synchronously. But js engine will automatically know this part need wait.

like

```js
const res1 = step1(...arg1);
const res2 = step2(res1);
const res3 = step3(res2);
```

## generator

See this code about generator.

```js
function* gen(init) {
  let genRes1 = yield init + 2; // now just simple sync but it could be a async fun here
  let genRes2 = yield genRes1 + 3;
  return [genRes1, genRes2];
}

let g = gen(1);
const res1 = g.next();
const res2 = g.next(res1.value); // res1.value goes to genRes1
const res3 = g.next(res2.value); // res2.value goes to genRes2
console.log(res1); // { value: 3, done: false }
console.log(res2); // { value: 6, done: false }
console.log(res3); // { value: [ 3, 6 ], done: true }
```

When runs to yield keyword. Function will stop and wait. When you trigger next(), it will continuous logic after yield.

if run next(val), val will be previous yield result.

Now you can see gen(). Is it looks like a synchronously? **More importantly**, Each step in gen() be stop and resume manually. Is it looks like asynchronous concept?

If we run gen() and let generator resume by itself. Does we achieve the goal of writing synchronous code and allow code jump outside function (async)?

Since the next() function have pattern. We can run recursive function to let it run automatically.

```js
// same generator
function* gen(init) {
  let genRes1 = yield init + 2;
  console.log(genRes1); // 3
  let genRes2 = yield genRes1 + 3;
  console.log(genRes2); // 6
  return [genRes1, genRes2]; // [3, 6]
}

const run = (gen, init) => {
  let g = gen(init);
  const resList = [];

  const recursive = (prevData) => {
    const res = g.next(prevData);

    if (res.done) return resList;

    const curData = res.value;
    resList.push(curData);

    recursive(curData);
  };

  recursive();
};

runner(gen);
```

I can give one async example

```js
let thunkifyPrintCb = function (print) {
  return function (callback) {
    setTimeout(() => {
      callback(print);
    }, 2000);
  };
};

let thunkGen = function* () {
  let step1 = yield thunkifyPrintCb('/etc/fstab'); // step1 is result. yield thunkifyPrintCb('/etc/fstab') is a thunk function
  console.log('step1', step1); // print step1 /etc/fstab after 2s
  let step2 = yield thunkifyPrintCb('/etc/shells');
  console.log('step2', step2); // print step2 /etc/shells after 2s
};

function runner(generator) {
  var gen = generator();

  function recursive(data) {
    var result = gen.next(data);
    if (result.done) return;
    result.value((res) => {
      recursive(res);
    });
  }

  recursive();
}

runner(thunkGen);
```

thunkGen() will be that async function.

## Promise

Promise is another technique to deal with async. It been encapsulated in an object. The purpose of Promise is to give some extra feature to handle async function.

```js
function step1() {
  return new Promise((res, rej) => {
    setTimeout(() => {
      console.log('step1 done');
      res('res1');
    }, 2000);
  });
}

function step2(prevResult) {
  return new Promise((res, rej) => {
    setTimeout(() => {
      console.log('step2 done, got:', prevResult);
      res('res2');
    }, 2000);
  });
}

function step3(prevResult) {
  return new Promise((res, rej) => {
    setTimeout(() => {
      console.log('step3 done, got:', prevResult);
      res('res3');
    }, 2000);
  });
}

// step by step
step1()
  .then((res1) => step2(res1))
  .then((res2) => step3(res2))
  .then((res3) => console.log('All done:', res3));

// concurrency
Promise.all([step1('1'), step2('2'), step3('3')]);
```

If you see the code for step by step. It is still have nested structure. "Then hell" merely better than "callback hell". more feature is the key

### Other useful feature in promise

Promise can mimic concurrency. Like Promise.all([list of promise])

Fire async all together. Get them all or get the fast one

all() will pass val contained all promise return val after all promise is finish

```js
let promise1 = Promise.resolve('First');
let promise2 = 'Second';
let promise3 = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve('Goodbye');
  }, 1000);
});

Promise.all([promise1, promise2, promise3]).then((val) => console.log(val)); // go to next only all fulfilled
// [ 'First', 'Second', 'Goodbye' ] (after one second)
Promise.allSettled([promise1, promise2, promise3]).then((val) =>
  console.log(val)
); // get all status
// [
//   { status: 'fulfilled', value: 'First' },
//   { status: 'fulfilled', reason: 'Second' },
//   { status: 'fulfilled', value: 'Goodbye' }
// ]
Promise.race([promise1, promise2, promise3]).then((val) => console.log(val));
// as soon as one of the promises in an iterable fulfills or rejects
// probably: 'Second' goes fast
Promise.any([promise1, promise2, promise3]).then((val) => console.log(val));
// only the first fulfilled. Ignore rejected
```

## promise + generator

Promise have feature. Generator handle sync code writing. Why not put them together.

Yes we could

```js
let asyncPrintPromise = function (print) {
  return new Promise(function (resolve, reject) {
    setTimeout(() => {
      resolve(print);
    }, 2000);
  });
};

let promiseGen = function* () {
  let f1 = yield asyncPrintPromise('/etc/fstab');
  console.log('f1', f1);
  let f2 = yield asyncPrintPromise('/etc/shells');
  console.log('f2', f2);
};

function runner(promiseGen) {
  var g = promiseGen();

  function recursive(data) {
    var result = g.next(data);
    if (result.done) return result.value;
    result.value.then(function (promiseData) {
      recursive(promiseData);
    });
  }

  recursive();
}

runner(promiseGen);
```

## Async & Await

The behavior of async/await is similar to combining generators and promises. You basically can consider like a syntactic surger.

async => runner + \*
await => yield

Another example from promise:

```js
async main() {
  await step1();
  await step2();
  await step3();
}
main();
```

### Prevent tryCatch hell

```js
async function getDataTryCatchHell{
    let a, b, c;
    try {
        a = await fetch();
    } catch (err) {
        handleErr(err);
    }
    try {
        b = await fetch();
    } catch (err) {
        handleErr(err);
    }
    try {
        c = await fetch();
    } catch (err) {
        handleErr(err);
    }
}
```

Usually just append `.catch()` function behind the await function,

```js
async function getData{
    let a = await fetch(...).catch(err=> handleErr(err));
    let b = await fetch(...).catch(err=> handleErr(err));
    let c = await fetch(...).catch(err=> handleErr(err));
}
```

A better way is creating a function return data and error.

```js
async function awesome() {
  try {
    const data = await fetch();
    return [data, null];
  } catch (err) {
    return [null, err];
  }
}

async function main() {
  let [data, err] = awesome();
  if (err) {
    return;
  }
  console.log(err);
}
```
