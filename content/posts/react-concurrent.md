---
title: 'React Concurrent'
date: 2025-08-13T18:19:18-07:00
author: Haolin Yang
Categories: ['Posts']
tags: ['react']
toc:
  enable: true
  auto: false
linkToMarkdown: true
math:
  enable: false
---

## What is React Concurrent?

“Concurrent Features” is a set of rendering capabilities introduced to make React apps more responsive. Instead of blocking the browser until all rendering is done, React can pause, resume, and even abandon a render in progress.

This allows React to:

- Prioritize urgent updates (e.g., typing) over non-urgent ones (e.g., background data fetch results)
- Avoid dropping frames during animations or scrolling
- Keep the UI feeling “alive” even when there’s a lot of work to do

The underlying mechanism is **cooperative scheduling** — React voluntarily yields control back to the browser when time is up, and continues work later.

---

## What is Fiber?

Fiber is React’s internal data structure and rendering engine, introduced in React 16. Instead of the old recursive stack-based reconciler.

> The old component tree is looks like:

```js
{
  type: 'App',
  props: { ... },
  children: [
    { type: 'Header', props: {}, children: [] },
    { type: 'Content', props: {}, children: [] }
  ]
}
```

- Still a tree structure. But in object

> New fiber node tree will be

```js
const fiberNode = {
  type: 'MyComponent', // Component type (function or class)
  key: null, // React key if provided
  stateNode: {}, // Instance of class component or DOM node
  return: parentFiber, // Parent fiber
  child: firstChildFiber, // First child fiber
  sibling: nextSiblingFiber, // Next sibling fiber
  memoizedProps: { foo: 1 }, // Last props used
  memoizedState: { count: 0 }, // Last state
  pendingProps: { foo: 2 }, // New props being reconciled
  effectTag: 'UPDATE', // Side effect info (PLACEMENT, UPDATE, DELETION)
  alternate: currentFiber, // Link to the previous fiber for reconciliation
};
```

- **Linked tree of work units** → allows React to pause between units

---

## Difference with Stack Reconciler and Fiber Reconciler

The old Stack Reconciler (pre-React 16):

- Rendering was **synchronous** → once started, it ran to completion before handling anything else
- Could block the browser for hundreds of milliseconds

```
renderComponent(root)
  └─ renderChild(…)
      └─ renderChild(…)
          └─ …etc

```

Reconciler use recursive logic to loop through all component. It is not possible to interrupt

Fiber Reconciler:

- Breaks rendering into chunks
- Can yield between chunks → browser can paint and respond

```js
while (nextUnitOfWork && !shouldYield()) {
  nextUnitOfWork = performUnitOfWork(nextUnitOfWork);
}
```

- process fiber by fiber. finish one fiber will check if still have time.
- if should yield, will break the while loop and give control back to browser
- MessageChannel will allow proceed. Basically save the fiber as start point and start while loop again

---

## Hooks

### useDeferredValue

`useDeferredValue` lets you take a value and tell React:

Takes an existing value and returns a delayed version of it that updates in the background.

```jsx
const [input, setInput] = useState('');
const deferredInput = useDeferredValue(input);
```

> When to use:
>
> - You already have a value (often from state or props) that changes too frequently, and you want downstream consumers to update more slowly.
> - Good for keeping the UI responsive without manually wrapping every state update.

### useTransition

useTransition is for marking state updates as non-urgent:

```jsx
const [isPending, startTransition] = useTransition();

function handleClick() {
  startTransition(() => {
    // low-priority update
    setPage(page + 1);
  });
}
```

> When to use:
>
> - You control when and which state updates are marked low priority.
> - Good for scenarios where you have a trigger point (like a button click or typing) and you want to mark the subsequent updates as background work.

### vs

| Feature              | useTransition                                                                           | useDeferredValue                                                       |
| -------------------- | --------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| **Trigger point**    | You decide _when_ to mark work as low priority (wrap state update in `startTransition`) | You pass a value and React decides when to update the deferred version |
| **Applies to**       | State update function                                                                   | A value (state or prop)                                                |
| **Control level**    | Fine-grained, manual control over scheduling                                            | Automatic for that value’s consumers                                   |
| **Usage pattern**    | “Do this work as background”                                                            | “This value should update in background”                               |
| **Typical use case** | Search filter triggers big list update                                                  | Typing in search box updates heavy results list                        |
