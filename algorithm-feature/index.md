# Algorithm feature in c++ STL


# **See all algorithm [click here]({{<ref "posts/all-algorithm.md">}})**

## Mutating and Non-mutating algorithms

### Mutating algorithms

Mutating algorithms means this algorithm will change the content that iterator pointed to. Like copy, swap, replace, fill, remove, permutation, partition, random shuffling and sort.

If your give these algorithms a const iterator, only error will be returned.

```cpp
#include <iostream>
#include <vector>
using namespace std;

int main(int argc, char const *argv[])
{
    std::vector<int> iv = {22,30,30,17,33,40,17,23,22,12,20};

    vector<int>::iterator ib = iv.begin();
    vector<int>::iterator ie = iv.end();

    sort(ib,ie); //works

    for (std::vector<int>::iterator i = iv.begin(); i != iv.end(); ++i)
    {
        cout << *i << ' ';
    }
    cout << endl;

    // vector<int>::const_iterator ib = iv.begin();
    // vector<int>::const_iterator ie = iv.end();

    // sort(ib,ie); // error
    return 0;
}
```

### Non-mutating algorithm

Algorithm not change any element that iterator pointed to. Like: find, search, for_each, count, equal_mismatch, max, min.

Some algorithms have functor like for_each to change element.

```cpp
#include <iostream>
#include <vector>
using namespace std;
template <typename T>
struct add
{
    int temp = 0;
    add(){};
    add(int t): temp(t){};
    void operator () (T& x) const{
        x += temp;
    }
};

int main(int argc, char const *argv[])
{
    std::vector<int> iv = {22,30,30,17,33,40,17,23,22,12,20};

    for_each(iv.begin(), iv.end(), add<int>(100));

    for (std::vector<int>::iterator i = iv.begin(); i != iv.end(); ++i)
    {
        cout << *i << ' ';
    }
    cout << endl;
}
```

## General form in STL algorithm

### [first, last)

STL usually use open-close range which is [first, last). The range is from first to last(not include last).

The benefit is that if function stop at last position, you this function is end. For example, find() return a iterator which point to last position, that means not find the target value. You don't need null to represent without finding.

### iterator

Each algorithm need different type and is Backward compatible.

### different type

That may have some different version for one function.

Some may need a functor. like, find and find_if. Usually, it appear on some function which need comparison.

For mutating algorithm, normally have two version. One is in-place and another is copy. like replace and replace_if.

