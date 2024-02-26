# Typescript Trick


## generic types optional

**To make a generic type optional, you have to assign the void as the default value.**

```ts
const fetchData = <T = void>(url: string): T => {
    const res: T = fetch(url);
    return res;
};
```

https://garbagevalue.com/blog/optional-generic-typescript#quick-solutions-make-generic-type-optional

## string[ ] & [ string, ...string[ ] ]

The main difference is that type `[string, ...string[]]` at least have one element. `[]` will alert error. `string[]` could be empty. `[]` is ok.

