---
title: Concurrent Programming Course note 4
date: 2019-09-25
author: Haolin Yang
categories: ["Concurrent-programming"]
tags:
    - concurrent
    - course note
---

## Monitor

signal condition --> waiting monitor --> signaling

### producer and consumer with a buffer whose size is one

```java

monitor PC {
    Object buffer;

    void produce(Object o){
        if(buffer != null){ // while
            empty.wait();
        }
        buffer = o;
        full.signal();
    }

    Object consume() {
        if(buffer == null) // while
            full.wait();
        Object temp = buffer;
        empty.signal();
        return temp;
    }
}

```

## Semaphore

```java
// Assumption: E < S < W (Signal and urgent wait)
monitor Semaphore {
    int permit;

    void acquire() {
        if(permit == 0){
            permitsAvailable.wait();
        } else {
            permit--;
        }
    }

    void release(){
        if(!permitAvailable.isEmpty()){
            permitsAvailable.signal();
        } else{
            permit++;
        }
    }
}
```

## readers and writers

assume start first and stop

```java

monitor RW {

    int readers=0;
    int writers=0;

    void start_read(){
        if (writer!=0 || !okToWrite.isEmpty())
            okToRead.wait();
        readers++;
        okToRead.signal(); // cascade signaling
    }

    void stop_read(){
        readers--;
        if(readers == 0)
            okToWrite.signal();
    }

    void start_write(){
        if(writers!=0 || readers!=0)
            okToWrite.wait();
        writers++;
    }

    void stop_write(){
        writers--;
        if(okToRead.isEmpty())
            okToWrite.signal();
        else
            okToRead.signal();
    }
}

```

## 3 way sequence (booklet q4)

```java
monitor 3WS{
    int state = 1;
    condition first, second, third;
    void first(){
        while(state != 1)
            first.wait();
        state = 2;
        second.signal();
    }

    void second(){
        while(state != 2)
            second.wait();
        state = 3;
        third.signal();
    }

    void third(){
        while(state != 3)
            third.wait();
        state = 1;
        first.signal();
    }
}
```

## Booklet6 q5

```java
monitor myBarrier{
    final static int N = 3;
    int barrierCounter = 0;
    condition stop;

    // thread run before synchronize();
    this.synchronize();
    // thread run after synchronize();

    synchronize(){
        barrierCounter++;
        while(barrierCounter < N)
            stop.wait();
        stop.signal();
    }
}
```

## Pizza question

E = W < S

```java
monitor Pizzeria{
    int small, large;
    condition smallAvail, largeAvail;

    purchaseLargePizza(){
        while(large == 0 && small < 2){
            largeAvail.wait();
        }
        if(large > 0){
            large -- ;
        } else {
            small = small - 2;
        }
    }

    purchaseLargePizza(){
        while(small == 0){
            smallAvail.wait();
        }
        small--;
    }

    bakeSmallPizza(){
        small++;
        smallAvail.signal();
        largeAvail.signal();
    }

    bakeLargePizza(){
        large++;
        largeAvail.signal();
    }
}
```

##

```java
public class BarrierExample{
        public static class Barrier{

            private final Lock lock = new ReentrantLock();
            private final Condition door1 = lock.newCondition();
            private final Condition door2 = lock.newCondition();

            private boolean d1 = false;
            private boolean d2 = true;

            private int c = 0;

            private  final int n = 3;

            void synch(){
                lock.lock();
                try {
                    while(d1){
                        door1.await();
                    }
                    c++;
                    if(c == n){
                        d2 = false;
                        d1 = true;
                        door2.signalAll();
                    }
                    while(d2){
                        door2.await();
                    }
                    c--;
                    if(c == 0){
                        d1 = false;
                        d2 = true;
                        door1.signalAll();
                    }
                }catch (InterruptedException e) {
                    e.printStackTrace();
                }
                lock.unlock();
            }

            public static void main(String[] args) {
                Barrier b1 = new Barrier();
                Barrier b2 = new Barrier();
                Thread t1 = new Thread(new p("a","1",b1, b2));
                Thread t2 = new Thread(new p("b","2",b1, b2));
                Thread t3 = new Thread(new p("c","3",b1, b2));

                t1.start();
                t2.start();
                t3.start();

                try {
                    t1.join();
                    t2.join();
                    t3.join();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }

        public static class P implements Runnable{

            private String pres,post;
            Barrier barrier1, barrier2;

            public P(String pres, String post, Barrier barrier1, Barrier barrier2) {
                this.pres = pres;
                this.post = post;
                this.barrier1 = barrier1;
                this.barrier2 = barrier2;
            }

            public void run(){
                for (int i = 0; i < 100; i++) {
                    System.out.println(pre);
                    barrier1.synch();
                    System.out.println(post);
                    barrier2.synch();
                }
            }
        }
    }
```
