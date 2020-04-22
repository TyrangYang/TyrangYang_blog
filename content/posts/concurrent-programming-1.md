---
title: Concurrent Programming Course note 1
date: 2019-08-28
author: Haolin Yang
categories: ["Concurrent-programming"]
tags:
    - concurrent
    - course note
---

## What is concurrency

Systems of interacting computer programs which share resource and run concurrently.

### parallelism and concurrency

Parallelism: Occurring physically at the same time.

Concurrency: Occurring logically at the same time.

### synchronization

Process synchronization: Ensure the instructions are executed in certain order.

Synchronization is irrelevant if processes do not interact with each other.

Concurrency, and hence process synchronized, is useful only when processes interact with each other.

### interaction

Share memory is kind of interact.

Two kind of interaction:

1. Shared memory - variable is visible for each thread. : java
2. Message passing - communicate other thread, I'm using this resource.

## Process scheduling error

Deadlock: Each thread take a resource and wait for next one which is hold by other thread.

Livelock: Each thread take a resource and see other thread take next one. Therefore, each thread return it back. But this process will keep repeating.

Starvation: One thread always take resource before other thread.

## Modelling program execution

If the program is:

```
thread p:{
    print("a");
    print("b");
}

thread q:{
    print("c");
    print("d");
}
```

If P has m instructions and Q has n instructions, then there
are:

![interleaving](/images/2019-08-28-concurrent-programming-1/interleaving.png)

interleaving.

For this one. m = n = 2. That will have 4!/2!2! = 24 / 4 = 6.

There are 6 interleaving.

All 6 interleaving are called transition system.
