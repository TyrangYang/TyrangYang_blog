# Typescript overview


## type

### Union type & Literal type

```ts
const add = (
    a: number | string,
    b: number | string,
    type?: 'number' | 'string'
): number | string => {
    if (type === 'string') {
        return a.toString() + b.toString();
    } else return +a + +b;
};

console.log(add(1, 2));
```

### unknown

```ts
let test1: unknown;
let test2: string;

test1 = 'xyz'; // ok
// test2 = test1; // error
function f1(a: any) {
    a.b(); // OK
}
function f2(a: unknown) {
    a.b(); //error
    // Object is of type 'unknown'.
}
```

