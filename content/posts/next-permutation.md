---
title: How to find next permutation
date: 2020-02-05
author: Haolin Yang
categories: ["STL-study-note"]
tag:
    - c++
    - algorithm
    - permutation
---

This is introduce how to find the next lexicographically permutation.

Suppose the permutation is `1 2 3`. The next one is `1 3 2`.

## Algorithm in C++

C++ provide an algorithm called `next_permutation` to support that. [Reference](http://www.cplusplus.com/reference/algorithm/next_permutation/?kw=next_permutation)

Example:

```cpp
#include <iostream>     // std::cout
#include <algorithm>    // std::next_permutation, std::sort

int main () {
  int myints[] = {1,2,3};

  std::sort (myints,myints+3);

  std::cout << "The 3! possible permutations with 3 elements:\n";
  do {
    std::cout << myints[0] << ' ' << myints[1] << ' ' << myints[2] << '\n';
  } while ( std::next_permutation(myints,myints+3) );

  std::cout << "After loop: " << myints[0] << ' ' << myints[1] << ' ' << myints[2] << '\n';

  return 0;
```

## How it work.

There are four step to achieve.

1. Find first decreasing element `A` in backward.
2. Find element `B` behind `A` and just large then `A`.
3. Swap `A` and `B`.
4. Reverse all elements behind `B`.

![gif](/images/2020-02-05-next-permutation/31_Next_Permutation.gif)

## Why it works

Example each step

1. Find the element that should be changed.
2. Find the next element that will replace the previous one.
3. Swap them.
4. Since all elements behind the new one is decreasing, reverse them.

![num](/images/2020-02-05-next-permutation/31_nums_graph.png)
