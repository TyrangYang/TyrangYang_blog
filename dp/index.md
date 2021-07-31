# Dynamic Programming 🏗


## What is dp problem

DP problem is a programming strategy which use extra space to save time. These problems need to store some state instead of calculate again. For most situation, DP is a strategy to reduce the time consuming for **recursive problem**.

1. Memorization
2. Tabulation

### fibonacci example

The classic recursive problem:

```js
const fib = (n) => {
    if (n <= 2) return 1;
    return fib(n - 1) + fib(n - 2);
};
```

How to memorize :

```js
const fibMemo = (n, memo) => {
    const key = n;
    if (memo[key]) return memo[key];
    if (n <= 2) return 1;
    memo[key] = fib(n - 1) + fib(n - 2);
    return memo[key];
};
```

How to tabulation:

```js
const fibTable = (n) => {
    const table = Array(n + 1).fill(0);
    table[1] = 1;
    for (let i = 0; i <= n; ++i) {
        table[i + 1] += table[i];
        table[i + 2] += table[i];
    }

    return table[n];
};
```

### Memorization Recipe

1. Make it work
    1. visualize the problem as a tree
    2. implement the tree using recursion
    3. test it
2. Make it efficient
    1. add memo object
    2. add a base case to return memo value
    3. store return values into the memo

### Tabulation Recipe

1. visualize the problem as table
2. size the table base on inputs
3. initialize the table with default values
4. seed the trivial answer into the table
5. iterate through the table
6. fill further position based on the current position

## What kind of question is dp

1. **Can** the result be exist &rarr;&rarr; True or False
2. **How** the result be come &rarr;&rarr; One result
3. What is the **best** result &rarr;&rarr; One of a best result
4. What is **all** results _(may not be dp problem)_ &rarr;&rarr; all results

### Example

```js
const canSum = (target, numbers, memo) => {
    const key = target;
    if (key in memo) return memo[key];
    if (target === 0) return true;
    if (target < 0) return false;
    for (let num of numbers) {
        let tmp = target - num;
        if (canSum(tmp, numbers, memo)) {
            memo[key] = true;
            return memo[key];
        }
    }
    memo[key] = false;
    return memo[key];
};

let res = canSum(300, [25], {});
res;

const howSum = (target, numbers, memo) => {
    const key = target;
    if (key in memo) return memo[key];
    if (target === 0) return [];
    if (target < 0) return null;
    for (let num of numbers) {
        let tmp = target - num;
        let sumRes = howSum(tmp, numbers, memo);
        if (sumRes !== null) {
            memo[key] = [num, ...sumRes];
            return memo[key];
        }
    }
    return null;
};

res = howSum(300, [7, 15], {});
res;

const bestSum = (target, numbers, memo) => {
    const key = target;
    if (key in memo) return memo[key];
    if (target === 0) return [];
    if (target < 0) return null;
    let shortestRes = null;
    for (let num of numbers) {
        let tmp = target - num;
        let tmpCombination = bestSum(tmp, numbers, memo);
        if (tmpCombination !== null) {
            shortestRes =
                shortestRes === null ||
                shortestRes.length > tmpCombination.length + 1
                    ? [num, ...tmpCombination]
                    : shortestRes;
        }
    }
    memo[key] = shortestRes;
    return memo[key];
};

res = bestSum(8, [2, 3, 5], {});
res;
```

## DP table

## State machine

## State transaction equation

## DP problem Example

I have another post to classify dp problem
[See this Post]({{<ref dp-example.md>}})

