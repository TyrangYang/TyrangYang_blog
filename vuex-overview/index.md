# Vuex Overview


Vuex Document: [English](https://vuex.vuejs.org) [中文](https://vuex.vuejs.org/zh/)

## Concept

-   **State** - App-level state/data
-   **Getters** - Get pieces of state or computed values from state
-   **Actions** - Called from components to commit mutation (async)
-   **Mutations** - Mutate the state (sync)
-   **Modules** - Each module can have its own state, getters, actions and mutations

## Work flow

![vuex workflow](/images/vuex/vuex.png)

Vuex work flow is similar with Redux:

![redux workflow](/images/vuex/redux.jpeg)

## Basic structure

In `store/index.js`

```js
// import vue and vuex
import Vuex from 'vuex';
import Vue from 'vue';
// import module
import users from './modules/users';
import bills from './modules/bills';

// adding vuex
Vue.use(Vuex);

// create store
const store = new Vuex.Store({
    modules: {
        users,
        bills,
    },
});

// export store
export default store;
```

In `main.js`

```js
// Adding...

// import store
import store from './store';

// add store to vue object

new Vue({
    store, // add this line
    render: (h) => h(App),
}).$mount('#app');
```

In a module

```js
const state = {
    Users: [
        { id: 'userId1', name: 'testName1' },
        { id: 'userId2', name: 'testName2' },
    ],
};

const getters = { Users: (state) => state.Users };

const actions = {
    async addUser(context, usr) {
        let usr = await axios.post('....', usr);
        context.commit('addUser', usr);
    },
    // or
    async addUser({ commit }, usr) {
        let usr = await axios.post('....', usr);
        commit('addUser', usr);
    },
};

const mutations = {
    addUser(state, usr) {
        state.Users.push(usr);
    },
};

export default {
    state,
    getters,
    actions,
    mutations,
};
```

## Access

### Getters

```js
export default {
    name: 'User',
    computed: {
        Users() {
            return this.$store.getters.Users;
        },
    },
};
```

### Actions

```js
this.$store.dispatch('mutation name', variable);
```

### Mutation

```js
this.$store.commit('mutation name', variable);
```

### Module

In default, all modules will combine to root store even you have different module except you have a `namespace`

### mapActions, mapGetters, mapMutations

```js
import { mapActions, mapGetters, mapMutations } from 'vuex';

export default {
    // ...
    computed: {
        ...mapGetters([
            'doneTodosCount', // `this.doneTodosCount` -> `this.$store.getters.doneTodosCount`
            'anotherGetter', // `this.anotherGetter` -> `this.$store.getters.anotherGetter`
        ]),
    },
    methods: {
        ...mapMutations([
            'increment', //  `this.increment()` -> `this.$store.commit('increment')`

            'incrementBy', //  `this.incrementBy(amount)` -> `this.$store.commit('incrementBy', amount)`
        ]),
        ...mapMutations({
            add: 'increment', //  `this.add()` -> `this.$store.commit('increment')`
        }),
        ...mapActions([
            'increment', //  `this.increment()` -> `this.$store.dispatch('increment')`

            'incrementBy', //  `this.incrementBy(amount)` -> `this.$store.dispatch('incrementBy', amount)`
        ]),
        ...mapActions({
            add: 'increment', //  `this.add()` -> `this.$store.dispatch('increment')`
        }),
    },
};
```

