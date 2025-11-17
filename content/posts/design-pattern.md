---
title: 'Design Pattern'
date: 2021-07-22T16:35:53-07:00
Categories: ['Overview']
tags: ['javascript', 'typescript']
toc:
  enable: true
  auto: true
linkToMarkdown: true
math:
  enable: false
---

##

## Design pattern

### Factory pattern

```js
const createDataBaseClass = (dbName: DBOption) => {
  switch (dbName) {
    case 'InMemo':
      return InMemoryDataBase;
    case 'SQL':
      return SQL_DB;

    // ...
    // you can add anything else
    default:
      break;
  }
};
```

### Singleton pattern

The Singleton Pattern limits the number of instances of a particular object to just one. This single instance is called the singleton.

```js
export const createDataBase = <T extends BaseRecord>() => {
    const db = new InMemoryDataBase<T>();
    return db;
};

const pokemonDB = createDataBase<Pokemon>();

pokemonDB.set({
    id: 'Bulbasaur',
    attack: 59,
    defense: 10,
});

console.log(pokemonDB.get('Bulbasaur'));
```

#### A CPP way to do

```js
const createDataBase2 = <T extends BaseRecord>() => {
    class InMemoryDataBase2 implements DataBase<T> {
        private db: Record<string, T> = {};
        static instance: InMemoryDataBase2 = new InMemoryDataBase2();

        private constructor() {} // private constructor is necessary

        public set(newValue: T): void {
            this.db[newValue.id] = newValue;
        }

        public get(id: string): T | undefined {
            return this.db[id];
        }
    }

    return InMemoryDataBase2;
};
const PokemonDB2 = createDataBase2<Pokemon>();
PokemonDB2.instance.set({
    id: 'Bulbasaur',
    attack: 59,
    defense: 10,
});

```

### Observer (pub/sub) pattern

#### Observer

```js
const createObserver = <EventType>(): ({
  subscribe: (listener: listenerType<EventType>) => () => void, // take listener and return an unsubscribe function
  publish: (event: EventType) => void,
}) => {
  let listeners: listenerType<EventType>[] = [];
  return {
    subscribe: (listener: listenerType<EventType>): (() => void) => {
      listeners.push(listener);
      return () => {
        listeners = listeners.filter((l) => l !== listener);
      };
    },
    publish: (event: EventType) => {
      listeners.forEach((l) => l(event));
    },
  };
};
```

#### Real use case

```ts
interface BeforeAddValueEvent<T> {
  newValue: T;
  value: T;
}
interface AfterAddValueEvent<T> {
  value: T;
}

class InMemoryDBWithObserver<T extends BaseRecord> extends InMemoryDataBase<T> {
  public set(newValue: T): void {
    this.BeforeAddValueObserver.publish({
      newValue,
      value: this.db[newValue.id],
    });
    this.db[newValue.id] = newValue;
    this.AfterAddValueObserver.publish({
      value: newValue,
    });
  }

  public get(id: string): T | undefined {
    return this.db[id];
  }
  // observer
  private BeforeAddValueObserver = createObserver<BeforeAddValueEvent<T>>();
  private AfterAddValueObserver = createObserver<AfterAddValueEvent<T>>();

  onBeforeAddValue(listener: listenerType<BeforeAddValueEvent<T>>): () => void {
    return this.BeforeAddValueObserver.subscribe(listener);
  }

  onAfterAddValue(listener: listenerType<AfterAddValueEvent<T>>): () => void {
    return this.AfterAddValueObserver.subscribe(listener);
  }

  // visiter pattern
  visit(visitor: (item: T) => void): void {
    Object.values(this.db).forEach(visitor);
  }

  // strategy pattern
  getBest(strategy: (item: T) => number): T {
    let findRes: { max: number; res: T | null } = {
      max: -Infinity,
      res: null,
    };

    return Object.values(this.db).reduce((prev, cur) => {
      let score = strategy(cur);
      if (prev.max < score) return { max: score, res: cur };
      return prev;
    }, findRes).res;
  }
}

const pokemonDB = new InMemoryDBWithObserver<Pokemon>();

pokemonDB.onBeforeAddValue((event) => {
  console.log('Before add value');
  console.log(event);
});

const unsubscribe = pokemonDB.onAfterAddValue((event) => {
  console.log('After ADD A Value');
  console.log(event);
});
pokemonDB.onAfterAddValue((event) => {
  console.log('-----------');
});

pokemonDB.set({
  id: 'Bulbasaur',
  attack: 59,
  defense: 10,
});
pokemonDB.set({
  id: 'Bulbasaur',
  attack: 20,
  defense: 30,
});

unsubscribe();

pokemonDB.set({
  id: 'Spinpsaur',
  attack: 159,
  defense: 110,
});

console.log('Visit pattern:');
pokemonDB.visit((item) => console.log(item));

console.log('strategy pattern:');
console.log(pokemonDB.getBest((item) => item.defense));
```

### Proxy pattern

```js
Class dbProxy () {
    constructor() {
        this.db = new DB();
        this.dbCache = new Map();
    }

    get(key){
        if(this.dbCache.has(key)) return dbCache.get(key);

        const res = db.get(key);
        dbCache.set(key, res);
        return res;
    }
}


let db = new dbProxy();

db.get('a');
db.get('a'); // cache
db.get('a'); // cache

```

### Adaptor pattern
