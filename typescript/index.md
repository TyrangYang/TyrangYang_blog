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

### Array

```ts
type Book = {
    id: string;
    name: string;
};

let books: Book[] = [];
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

## Function

```ts
type listenerType<EventType> = (event: EventType) => void;
```

## Type & interface

```ts
type Book = {
    id: string;
    name: string;
};

interface Book {
    id: string;
    name: string;
}
```

