---
title: Review java - Variable
date: 2019-07-01
author: Haolin Yang
categories: ["Java"]
tags:
    - review
    - java
---

## Basic types

Every type have a default value:

|  Type   |   Representation    | Initial value | Storage | Max. value  |
| :-----: | :-----------------: | :-----------: | :-----: | :---------: |
|  byte   |   singed integer    |       0       | 8 bits  |     127     |
|  short  |   singed integer    |       0       | 16 bits |    32767    |
|   int   |   singed integer    |       0       | 32 bits | 2147483647  |
|  long   |   singed integer    |       0       | 64 bits | over 10^18  |
|  float  |   floating point    |      0.0      | 32 bits | over 10^38  |
| double  |   floating point    |      0.0      | 64 bits | over 10^308 |
| boolean |    true or false    |     false     |  1 bit  |             |
|  char   | UNICODE (not ASCII) |     u0000     | 16 bits |    uFFFF    |

## Difference between i++ and ++i

```java
b = 1;
a = b++; // a = 1; b = 2
```

```java
b = 1;
a = ++b; // a = 2; b = 2
```

```java
int a = 1;
int res = a++ + a;
// res = 3 ; a = 2.
```

```java
int a = 1;
int res = a + a++;
// res = 2; a = 2.
```

```java
int a = 1;
int res = ++a + a;
// res = 4; a = 2.
```

```java
int a = 1;
int res = a + ++a;
// res = 3; a = 2.
```

## For loop

for(**int** i=0; i < n ; i++)

## Break or continue the outer loop

```java
class TestContinueLabel{
    public static void main (String args[]){
        outer:
        for(int i = 1; i < 5; i++){
            System.out.println("Begin outer for i="+i);inner:
            for (int j = 1; j < 5; j++){
                if (j == i) continue outer;
                System.out.println("inner: i=" + i + " j="+j );
            }
            System.out.println("End outer for i="+i);
        }
            System.out.println("Finished.");
    }
}
```

Result:

```
Begin outer for i=1
Begin outer for i=2
inner: i=2 j=1
Begin outer for i=3
inner: i=3 j=1
inner: i=3 j=2
Begin outer for i=4
inner: i=4 j=1
inner: i=4 j=2
inner: i=4 j=3
Finished.
```

```java
class TestBreakLabel{
    public static void main (String args[]){
        outer:
        for(int i = 1; i < 5; i++){
            System.out.println("Begin outer for i="+i);
            inner:
            for (int j = 1; j < 5; j++){
                if (j == i) break outer;
                System.out.println("inner: i=" + i + " j="+j );
            }
            System.out.println("End outer for i="+i);
        }
        System.out.println("Finished.");
    }
}
```

Result:

```
Begin outer for i=1
Finished.
```

C++ only use **goto** to achieve this feature

```cpp
void TestContinueLabel(){
    for (int i = 1; i < 5; ++i)
    {
        cout << "Begin outer for i=" << i << endl;
        for (int j = 1; j < 5; ++j)
        {
            if(i == j)
                goto ContinueTry;
            cout << "inner: i=" << i << " j=" << j << endl;
        }
        cout << "End outer for i=" << i << endl;
        ContinueTry:;
    }
    cout << "Finished." << endl;
}
```

```cpp
void TestBreakLabel(){
    for (int i = 1; i < 5; ++i)
    {
        cout << "Begin outer for i=" << i << endl;
        for (int j = 1; j < 5; ++j)
        {
            if(i == j)
                goto BreakTry;
            cout << "inner: i=" << i << " j=" << j << endl;
        }
        cout << "End outer for i=" << i << endl;
    }
    BreakTry:
    cout << "Finished." << endl;
}
```
