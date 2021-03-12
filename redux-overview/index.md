# Redux Overview


Redux Document: [English](https://redux.js.org/introduction/getting-started) [中文](https://cn.redux.js.org)

## What is Redux

> Redux is a predictable state container for JavaScript apps.

Redux also created by Facebook and it is a improvement from Flux. Redux is state management for any view library (mostly react)

## When use Redux

Redux is design for complex UI, multiple view source or many interaction with server. If a simple UI, Redux is **not necessary**

## Workflow

{{<figure src="/images/vuex/redux.jpeg" title="Redux Workflow" width="70%" height="70%" >}}

## Example for Redux core

In `index.html`

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Redux Core</title>
        <!-- Use redux as UMD -->
        <script src="https://unpkg.com/redux@latest/dist/redux.min.js"></script>
        <!-- redux will be imported as Window.Redux -->
    </head>
    <body>
        <div class="app"></div>
        <script src="./main.js"></script>
    </body>
</html>
```

```js
// UMD import
const { default: thunk } = ReduxThunk;
const { applyMiddleware, createStore, combineReducers } = Redux;

// init state
let initUserState = {
    name: '',
    age: 0,
};

let initPostState = {
    content: '',
};

// reducer
const userReducer = (prevState = initUserState, action) => {
    switch (action.type) {
        case 'CHANGE_NAME':
            return { ...prevState, name: action.payload };
        case 'CHANGE_AGE':
            return { ...prevState, age: action.payload };
        case 'ERR':
            throw new Error('Err: ' + action.error);
        default:
            break;
    }

    return prevState;
};

const postReducer = (prevState = initPostState, action) => {
    switch (action.type) {
        case 'ADD_POST':
            return { ...prevState, content: action.content };

        default:
            break;
    }

    return prevState;
};

const reducers = combineReducers({
    user: userReducer,
    post: postReducer,
}); // store will looks like {user: ... , post: ...}

const logger = ({ getState }) => (next) => (action) => {
    console.log({ ...action });
    console.log(getState());
    next(action);
};

// create store
const store = createStore(reducers, applyMiddleware(thunk, logger)); // init

store.subscribe(() => {
    console.log('State: ', store.getState());
});

store.dispatch({ type: 'CHANGE_NAME', payload: 'DVA89' });
store.dispatch({ type: 'CHANGE_AGE', payload: 30 });
store.dispatch({ type: 'CHANGE_AGE', payload: 25 });
store.dispatch({ type: 'ADD_POST', content: 'a test post' });
```

## Async Action

> add `redux-thunk` first

```js
// UMD import
const { default: thunk } = ReduxThunk;
const { applyMiddleware, createStore } = Redux;

// init state
let initState = {
    users: [],
    fetching: false,
    fetched: false,
    error: null,
};

// reducer
const userReducer = (prevState = initState, action) => {
    switch (action.type) {
        case 'USER_PENDING':
            return { ...prevState, fetching: true };
        case 'USER_FULFILLED':
            return {
                ...prevState,
                fetching: false,
                fetched: true,
                users: action.payload,
            };
        case 'USER_REJECTED':
            return {
                ...prevState,
                fetching: false,
                fetched: false,
                error: action.payload,
            };
        case 'test':
            console.log('test type');
            return {
                ...prevState,
            };
        default:
            // statements_def
            break;
    }

    return prevState;
};

const logger = ({ getState }) => (next) => (action) => {
    console.log(getState());
    console.log(action);
    next(action);
};

// create store
const store = createStore(userReducer, applyMiddleware(thunk, logger));

store.subscribe(() => {
    console.log('State: ', store.getState());
});

// async
store.dispatch((dispatch) => {
    dispatch({ type: 'USER_PENDING' });
    fetch('https://jsonplaceholder.typicode.com/users?_limit=5')
        .then((res) => {
            return res.json();
        })
        .then((response) => {
            dispatch({ type: 'USER_FULFILLED', payload: response });
        })
        .catch((err) => {
            dispatch({ type: 'USER_REJECTED', payload: err });
        });
});

// sync
store.dispatch({ type: 'test' });
```

If add `redux-promise-middleware` in middleware, dispatch can change to this:

```js
store.dispatch({
    type: 'USER',
    payload: axios('https://jsonplaceholder.typicode.com/users?_limit=5'),
});
```

suffix `_PENDING` `_FULFILLED` `_REJECTED` will be add automatically.

## Use with react (react-redux)

Document: https://react-redux.js.org/introduction/quick-start

1. warp provider in index.js
2. separate reducer
3. separate action

Skeleton:

```js
import React, { Component } from 'react';
import { connect } from 'react-redux';
import addUserAction from '../action/addUserAction';

export class ClassComponent extends Component {
    render() {
        return <div></div>;
    }
}

const mapStateToProps = (state) => ({
    user: state.user,
});

const mapDispatchToProps = { addUserAction };

export default connect(mapStateToProps, mapDispatchToProps)(ClassComponent);
```

### useSelector & useDispatch

`useSelector` is a hook provided by react-redux that approximately equivalent to `mapStateToProps`

`useDispatch` dispatch a action to store which is to replace `mapDispatchToProps`

## Use @reduxjs/toolkit with react

Document: https://redux-toolkit.js.org/introduction/quick-start

{{< admonition type=Tip title=Tip open=true >}}
slicer = reducer + action
{{< /admonition >}}

```js
import { createSlice } from '@reduxjs/toolkit';

export const UserSlice = createSlice({
    name: 'userData',
    initialState: {
        user: [],
        fetching: false,
        fetched: false,
        error: null,
    },
    reducers: {
        userPending: (state) => {
            return { ...state, fetching: true, fetched: false };
        },
        userFulfilled: (state, action) => {
            return {
                ...state,
                fetching: false,
                fetched: true,
                user: action.payload,
            };
        },
        userRejected: (state, action) => {
            return {
                ...state,
                fetching: false,
                fetched: true,
                user: [],
                error: action.payload,
            };
        },
    },
});

export const { userPending, userFulfilled, userRejected } = UserSlice.actions;

export const getUser = () => (dispatch) => {
    dispatch(userPending());
    fetch('https://jsonplaceholder.typicode.com/users?_limit=5')
        .then((res) => res.json())
        .then((data) => dispatch(userFulfilled(data)))
        .catch((err) => dispatch(userRejected(err)));
};

export default UserSlice.reducer;
```

In component:

```js
import React, { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { getUser } from './userSlice';
export default function User() {
    const userData = useSelector((state) => state.userData);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(getUser());
    }, []);
    console.log(userData);
    return <div>hi</div>;
}
```

In store.js:

```js
import { configureStore } from '@reduxjs/toolkit';
import userReducer from '../features/user/userSlice';

export default configureStore({
    reducer: {
        userData: userReducer,
    },
});
```

