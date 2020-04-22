# Container in c++


## Classification

-   Sequence container
    -   array (build in)
    -   [vector](#vector)
    -   [heap](#heap)
    -   [priority queue](#priorityqueue)
    -   [list](#list)
    -   slist (not standard)
    -   [deque](#deque)
    -   [stack](#stack) (adopter)
    -   [queue](#queue) (adopter)
-   Associative container
    -   [RB-tree](#rb-tree) (not public)
    -   [set](#set)
    -   [map](#map)
    -   multiset
    -   multemap
    -   hashtable (not standard)
    -   hash_set (not standard)
    -   hash_map (not standard)
    -   hash_multimap (not standard)
    -   hash_multiset (not standard)

Associative container have a key-value pair. It do not have back and front so they never have push_back, pop_back.

## Vector

This is similar with grow array. Vector use sequential space.

### insert(position, n, x)

![insert1](/images/2019-7-31-containers/insert1.png)
![insert2](/images/2019-7-31-containers/insert2.png)
![insert3](/images/2019-7-31-containers/insert3.png)

When the number of element from position to end is bigger than the number of new element, move directly may cause overlap.

### vector\<bool\>

vector\<bool\> is not array of boolean type data. It actually convert to bit array. Each bit will represent a bool value.

---

## List

Actually, list is a circular double linked list.

Here is proof that list have a circular:

```cpp
#include <iostream>
#include <list>
using namespace std;

int main(int argc, char const *argv[])
{
    list<int> ml = {1,2,3,4,5};

    cout << boolalpha;
    cout << ((++ml.end()) == (ml.begin())) << endl; // true
    //      the next of end is begin.
    return 0;
}
```

List have an empty node which end() point to. The next of this empty node is begin and the previous of begin is the empty node.

{{< mermaid >}}
graph TD;
    begin_node_0 --> node_1;
    node_1 --> begin_node_0;
    node_1 --> node_2;
    node_2 --> node_1;
    node_2 --> end_node_empty;
    end_node_empty --> node_2;
    end_node_empty --> begin_node_0;
    begin_node_0 --> end_node_empty
{{< /mermaid >}}

### transfer()

transfer() can move some element in specific range*( [first, last) )* to a specific location.

It is a basic function to move element in list and foundation of other complicated function like sort(), reverse(), splice().

```cpp
void transfer(iterator position, iterator first, iterator last) {
    if (position != last) {
       (*(link_type((*last.node).prev))).next = position.node; // (1)
       (*(link_type((*first.node).prev))).next = last.node; // (2)
       (*(link_type((*position.node).prev))).next = first.node; // (3)
       link_type tmp = link_type((*position.node).prev); // (4)
       (*position.node).prev = (*last.node).prev; // (5)
       (*last.node).prev = (*first.node).prev; // (6)
       (*first.node).prev = tmp; // (7)
    }
}
```

![transfer](/images/2019-7-31-containers/transfer.png)

### sort()

list have it own sort algorithm. List cannot use std::sort() because this function need RandomAccessIterator instead of BidirectionalIterator.

This algorithm is O(nlogn). It roughly a merge sort.
This [**website**](https://blog.csdn.net/qq_31720329/article/details/85535787) has a sample show the algorithm step by step.

But STL sort algorithm is better.
![sort list](/images/2019-7-31-containers/sort_list.png)

---

## Deque

Deque is a continuous linear space. **Deque can insert and remove element at begin and end**. Technically, vector has same function but is inefficient.

Deque do not have capacity, therefore push and pop on back and front in constant time.

Deque provide Random Access Iterator but it iterator is not same with vector and very complicated. If want **sort** deque, copy to vector, sort and copy back.

When deque space has been filled, it will connect a continuous space. Therefore, deque use separate continuous linear space.

Deque structure:
![deque](/images/2019-7-31-containers/map.png)

If 20 integer in a deque, the iterator is:
![dequeIterator](/images/2019-7-31-containers/map_iterator.png)

---

## Stack

Stack is deque which close one end. STL design stack base on deque, therefore stack is not classified as container but classified as adopter.

FILO

**NO iterator**

Can be implemented by list.

---

## Queue

Similar thing with stack. FIFO.

**NO iterator**

Can be implemented by list.

---

## Heap

Heap is not a container in STL but it is the basement of priority_queue.

Heap is a complete binary tree and array can store all elements in heap. However, we want to change the capacity of array. We can use a vector and some algorithm to make up a heap.

**No iterator**

### push_heap

Add one element in heap
![push_heap](/images/2019-7-31-containers/push_heap.png)

### pop_heap

Pop one element
![pop_heap](/images/2019-7-31-containers/pop_heap.png)

push and pop is not swap element. It actually manipulate the location.

Because pop the an element and put it at the end of array, you can adjust the rest of elements by make_heap.

```cpp
template <class RandomAccessIterator, class Distance, class T> void __adjust_heap(RandomAccessIterator first, Distance holeIndex,
                 Distance len, T value) {
    Distance topIndex = holeIndex;
    Distance secondChild = 2 * holeIndex + 2; // 洞節點之右子節點
    while (secondChild < len) {
    // 比較洞節點之左右兩個子值，然後以 secondChild 代表較大子節點。
        if (*(first + secondChild) < *(first + (secondChild - 1)))
            secondChild--;
            // Percolate down:令較大子值為洞值，再令洞號下移至較大子節點處。
            *(first + holeIndex) = *(first + secondChild);
            holeIndex = secondChild;
            // 找出新洞節點的右子節點
            secondChild = 2 * (secondChild + 1);
    }
    if (secondChild == len) { // 沒有右子節點，只有左子節點
        // Percolate down:令左子值為洞值，再令洞號下移至左子節點處。
        *(first + holeIndex) = *(first + (secondChild - 1)); holeIndex = secondChild - 1;
    }
    // 將欲調整值填入目前的洞號內。注意，此時肯定滿足次序特性。
    // 依侯捷之見，下面直接改為 *(first + holeIndex) = value; 應該可以。
    __push_heap(first, holeIndex, topIndex, value);
}
```

### sort_heap

After pop a element, will stay at the end of array. After pop all element, heap must empty and array is sorted.

![sort_heap1](/images/2019-7-31-containers/sort_heap1.png)
![sort_heap2](/images/2019-7-31-containers/sort_heap2.png)

### make_heap

Make a range of elements into heap.

### usage

```cpp
#include <iostream>
#include <vector>
#include <algorithm> // heap
using namespace std;

int main(int argc, char const *argv[])
{
    int ia[10] = {0,1,2,3,4,5,6,7,8,9};
    vector<int> iv(ia, ia+10);

    make_heap(iv.begin(), iv.end()); // 9 8 6 7 4 5 2 0 3 1

    pop_heap(iv.begin(), iv.end()); //  8 7 6 3 4 5 2 0 1 9

    sort_heap(iv.begin(), iv.end()-1); // 0 1 2 3 4 5 6 7 8 9

    for(int i: iv){
        cout << ' ' << i;
    }
    cout << endl;

    // Base on array
    make_heap(ia, ia + 10); // 9 8 6 7 4 5 2 0 3 1
    for(int i: ia){
        cout << ' ' << i;
    }
    cout << endl;
    return 0;
}
```

---

## Priority_queue

priority_queue is adopter with heap algorithm.

**No iterator**

Vector + make_heap

---

## Forward_list

Forward_list is a single linked list.

Forward iterator

### insert_after() & erase_after()

In c++, insert() and erase() will add or remove element before the position your given. But it is more cost that insert or erase in a single linked list. Therefore, forward_list only provide insert_after() and erase_after() which you can add or remove element after the position your provided.

### push_front() & pop_front()

Unlike queue and priority_queue only provide push and pop at end, forward_list just allow you push and pop at beginning because it is a single linked list.

### No size()

Forward_list not provide size().

## RB tree

See another post: [RB Tree]({{< ref "posts/RB-tree.md" >}})

## Set

Set only have key.(Or key and value is same.)

Set not allow duplication.

Set are base on RB tree.

The iterator of set is const_iterator. You cannot modify any element through iterator.

STL::find() is work. But better using set::find().

## Map

Map have key-value pair.

Map not allow duplication on key.

Map are base on RB tree.

You can modify the value by iterator bu not the key. Therefore, it neither a const_iterator nor mutable_iterator.

STL::find() is work. But better using map::find().

Map could use operator[] to access by providing a key. But the problem is that if the key your provided not exist in map, that will insert this key. Therefore, if you want to modify value but not add new key-value pair, you can use map.at(). If you just want to know this exist or not, you can use map.count() which will return 1 or 0.

```cpp
#include <iostream>
#include <map>
using namespace std;

int main(int argc, char const *argv[])
{
    map<char, int> my_map;

    my_map['b'] = 100;
    my_map['a'] = 200;
    my_map['c'] = 300;

    my_map['d'] == 100 ? cout << "find" << endl : cout << "not find" << endl;

    my_map.count('e') ? cout << "find" << endl : cout << "not find" << endl;

    for(auto i: my_map){
        cout << i.first << " " << i.second << endl;
    }
}
```

---

## multimap & multiset

Could have several key.

---

## HashTable

### Linear probing

### Quadratic probing

After find a collision, Change the hash function.

Multiplication is not good, especially i power 2.

> H<sub>i</sub> = H<sub>0</sub> + i<sup>2</sup>(mod M)
>
> H<sub>i+1</sub> = H<sub>0</sub> + (i+1)<sup>2</sup>(mod M)

But we can do:

> H<sub>i+1</sub> - H<sub>i</sub> = (i+1)<sup>2</sup>(mod M) - i<sup>2</sup>(mod M)
>
> H<sub>i+1</sub> - H<sub>i</sub> = (i+1)<sup>2</sup> - i<sup>2</sup>(mod M)
>
> H<sub>i+1</sub> - H<sub>i</sub> = 2i + 1 (mod M)
>
> H<sub>i+1</sub> = H<sub>i</sub> + 2i + 1 (mod M)

We can use left shift to multiple 2 which is a acceptable method.

### Separate chaining

C++ use separate chaining to achieve hash table.

In STL, hash table use a vector and linked-list (not list in STL).

![hashTable_iterator](/images/2019-7-31-containers/hashtable_iterator.png)

