---
title: Bit operation in C++
date: 2019-08-18
author: Haolin Yang
categories: ['STL-study-note']
tags:
    - c++
    - bit
---

## Bit operator

| operator | function         | example             |
| :------: | ---------------- | ------------------- |
|    <<    | left shift       | 0001 --> 0010       |
|    >>    | right shift      | 0010 --> 0001       |
|    &     | and (bit by bit) | 1100 & 1010 = 1000  |
|    \|    | or (bit by bit)  | 1010 \| 0101 = 1111 |
|    ~     | reverse          | ~0000 = 1111        |
|    ^     | XOR              | 0110 ^ 1100 = 1010  |

### Operator: &

x is a bit

x & 1 = x

x & 0 = 0

Usually use & as a filter. Suppose we have a number is X, X & 0011 will get the last two bits of X.

```cpp
#include <iostream>
using namespace std;

int main(int argc, char const *argv[])
{
    int testInt = 123;

    cout << "The test integer is: " << testInt << endl;
    cout << "The binary number is: " << endl;
    for (int i = 31; i >= 0; --i)
    {
        int tmp = testInt & (1 << i);
        if(tmp == 0)
            cout << '0';
        else
            cout << '1';
        if(i % 4 == 0)
            cout << ' ';
    }
    cout << endl;
    return 0;
}
```

### Operator: |

Wave Adder. One is 1 result will be 1.

```cpp
#include <iostream>
#include <bitset>
using namespace std;

int main(int argc, char const *argv[])
{
    // we want a wave like 111000

    int begin = 1 << 3; // 1000

    for(int i = 0 ; i < 2; ++i){
        begin = begin | begin << 1;
    }

    bitset<8> test(begin);
    cout << test << endl;
    cout << begin << endl;
}
```

### Operator: ^

Canceller. Same is 0 otherwise is 1.

a ^ b = c ---> b = c ^ a

---

## bitset

[Official Doc](http://www.cplusplus.com/reference/bitset/bitset/)

bitset is stable structure that boolean value in only one bit. It need prefix the size.

The defect of bitset is that it **cannot extend**. _vector\<bool\>_ don't need to array about the size however that is defective at design level. Instead, we can use vector\<char\>. (char is 4 bits in c++)

bitset use for a huge mount of boolean data. Bitset need 8 bytes at beginning(64 bit memory). If the array of boolean data is small( <8 bytes), you better use a integer or long integer to store and use bit operator to manipulate. Definitely, bitset is more easy to use.

```cpp
#include <iostream>
#include <bitset>
#include <string>
using namespace std;

int main(int argc, char const *argv[])
{
    int val = 9;
    bitset<4> foo(val); // 1001
    bitset<4> bar("0011"); // 0011
    bitset<4> baz(0xf);  // 1111
    cout << foo << endl;
    cout << bar << endl;
    cout << baz << endl;

    cout << "calculation" << endl;
    cout << (foo & bar) << endl; // 0001
    cout << (foo | bar) << endl; // 1011
    cout << (foo ^ bar) << endl; // 1010
    cout << "foo = " << (foo |= bar) << endl; // foo = 1011

    // foo = 1011
    // foo[0] = 1; foo[2] = 1; foo[3] = 0; foo[4] = 1;
    for (int i = 0; i < 4; ++i)
    {
        cout << foo[i] << ' ';
    }
    cout << endl;
}
```
