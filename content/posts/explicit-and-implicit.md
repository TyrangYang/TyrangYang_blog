---
title: explicit and implicit in c++
date: 2019-07-25
author: Haolin Yang
categories: ["C++"]
tags:
    - c++
---

## explicit and implicit

In C++, constructor can be explicit and implicit.

The reserve word explicit affect constructor with only one parameter or only one parameter without given initial value.

```cpp
#include <iostream>
using namespace std;

class test1
{
    int data;
public:
    test1(int t = 0):data(t){};
    ~test1(){};

    test1 operator + (const test1 &a) const{
        return test1(data + a.data);
    }

    test1& operator = (const test1 &a)
    {
        this->data = a.data;
        return *this;
    }

    int getData(){return data;};
};

class test2
{
    int data;
public:
    // explicit test2(int t):data(t){};
    explicit test2(int t, int a = 0):data(t){};
    ~test2(){};

    int getData(){return data;};
};

int main(int argc, char const *argv[])
{
    test1 t1(1); //explicit constructor
    cout << t1.getData() << endl; // 1

    test1 t2 = 1; //implicit constructor
    cout << t2.getData() << endl; // 1

    test1 t3 = 'a'; //implicit convert integer into char and call implicit constructor
    cout << t3.getData() << endl; // 97

    test1 t4;
    t4 = t2 + 3; // + operation will take 3 and call implicit constructor

    t4 = 3 + t2; // ERROR! + operater belongs the integer and it doesn't know how to convert t2

    test2 t5('a');// explicit constructor is OK
    cout << t5.getData() << endl; // 97

    test2 t6 = 'a'; //error. Must be explicit.
    return 0;
}
```

`t1(1)` -> explicit
`t1 = 1` -> implicit
