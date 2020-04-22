---
title: Functor in C++
date: 2019-07-20
author: Haolin Yang
categories: ["STL-study-note"]
tags:
    - c++
    - STL
---

Basically, Functor have same functionality with interface in java.

Think about this code. You want count all string whose length is less than 5.

```cpp
#include <iostream>
#include <algorithm>
#include <vector>
#include <string>
using namespace std;

bool lenLessThanFive(const string& str){
    return str.size() < 5;
}

int main(int argc, char const *argv[])
{
    string ia[5] = {"a", "aa", "aaa", "aaaa", "aaaaa"};
    vector<string> iv(ia, ia+5);
    int res = count_if(iv.begin(), iv.end(), lenLessThanFive);
    cout << "res= " << res << endl;
    return 0;
}
```

`lenLessThanFive` is a function pointer here. It is work right, but it lack scalability. We cannot change the threshold in the function every time. Meanwhile, Function need to be unary(only one parameter). Therefore, we can consider the Functor.

```cpp
template <typename T>
class LenLessThan
{
private:
    const int lenThreshold;
public:
    bool operator () (const T& str){
        return str.size() < lenThreshold;
    }
    explicit LenLessThan(int len):lenThreshold(len){};
};

int main(int argc, char const *argv[])
{
    string ia[5] = {"a", "aa", "aaa", "aaaa", "aaaaa"};
    vector<string> iv(ia, ia+5);
    int res = count_if(iv.begin(), iv.end(), LenLessThan<string>(4));
    cout << "res = " << res << endl;
    return 0;
}
```

Class `LenLessThan` is a functor and you can solve this problem.

A amount of functor used in STL.
