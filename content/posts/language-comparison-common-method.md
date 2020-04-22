---
title: Common method comparison - c++ & java
date: 2019-07-12
author: Haolin Yang
categories: ["Language-comparison"]
tags:
    - c++
    - java
---

## Sort

### C++

For c++, here is [official document](http://www.cplusplus.com/reference/algorithm/sort/?kw=sort)

#### sort()

This method sorts elements in the range [first, last).

Result is in ascending order by deflaut.

Introsort.

```cpp
// sort algorithm example
#include <iostream>     // std::cout
#include <algorithm>    // std::sort
#include <vector>       // std::vector

bool myfunction (int i,int j) { return (i>j); }

int main () {
  int myints[] = {32,71,12,45,26,80,53,33};
  std::vector<int> myvector (myints, myints+8); // 32 71 12 45 26 80 53 33

  // using default comparison (operator <):
  std::sort (myvector.begin(), myvector.begin()+4); //(12 32 45 71)26 80 53 33

  // using function as comp
  std::sort (myvector.begin(), myvector.end(), myfunction); //80 71 53 45 33 32 26 12

  // print out content:
  std::cout << "myvector contains:";
  for (std::vector<int>::iterator it=myvector.begin(); it!=myvector.end(); ++it)
    std::cout << ' ' << *it;
  std::cout << '\n';
  return 0;
}
```

On average, linearithmic in the distance between first and last: Performs approximately N\*log<sub>2</sub>N

#### stable_sort()

`sort()` is **unstable**. However, **_[`stable_sort()`](http://www.cplusplus.com/reference/algorithm/stable_sort/)_** preserves the relative order of the elements with equivalent value.

If enough extra memory is available, linearithmic in the distance between first and last: Performs up to N\*log<sub>2</sub>(N) element comparisons (where N is this distance), and up to that many element moves.

Otherwise, polyloglinear in that distance: Performs up to N\*log<sub>2</sub><sup>2</sup>(N) element comparisons, and up to that many element swaps.

#### partial_sort()

`partial_sort()` sort first several elements while the remaining elements are left without any specific order.

```c++
int main(int argc, char const *argv[])
{
    vector<int> myvector = {32,71,12,45,26,80,53,33};

    partial_sort(myvector.begin(), myvector.begin() + 4, myvector.end());
    //(12 26 32 33 71) 80 53 45
    for(int i : myvector){
        cout << i << " ";
    }
    cout << endl;
}
```

---

### Java

sort(), primitive type and object type. parallelSort().collection.sort()

[Summary from CSDN](https://blog.csdn.net/whp1473/article/details/79678974)

#### Array.sort()

Package: java.util.Arrays;

Sorts the specified array into ascending numerical order.

For **primitive type**, The sorting algorithm is a **[Dual-Pivot Quicksort](https://www.jianshu.com/p/2c6f79e8ce6e)**([Orignal source](https://arxiv.org/pdf/1511.01138.pdf)) by Vladimir Yaroslavskiy, Jon Bentley, and Joshua Bloch. This algorithm offers **O(n log(n))** performance on many data sets that cause other quicksorts to degrade to quadratic performance, and is typically faster than traditional (one-pivot) Quicksort implementations. This quicksort is **unstable**.

For **object type**, the sorting algorithm is **Timsort** which is combined character of merge sort and selection sort([wiki](https://en.wikipedia.org/wiki/Timsort)). This is a **stable** sort algorithm.

##### Primitive type

`public static void sort​(int[] a);`

```java
import java.util.Arrays;
public class test{
    public static void main(String[] args) {
        int[] test1 = {6,5,4,3,2,1};
        int[] test2 = {6,5,4,3,2,1};
        Arrays.sort(test1);
        Arrays.sort(test2, 0, 3);
        for (int i : test1) {
            System.out.print(i + " ");
        }
        System.out.println(); //1 2 3 4 5 6
        for (int i : test2) {
            System.out.print(i + " ");
        }
        System.out.println(); //(4 5 6) 3 2 1
    }
}
```

##### Object type

`public static void sort​(Object[] a)`

`public static void sort​(Object[] a, int fromIndex, int toIndex)`

`public static <T> void sort​(T[] a, Comparator<? super T> c)`

`public static <T> void sort​(T[] a, int fromIndex, int toIndex, Comparator<? super T> c)`

##### Arrays.parallelSort()

-   This is a stable sort algorithm.

-   Only if the size of array is larger than _MIN_ARRAY_SORT_GRAN_, algorithm can use multi-thread. (MIN_ARRAY_SORT_GRAN is 1<<13, that is 8192, in source code.)

\*The sorting algorithm is a parallel sort-merge that breaks the array into sub-arrays that are themselves sorted and then merged.([JavaDoc](<https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/util/Arrays.html#parallelSort(int%5B%5D)>))

#### Container

```java
import java.util.Collections;
import java.util.Comparator;
import java.util.ArrayList;

public class test{
    public static void main(String[] args) {
        ArrayList<Integer> test1 = new ArrayList<Integer>(Arrays.asList(9,3,2,1,8,7,6,5,4));
        Comparator<Integer> reverseComparator = Collections.reverseOrder();
        Collections.sort(test1,reverseComparator);
        for (int i : test1) {
            System.out.print(i + " ");
        }
        System.out.println(); //9 8 7 6 5 4 3 2 1
    }
}
```
