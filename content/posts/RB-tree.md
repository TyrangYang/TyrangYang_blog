---
title: RB tree
date: 2019-08-17
author: Haolin Yang
categories: ["Alg&DataStr"]
tags:
    - c++
    - java
    - binary tree
---

## 2-3 tree & 2-4 tree

2-node: 1 key and 2 children
3-node: 2 keys and 3 children
4-node: 3 keys and 4 children

A (2,4) tree (also called 2-4 tree or 2-3-4 tree) is a multi-way search with the following properties:

-   Node-Size Property: every internal node has at most four children
-   Depth Property: all the external nodes have the same depth

### insertion

![2-4insertion](/images/2019-8-17-RB-tree/2-4-insertion.png)

### deletion

![2-4deletion](/images/2019-8-17-RB-tree/2-4-deletion.png)

## 2-4 tree ==> RB tree

If break down 3-node and 4-node, 2-4 tree will become RB tree.

-   2-node ==> black node
-   3-node ==> left/right side red node and black node
-   4-node ==> two red node and a black node

RB tree represent a 2-4 tree in binary by providing a special balance strategy.

![2-4-rb-tree](/images/2019-8-17-RB-tree/2-4-rb-tree.png)

## RB tree rotate

```
* New node --> X
* Parent --> P
* Grandparent --> G
* Parent sibling --> S
```

1. **X** must be _red_
2. **_while loop_**: **P** is _red_
    1. **P** is on the left of **G**
        1. **S** is _red_
            - Change **P** and **S** to _black_
            - Change **G** to _red_
            - Let **G** become **X** and back to **_while loop_**
        2. **S** is _Black_ or Null
            - **_IF_**: **X** on the right of **P**. **_Then_**: **_Rotate_left()_**
            - Change **P** to _black_
            - Change **G** to _red_
            - **_Rotate_right()_**
    2. **P** is on the right of **G**
        1. **S** is _red_
            - Change **P** and **S** to _black_
            - Change **G** to _red_
            - Let **G** become **X** and back to while loop
        2. **S** is _Black_ or Null
            - **_IF_**: **X** on the left of **P**. **_Then_**: **_Rotate_right()_**
            - Change **P** to _black_
            - Change **G** to _red_
            - **_Rotate_left()_**
3. **ROOT** = _black_ // In case change root.

## RB tree structure

![2-4-rb-tree](/images/2019-8-17-RB-tree/rbtree-structure.png)
