# Typescript overview


## Trick

### generic types optional

**To make a generic type optional, you have to assign the void as the default value.**

```ts
const fetchData = <T = void>(url: string): T => {
    const res: T = fetch(url);
    return res;
};
```

https://garbagevalue.com/blog/optional-generic-typescript#quick-solutions-make-generic-type-optional

### string[ ] & [ string, ...string[ ] ]

The main difference is that type `[string, ...string[]]` at least have one element. `[]` will alert error. `string[]` could be empty. `[]` is ok.

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

## Type a Function

```ts
type listenerType<EventType> = (event: EventType) => void;
```

## Assign a plain Object

```ts
type Primitive = bigint | boolean | null | number | string | symbol | undefined;

type PlainObject = Record<string, Primitive>;
const obj1: PlainObject = { a: 1 }; //✅
const obj2: PlainObject = { a: 1 }; //❌
const obj3: PlainObject = new myClass(); //❌
```

## Assign a nested plain Object

```ts
type Primitive = bigint | boolean | null | number | string | symbol | undefined;

type JSONValue = Primitive | JSONObject | JSONArray;
interface JSONObject {
    [key: string]: JSONValue;
}
interface JSONArray extends Array<JSONValue> {}

const obj1: PlainObject = { a: 1 }; //✅
const obj2: PlainObject = { a: { b: { c: 3 } } }; //✅
const obj3: PlainObject = new myClass(); //❌
```

## Type Template arrow function example

```ts
export const useFetchAPI = <T extends unknown>(
    url: string,
    method: 'POST' | 'GET',
    body?: string | JSONObject
): [string, T | null] => {
    const [fetchStatus, setFetchStatus] = useState('error');
    const [fetchResult, setFetchResult] = useState<T | null>(null);

    useEffect(() => {
        const apiMockFetch: () => Promise<{
            status: string;
            requestId: string;
            result: T | null;
        }> = () => {
            return new Promise((resolve) => {
                setTimeout(() => {
                    resolve(someData);
                }, 1000);
            });
        };

        const fetchData = async () => {
            const { status, result } = await apiMockFetch();
            setFetchStatus(status);
            if (result !== undefined) {
                setFetchResult(result);
            }
        };
        if (fetchStatus !== 'success') fetchData();
    }, [url, method, body, fetchStatus]);
    return [fetchStatus, fetchResult];
};
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

