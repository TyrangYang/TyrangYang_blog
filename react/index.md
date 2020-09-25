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

### Class Component lifecycle ==> Functional Component hooks

|     Class component     |                       Functional component                       |
| :---------------------: | :--------------------------------------------------------------: |
|    state + setState     |                            useState()                            |
|   componentDidMount()   |               useEffect() with a empty input list                |
|  componentDidUpdate()   | useEffect() with a input list contained which you want to change |
| componentWillUnmount()  |           useEffect() with a return callback function            |
| shouldComponentUpdate() |           export default React.memo(<component name>)            |

## Context API

Doc: https://reactjs.org/docs/context.html#reactcreatecontext

Use a context:

1. React.createContext({defaultValue})
2. import the context your create. Warp you root component which you want to use this context in <ContextName.provider ></ContextName.provider>
3. component under root context component will access to this context
    1. static contextType = MyContext
    2. Warp component like `<MyContext.Consumer> {value => /_ render something based on the context value _/} </MyContext.Consumer>`

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
FancyInput = React.forwardRef(FancyInput);
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

### useRef

> `useRef()` creates a plain JavaScript object. The only **difference** between `useRef()` and creating a `{current: ...}` object yourself is that useRef will give you **the same ref object** on every render.

## React.memo()

React.memo() =>

```js
export default React.memo(App);
```

[link](https://www.jianshu.com/p/ce5451287f1c)

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

