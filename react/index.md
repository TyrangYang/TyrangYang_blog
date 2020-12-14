# React overview


## Init react

Commend

```
npx create-react-app .
```

npx means you use this package but don't download it.

or with redux

```
npx create-react-app my-app --template redux
```

## life cycle

{{<figure src="/images/2019-10-03-react/rcc.png" title="Class component lifecycle" width="100%" height="100%" >}}

{{<figure src="/images/2019-10-03-react/rfc.jpg" title="Function component method" width="100%" height="100%" >}}

### shouldComponentUpdate()

Run before `render()` to check this component need to render or not.

```js
shouldComponentUpdate(nextProps, nextStates){
    return boolean;
}
```

`PureComponent` can automatically do a shallow comparison to determine need to update or not

`export default React.memo(<component name>)` only compare props but it works for functional component

### getSnapshotBeforeUpdate

it is invoked right before the most recently rendered output is committed

```js
getSnapshotBeforeUpdate(prevProps, prevState) {
    console.log('snapshot');
    console.log(prevProps, prevState);
    return 1;
}
```

`getSnapshotBeforeUpdate` must pair with `componentDidUpdate()`

## Context API

Doc: https://reactjs.org/docs/context.html#reactcreatecontext

Use a context:

1. React.createContext({defaultValue})
2. import the context your create. Warp you root component which you want to use this context in <ContextName.provider ></ContextName.provider>
3. component under root context component will access to this context
    1. static contextType = MyContext
    2. Warp component like

```js
<MyContext.Consumer>
    {(value) => /_ render something based on the context value _/}
</MyContext.Consumer>
```

> **All consumers that are descendants of a Provider will re-render whenever the Provider’s value prop changes.** The propagation from Provider to its descendant consumers (including .contextType and useContext) is not subject to the `shouldComponentUpdate` method, so the consumer is updated even when an ancestor component skips an update.

Context API is not for solve all state sharing problem. Think like Context provider change(even prevent update by `shouldComponentUpdate`) all consumer will re-render.

> The defaultValue argument is **only** used when a component does not have a matching Provider above it in the tree. This can be helpful for testing components in isolation without wrapping them. Note: passing undefined as a Provider value does not cause consuming components to use defaultValue.

## Ref

> `React.createRef()` API introduced in React 16.3. If you are using an earlier release of React, we recommend using callback refs instead.

There are a few good use cases for refs:

-   Managing focus, text selection, or media playback.
-   Triggering imperative animations.
-   Integrating with third-party DOM libraries.

### create ref

```js
class MyComponent extends React.Component {
    constructor(props) {
        super(props);
        this.myRef = React.createRef();
    }
    render() {
        return <div ref={this.myRef} />;
    }
}
```

### access ref

```js
const node = this.myRef.current;
```

### Adding a Ref to a Class Component

```js
class CustomTextInput extends React.Component {
    constructor(props) {
        super(props);
        // create a ref to store the textInput DOM element
        this.textInput = React.createRef();
        this.focusTextInput = this.focusTextInput.bind(this);
    }

    focusTextInput() {
        // Explicitly focus the text input using the raw DOM API
        // Note: we're accessing "current" to get the DOM node
        this.textInput.current.focus();
    }

    render() {
        // tell React that we want to associate the <input> ref
        // with the `textInput` that we created in the constructor
        return (
            <div>
                <input type="text" ref={this.textInput} />
                <input
                    type="button"
                    value="Focus the text input"
                    onClick={this.focusTextInput}
                />
            </div>
        );
    }
}

class AutoFocusTextInput extends React.Component {
    constructor(props) {
        super(props);
        this.textInput = React.createRef();
    }

    componentDidMount() {
        this.textInput.current.focusTextInput();
    }

    render() {
        return <CustomTextInput ref={this.textInput} />;
    }
}
```

### Adding a Ref to a Functional Component

By default, **you may not use the ref attribute on function components** because they don’t have instances:

If you want to allow people to take a ref to your function component, you can use `forwardRef` (possibly in conjunction with `useImperativeHandle`), or you can convert the component to a class.

#### useImperativeHandle + ForwardRef

```js
function FancyInput(props, ref) {
    const inputRef = useRef();
    useImperativeHandle(ref, () => ({
        focus: () => {
            inputRef.current.focus();
        },
    }));
    return <input ref={inputRef} />;
}
FancyInput = React.forwardRef(FancyInpacut);
```

In this example, a parent component that renders `<FancyInput ref={inputRef} />` would be able to call `inputRef.current.focus()`.

## React Hooks

### useState

```js
const [state, setstate] = useState(initialState);
```

### useEffect

```js
useEffect(() => {
    <effect>;
    return () => {
        <cleanup>;
    };
}, [<input>]);
```

### useContext

```js
const MyContext = React.createContext();

// inside rfc
const value = useContext(MyContext);
```

`useContext(MyContext)` is equivalent to `static contextType = MyContext` in a **class**, or to `<MyContext.Consumer>`

**But You still need a `<MyContext.Provider>` above in the tree to provide the value for this context.**

### useReduce

```js
const initialState = { count: 0 };

function reducer(state, action) {
    switch (action.type) {
        case 'increment':
            return { count: state.count + 1 };
        case 'decrement':
            return { count: state.count - 1 };
        case 'clean':
            return { count: 0 };
        default:
            throw new Error();
    }
}

function Counter() {
    const [state, dispatch] = useReducer(reducer, initialState);
    useEffect(() => {
        dispatch({ type: 'clean' });
    }, []);
    return (
        <>
            Count: {state.count}
            <button onClick={() => dispatch({ type: 'decrement' })}>-</button>
            <button onClick={() => dispatch({ type: 'increment' })}>+</button>
        </>
    );
}
```

> Unlike Redux `dispatch` function doesn't need to add in `useEffect` or `useCallback` dependence list

### useRef

> `useRef()` creates a plain JavaScript object. The only **difference** between `useRef()` and creating a `{current: ...}` object yourself is that useRef will give you **the same ref object** on every render.

### useLayoutEffect

The only different between `useLayoutEffect` and `useEffect` is that the `useLayoutEffect` is synchronous. Just same as `componentDidMount` and `componentDidUpdate`.

1. useLayoutEffect()
2. render
3. useEffect()

### useImperativeHandle

`useImperativeHandle` customizes the instance value that is exposed to parent components when using ref. It is rare to use.

This is use for handle using ref to access functional component.

[See Usage in Ref]({{< ref "React.md/#adding-a-ref-to-a-functional-component" >}})

## React.lazy()

> The `React.lazy` function lets you render a dynamic import as a regular component.

Component only be loaded when it will be rendered

```js
import React, { Suspense } from 'react';

// these import code better put the end of import code
const OtherComponent = React.lazy(() => import('./OtherComponent'));
const AnotherComponent = React.lazy(() => import('./AnotherComponent'));

function MyComponent() {
    return (
        <div>
            <Suspense fallback={<div>Loading...</div>}>
                <section>
                    <OtherComponent />
                    <AnotherComponent />
                </section>
            </Suspense>
        </div>
    );
}
```

> these import code better put the end of import code

> You can even wrap **multiple** lazy components with a **single** `Suspense` component.

## Class Component vs Functional Component

### Class Component lifecycle ==> Functional Component hooks

|     Class component     |                       Functional component                       |
| :---------------------: | :--------------------------------------------------------------: |
|    state + setState     |                            useState()                            |
|   componentDidMount()   |               useEffect() with a empty input list                |
|  componentDidUpdate()   | useEffect() with a input list contained which you want to change |
| componentWillUnmount()  |           useEffect() with a return callback function            |
| shouldComponentUpdate() |           export default React.memo(<component name>)            |

## Common Pitfall

### Performance difference (SnapShot vs Current value)

When React introduce hooks for functional component, closure problem will be brought in as well. This will cause different performance between class component and function component with same logic.

These two component have same logic:

```js
import React, { useState } from 'react';
import ReactDOM from 'react-dom';

export class ClassProfilePage extends React.Component {
    showMessage = () => {
        alert('Followed ' + this.props.user);
    };

    handleClick = () => {
        setTimeout(this.showMessage, 3000);
    };

    render() {
        return (
            <button onClick={this.handleClick}>
                Get Current value (class component)
            </button>
        );
    }
}

export function FunctionProfilePage(props) {
    const showMessage = () => {
        alert('Followed ' + props.user);
    };

    const handleClick = () => {
        setTimeout(showMessage, 3000);
    };

    return (
        <button onClick={handleClick}>
            Get Snapshot (functional component)
        </button>
    );
}

function App() {
    const [state, setState] = useState(1);
    return (
        <div className="App">
            <button
                onClick={() => {
                    setState((x) => x + x);
                }}
            >
                double
            </button>
            <div>state:{state}</div>
            {/* snapshot */}
            <FunctionProfilePage user={state} />
            {/* current value */}
            <ClassProfilePage user={state} />
        </div>
    );
}
```

> Play with this example: <a href="../html/reactDifferentPerformance.html" target="_blank">Link</a>

Click `Get` button first and then click `double`. Class component will alert current value, however function component will alert snapshot.

This is not a bug. This is a common question in Javascript due to the fact that every time you passing same reference or not.

> See another example: [closure loop problem]({{< ref "js-trick#snapshot--current-value" >}})

In React, Because `props` is immutable(assign a new obj when you want to change it) in functional component, each rendering has different `props`. Every click will generate a new props and `setTimeout()` display the value when you click. However, in Class component. After class generated, `props` is associated with class itself. Every rendering in class component have same `this.props` and `this.props.user` change overtime. Therefore, `setTimeout()` use same `this.props` and access `this.props.user` which is current value.

This flowing code simulate this problem

```js
let props = { count: 10 };

const fnA = ({ count }) => {
    click = setTimeout(() => {
        console.log(count);
    }, 1000);
    click;
};

class fnB {
    constructor(input) {
        this.props = input;
    }

    click = setTimeout(() => {
        console.log(this.props.count);
    }, 1000);
}

fnA(props);

let res2 = new fnB(props);
res2.click;

props.count--;
props.count--;
props.count--;
```

#### Solution

Since we know different props display snapshot and same reference display current value.

To get snapshot in class component, just assign the data that will alert to a new variable. (give several different value)

To get current value in functional component, add a ref(react) / create a value outside the component and store value to it. (give a same reference)

### Initial state from props

Ref: https://reactjs.org/docs/react-component.html#constructor

> It is **NOT RECOMMEND** that initialized state from props directly. Update _props_ won't be reflected in the _state_. **Only use this pattern if you intentionally want to ignore prop updates.**

Class Base:

```js
constructor(props) {
    super(props);
    // Don't do this!
    this.state = { color: props.color };
}
```

Functional Base:

```js
//  Don't do this!
const [state, setState] = useState(props.color);
```

The correct way is:

Class Base:

```js
constructor(props) {
    super(props);
    this.state = {};
}

componentDidMount(){
    this.setState({color: props.color})
}
```

Functional Base:

```js
const { color } = props;
const [state, setState] = useState(null);

useEffect(() => {
    setState(color);
}, [color]);
```

## React Posts Archive

> [See my other post]({{< ref "/react-posts-archive.md" >}})

## Structure

### package.json

react & react-dom is necessary for web app. For mobile app need react-native instead of react-dom.

### public/index.html

signal page application which is index.html

Everything your do will inside `<div id="root"></div>`

### src/index.js

Entry point for react

### src/App.js

All the component.

Inside the class, the render() method is called life cycle method and to render the page.

In JSX, you cannot use HTML class attribute. you have to use className.

## 16.3 && before 16.3

[link](https://www.jianshu.com/p/ce5451287f1c)

