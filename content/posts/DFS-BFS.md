---
title: DFS & BFS
date: 2020-01-14
author: Haolin Yang
categories: ['Alg&DataStr']
tags:
    - algorithm
---

DFS & BFS are two basic algorithms to traverse a graph(or a tree). DFS is Deep-first search and BFS is Breath-first search.

## Basic idea

The idea behind two algorithms are identical but use different auxiliary data structure. DFS use _stack_ and BFS use _Queue_.

First, Every node have a mark to identify is already be visited or not(it could be a list or an attribute in node).

Second, Push the start point into the auxiliary data structure and loop until structure is empty.

Third, In the loop, pop a node from structure and mark as visited. Push all adjacent and unvisited node into it.

## Pseudocode using loop

### DFS

`V` is vertexes or say nodes

```cpp
DFS(V){
    visited = [f,f,f...f];
    stack <- empty;
    stack.push(V);
    while(stack not empty){
        temp = stack.pop();
        print(temp);
        for each v2 is adjacent to temp{
            if (v2 is not visited){
                stack.push(v2);
                mark v2 as visited;
            }
        }
    }
}
```

### BFS

```cpp
BFS(V){
    visited = [f,f,f...f];
    queue <- empty;
    queue.push(v);
    while(queue not empty){
        queue.pop();
        print(temp);
        for each v2 is adjacent to temp{
            if (v2 is not visited){
                queue.push(v2);
                mark v2 as visited;
            }
        }
    }
}
```

## Pseudocode using recursion

### DFS

`G` is the graph and `V` is the start vertex.

```cpp
DFS(G, V){
    set V as visited
    for all W which is adjacent V{
        if W is not visited{
            DFS(G, W);
        }
    }
}
```

#### find path

Modify from DFS. But BFS still work

`G` is the graph , `V` is the start vertex and `Z` is the end vertex;

`P` is a stack for store the result

```cpp
findPathDFS(G, V, Z){
    set V is visited
    P.push(V);
    if(V == Z)
        return P;
    for all W that is adjacent to V{
        if W is not visited{
            P.push(W);
            findPath(G, W, Z)
            P.pop() // pop W
        }
    }
    P.pop() // pop V (find the node that all nodes adjacent to it are visited and It is not target)
}
```

#### cycle finding

`G` is the graph , `V` is the start vertex;

`P` is a stack for store the current node and `T` is result;

```cpp
findCycle(G, V){
    set V is visited
    P.push(V);
    for all W that is adjacent to V{
        if W is not visited{
            findCycle(G, W)
        }
        else{
            do{
            temp = P.pop();
            T.push(temp);
            }while(temp == W)
        }
    }
    P.pop()
}
```
