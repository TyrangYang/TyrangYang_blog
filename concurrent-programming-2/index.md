# Concurrent Programming Course note 2


## Race condition

Multiple thread access one same variables of object concurrently and at least one does update.

Bad situation.

## Atomic operation

An operation is atomic if it execute until it completion without interruption

## Critical section

A part of program that accesses shared memory and which we which to execute automatically.

### mutual exclusion problem (MEP)

1. Mutex: at and point in time, there is at most one thread in the critical section
2. Absence of livelock: If various of threads try to entry the critical section, at lease one of them will succeed.
3. Free from starvation: A thread trying to enter its critical section will eventually be able to do so.

**Deadlock** is not exit for a interleaving in a transition system.

**no shared variables between critical and non critical section nor with the entry/exit protocol.**

critical section must be end

it is meaningless that while(true) loop not exist.

```cpp
while(!flag){
    flag = true;
    // .....
    flag = false;
}

await !flag
```

![transition system](/images/2019-09-04-concurrent-programming-2/transition-system.png)

no (p4,q4) which two thread in critical section at same time.

if process could block when trying to access the critical section, it is **deadlock**.

**Starvation** is due to the fact that both processes test and set a single global variable.

## Dekker's Algorithm

```java
global int turn = 1;
global boolean wantP = false;
global boolean wantQ = false;

thread p:{
    while(true){
        wantP = true;
        while wantQ{
            if(turn == 2){
                wantP = false;
                await (turn == 1);
                wantP = true;
            }
        }
        turn = 2;
        wantP = false;
    }
}

thread p:{
    while(true){
        wantQ = true;
        while wantP{
            if(turn == 1){
                wantQ = false;
                await (turn == 2);
                wantQ = true;
            }
        }
        turn = 2;
        wantQ = false;
    }
}
```

## Peterson's Algorithm

```java
global int last = 1;
global boolean wantP = false;
global boolean wantQ = false;

thread p:{
    while(true){
        wantP = true;
        last = 1;
        await (!wantQ || last == 2);
        wantP = false;
    }

    while(true){
        wantQ = true;
        last = 2;
        await (!wantP || last == 1);
        wantQ = false;
    }
}
```

