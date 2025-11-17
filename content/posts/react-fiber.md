---
title: Understanding React Fiber - Trees, Diff, and Commit Phases
date: 2025-10-12
author: Haolin Yang
categories: ['Note']
tags:
  - react
toc:
  enable: true
  auto: false
linkToMarkdown: true
math:
  enable: false
---

## Good reference

This [Blog](https://blog.logrocket.com/deep-dive-react-fiber/) explain fiber from fundamental of js.

## Introduction

React Fiber is the core of modern React rendering, enabling **incremental rendering, time slicing, and high-performance updates**. In this blog, we will explore:

- Fiber nodes and structure
- Fiber loop and traversal
- Diff/reconciliation algorithm
- Work-in-progress (WIP) tree
- Current fiber tree vs real DOM
- Commit phase and tree flow

---

## 1. What is a Fiber Node?

A **Fiber node** is a unit of work in React’s incremental rendering. It contains:

- `type` → element type (`div`, `span`, Component)
- `key` → unique identifier for list reconciliation
- `props` → element properties
- `stateNode` → reference to actual DOM node or component instance
- `child`, `sibling`, `return` → pointers for tree traversal
- `alternate` → link to the previous fiber (used for diffing)
- `effectTag` → indicates updates needed (`Placement`, `Update`, `Deletion`)

**Example fiber node:**

```js
const fiber = {
  type: 'div',
  key: null,
  props: { className: 'container', children: [] },
  stateNode: document.createElement('div'),
  child: null,
  sibling: null,
  return: null,
  alternate: currentFiber,
  effectTag: 'UPDATE',
};
```

## 2. Fiber Loop and Traversal

- Fiber uses an iterative loop, not recursion, to traverse the tree.
- Traversal is pre-order ( child → sibling → parent ).
- The loop is incremental and interruptible — React can pause work and yield control to the browser.

Pseudo-code (non-recursive traversal):

```js
let nextFiber = wipRoot;
while (nextFiber) {
  nextFiber = performUnitOfWork(nextFiber);
}

function performUnitOfWork(fiber) {
  fiber.child = reconcileChildren(fiber, fiber.props.children);
  if (fiber.child) return fiber.child;
  let next = fiber;
  while (next) {
    if (next.sibling) return next.sibling;
    next = next.return;
  }
  return null;
}
```

```text
performUnitOfWork()
 └─ beginWork()        ← go down: build children
     └─ performUnitOfWork(child)
         ...
     └─ completeUnitOfWork()  ← go up: finish fiber
          └─ completeWork()
completeUnitOfWork()
  └─ completeWork()
```

## 3. Diff / Reconciliation Algorithm

During traversal, React performs diffing:

- Compare new element vs old fiber (alternate)
- Decide Update, Placement, Deletion
- Create or reuse fibers
- Collect effects into a linked list for commit phase

Pseudo-code for child reconciliation:

```js
function reconcileChildren(wipFiber, elements) {
  let index = 0;
  let oldFiber = wipFiber.alternate && wipFiber.alternate.child;
  let prevSibling = null;

  while (index < elements.length || oldFiber != null) {
    const element = elements[index];
    let newFiber = null;

    if (
      element &&
      oldFiber &&
      element.type === oldFiber.type &&
      element.key === oldFiber.key
    ) {
      newFiber = {
        ...oldFiber,
        props: element.props,
        effectTag: 'UPDATE',
        return: wipFiber,
      };
    } else if (element) {
      newFiber = {
        type: element.type,
        props: element.props,
        effectTag: 'PLACEMENT',
        return: wipFiber,
      };
    } else if (oldFiber) {
      oldFiber.effectTag = 'DELETION';
    }

    if (index === 0) wipFiber.child = newFiber;
    else prevSibling.sibling = newFiber;

    prevSibling = newFiber;
    index++;
    if (oldFiber) oldFiber = oldFiber.sibling;
  }
  return wipFiber.child;
}
```

- Fiber loop drives traversal
- Diff is executed inside the loop at each fiber node
- Work-in-progress (WIP) fibers are built incrementally during traversal

## 4. Work-in-Progress Tree

- A parallel fiber tree separate from currentRoot
- Incrementally built during render phase
- Each fiber can reuse state from alternate
- Eventually becomes the new current tree after commit

Analogy:

- Current tree = snapshot of the UI on screen
- WIP tree = draft of the next UI
- Loop = iterating over draft, comparing with snapshot

## 5. Current Fiber Tree vs Real DOM

- Current fiber tree (currentRoot) = memory structure
- Real DOM = browser nodes
- Fiber nodes hold stateNode pointing to DOM nodes
- React never replaces DOM wholesale; it updates DOM according to the effect list

Summary Table:

| Concept  |   Current Fiber Tree   |          Real DOM          |
| :------: | :--------------------: | :------------------------: |
| Location |         Memory         |          Browser           |
|   Role   | Represent committed UI |    Render UI on screen     |
| Mutation |   None during render   |   Updated during commit    |
| Pointers |    stateNode → DOM     | DOM nodes exist physically |

## 6. Commit Phase

Commit applies WIP tree changes to the real DOM:

1. Before mutation phase → lifecycle hooks like getSnapshotBeforeUpdate
2. Mutation phase → apply effect list:
   - Placement → insert/move DOM
   - Update → update props/text
   - Deletion → remove node
3. Layout phase → lifecycle hooks and useLayoutEffect

After commit:

```js
currentRoot = wipRoot;
wipRoot = null;
```

- DOM now reflects the committed fiber tree
- Fiber trees now mirror the updated UI

## 7. Overall Tree Flow

```text
[currentRoot] ← mirror of real DOM
   │
   ▼ diff
[work-in-progress tree] ← being built
   │
   ▼ commit effects
[real DOM] ← updated incrementally
   │
   ▼ update pointer
currentRoot = wipRoot
```

- Render phase = build WIP tree + diff
- Commit phase = update DOM
- WIP tree → current tree in memory
- Real DOM updated only incrementally

## 8. Summary

- Fiber nodes = units of work
- Fiber loop = incremental traversal, can pause/resume
- Diff algorithm = compares old fiber vs new element
- Work-in-progress tree = draft tree built during render
- Current tree = committed fiber tree in memory
- Commit phase = apply minimal changes to real DOM

React Fiber allows efficient, interruptible, incremental UI updates, unlike the recursive virtual DOM approach in React <16.
