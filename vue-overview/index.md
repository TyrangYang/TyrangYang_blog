# Vue Overview


Vue Document: [English](https://vuejs.org/) [中文](https://cn.vuejs.org/)

## life cycle

![lifeCycyle](/images/2020-05-17-vue/lifecycle.png)

## Basic structure

```html
<template>
    <div></div>
</template>
<script>
    export default {
        name: '',
        props: [...],
        data() {
            return {};
        },
        computed:{
            ...
        }
        methods: {
            ...
        }
    };
</script>
<style lang="css"></style>
```

## Basic vue function

### v-bind

```html
<option
    v-for="(user, idx) in Users"
    :key="idx"
    :value="user.id"
    @mousedown.prevent="multiSelectEvent"
    >{{ user.name }}</option
>
```

`v-bind:value` is equal to `:value`

### v-on

```html
<option
    v-for="(user, idx) in Users"
    :key="idx"
    :value="user.id"
    @mousedown.prevent="multiSelectEvent"
    >{{ user.name }}</option
>
```

`v-on:click` is equal to `@click`

### v-for

```html
<div
    class="oneline"
    v-for="(each, idx) in sortSummary(summary)"
    :key="idx"
></div>
```

#### Not use v-for & v-if in one tag

[Document](https://vuejs.org/v2/style-guide/#Avoid-v-if-with-v-for-essential)

`v-for` have higher priority than `v-if`, Therefore, `v-if` will be run multiple times and all element will be render. However, you only need to render the element which `v-if` return true.

The solution is to make a method or computed that filter the element and return them

### v-if

```html
<div v-if="errors.length">
    <b>Please correct the following error(s):</b>
    <ul>
        <li v-for="(error, idx) in errors" :key="idx">{{ error }}</li>
    </ul>
</div>
```

### v-show

```html
<span v-show="unevenlySplit && amount === ''" style="color: red"
    >(amount should not empty)</span
>
```

### v-model

```html
<select class="sortSummary" v-model="sortModel">
    <option value="0">Not sort</option>
    <option value="1">Sort by Payer</option>
    <option value="2">Sort by receiver</option>
</select>
```

In `input` tag `v-model = "something"` is equal to `:value="something @input="something = $event.target.value`

### v-text

```html
<span v-text="variable"></span>
```

This is equal to `<span> {{variable}} </span>`

## Vuex

See my another post: [Vuex Overview]({{< ref "posts/vuex-overview.md" >}})

## Question facing

### Vue can not use `[]` to modify an object in data;

We have to use `this.$set(<object name>, <key>, <val>)`

https://www.telerik.com/blogs/so-what-actually-is-vue-set

