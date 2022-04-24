# All algorithm in C++


## Content

- [Content](#content)
- [Algorithm Overview](#algorithm-overview)
- [Copy](#copy)
- [For each](#for-each)
- [Generation](#generation)
- [Heap](#heap)
- [Merge](#merge)
- [Move](#move)
- [Number](#number)
- [Partition](#partition)
- [Permutation](#permutation)
- [Remove](#remove)
- [Replace](#replace)
- [Reverse](#reverse)
- [rotate](#rotate)
- [Search](#search)
- [Set](#set)
- [Shuffle](#shuffle)
- [Sort](#sort)
- [Swap](#swap)
- [Test range](#test-range)
- [Unique](#unique)

## Algorithm Overview

**`*` --> new feature from C++11**

|             Algorithm Name              |                                                                       Usage                                                                        |    Mutating?    | Head File |                          Complexity                           |
| :-------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------: | :-------: | :-----------------------------------------------------------: |
|          [accumulate](#number)          |                                                             Accumulate values in range                                                             |        N        |  numeric  |                             O(n)                              |
|     [adjacent_difference](#number)      |                                          Compute adjacent difference of range and return to another place                                          |        N        |  numeric  |                             O(n)                              |
|        [adjacent_find](#search)         |                                                    Find first equal adjacent elements in range                                                     |        N        | algorithm |                             O(n)                              |
|         [all_of\*](#test-range)         |                                                      Test condition on all elements in range                                                       |        N        | algorithm |                             O(n)                              |
|         [any_of\*](#test-range)         |                                                  Test if any element in range fulfills condition                                                   |        N        | algorithm |                             O(n)                              |
|        [binary_search](#search)         |                                                      Test if value exists in sorted sequence                                                       |        N        | algorithm | On average O(logn + 2). On non-random-access iterator is O(n) |
|              [copy](#copy)              |                                                               Copy range of elements                                                               |     N(copy)     | algorithm |                             O(n)                              |
|         [copy_backward](#copy)          |                                                          Copy range of elements backward                                                           |     N(copy)     | algorithm |                             O(n)                              |
|           [copy_if\*](#copy)            |                                                           Copy certain elements of range                                                           |     N(copy)     | algorithm |                             O(n)                              |
|            [copy_n\*](#copy)            |                                                Copies the first n elements from the range beginning                                                |     N(copy)     | algorithm |                             O(n)                              |
|            [count](#number)             |                                                        Count appearances of value in range                                                         |        N        | algorithm |                             O(n)                              |
|           [count_if](#number)           |                                              Return number of elements in range satisfying condition                                               |        N        | algorithm |                             O(n)                              |
|          [equal](#test-range)           |                                                 Test whether the elements in two ranges are equal                                                  |        N        | algorithm |                             O(n)                              |
|         [equal_range](#search)          |                                                          Get sub range of equal elements                                                           |        N        | algorithm |    O(2logn + 1) for random access iterator, otherwise O(n)    |
|           [fill](#generation)           |                                                               Fill range with value                                                                |        Y        | algorithm |                             O(n)                              |
|          [fill_n](#generation)          |                                        Assigns val to the first n elements of the sequence pointed by first                                        |        Y        | algorithm |                             O(n)                              |
|             [find](#search)             |                                                          Find the first element in range                                                           |        N        | algorithm |                             O(n)                              |
|           [find_end](#search)           |                                                           Find last subsequence in range                                                           |        N        | algorithm |                         O(m\*(1+n-m))                         |
|        [find_first_of](#search)         |              Returns an iterator to the first element in the range [first1,last1) that matches any of the elements in [first2,last2)               |        N        | algorithm |                             O(nm)                             |
|           [find_if](#search)            |                                                 Find the first element in range in some condition                                                  |        N        | algorithm |                             O(n)                              |
|        [find_if_not\*](#search)         |                                                 Find the first element in range in some condition                                                  |        N        | algorithm |                             O(n)                              |
|          [for_each](#for-each)          |                                                              Apply function to range                                                               |        N        | algorithm |                             O(n)                              |
|         [generate](#generation)         |                          Assigns the value returned by successive calls to gen to the elements in the range [first,last)                           |        Y        | algorithm |                             O(n)                              |
|        [generate_n](#generation)        |                   Assigns the value returned by successive calls to gen to the first n elements of the sequence pointed by first                   |        Y        | algorithm |                             O(n)                              |
|         [includes](#test-range)         |                                              Test whether sorted range includes another sorted range                                               |        N        | algorithm |                             O(n)                              |
|        [inner_product](#number)         |                                                     Compute cumulative inner product of range                                                      |        N        |  numeric  |                             O(n)                              |
|         [inplace_merge](#merge)         |                                                          Merge consecutive sorted ranges                                                           |        Y        | algorithm |   O(n) if extra memory is available, otherwise is O(nlogn)    |
|             [iota](#number)             |                                                             Store increasing sequence                                                              |        Y        |  numeric  |                             O(n)                              |
|           [is_heap\*](#heap)            |                                                               Test if range is heap                                                                |        N        | algorithm |                             O(n)                              |
|        [is_heap_until\*](#heap)         |                                                       Find first element not in heap order.                                                        |        N        | algorithm |                             O(n)                              |
|     [is_partitioned\*](#partition)      |                                                         Test whether range is partitioned                                                          |        Y        | algorithm |                             O(n)                              |
|    [is_permutation\*](#permutation)     | Compares the elements in the range [first1,last1) with those in the range beginning at first2, and returns true if they just different permutation |        N        | algorithm |                             O(n)                              |
|          [is_sorted\*](#sort)           |                                                           Check whether range is sorted                                                            |        N        | algorithm |                             O(n)                              |
|       [is_sorted_until\*](#sort)        |                                                        Find first unsorted element in range                                                        |        N        | algorithm |                             O(n)                              |
|           [iter_swap](#swap)            |                                                      Swaps the elements pointed to by a and b                                                      |        Y        | algorithm |                             O(1)                              |
| [lexicographical_compare](#permutation) |                                                        Compare two range lexicographically.                                                        |        N        | algorithm |                             O(n)                              |
|          [lower_bond](#search)          |                                                           Return iterator to lower bound                                                           |        N        | algorithm |    O(logn + 1) for random access iterator, otherwise O(n)     |
|           [make_heap](#heap)            |                                                                Make heap from range                                                                |        Y        | algorithm |                             O(3n)                             |
|             [max](#number)              |                                       Returns the largest of a and b. If both are equivalent, a is returned.                                       |        N        | algorithm |                             O(1)                              |
|         [max_element](#number)          |                                                          Return largest element in range                                                           |        N        | algorithm |                             O(n)                              |
|             [merge](#merge)             |                                                                Merge sorted ranges                                                                 |        Y        | algorithm |                             O(n)                              |
|             [min](#number)              |                                      Returns the smallest of a and b. If both are equivalent, a is returned.                                       |        N        | algorithm |                             O(1)                              |
|           [minmax\*](#number)           |                                       Return smallest and largest elements from give 2 value or initializer                                        |        N        | algorithm |                             O(1)                              |
|       [minmax_element\*](#number)       |                                                   Return smallest and largest elements in range                                                    |        N        | algorithm |                             O(n)                              |
|         [min_element](#number)          |                                                          Return smallest element in range                                                          |        N        | algorithm |                             O(n)                              |
|           [mismatch](#search)           |                                                   Return first position where two ranges differ                                                    |        N        | algorithm |                             O(n)                              |
|             [move\*](#move)             |                                                               Move range of elements                                                               |        Y        | algorithm |                             O(n)                              |
|        [move_backward\*](#move)         |                                                          Move range of elements backward                                                           |        Y        | algorithm |                             O(n)                              |
|    [next_permutation](#permutation)     |                       Rearranges the elements in the range [first,last) into the next lexicographically greater permutation                        |        Y        | algorithm |                             O(n)                              |
|        [none_of\*](#test-range)         |                                                       Test if no elements fulfill condition                                                        |        N        | algorithm |                             O(n)                              |
|          [nth_element](#sort)           |                                           Find the nth element and put it the exact palce.(quick select)                                           |        Y        | algorithm |                              O()                              |
|          [partial_sort](#sort)          |                              Partially sort elements in range while the remaining elements are left without any order                              |        Y        | algorithm |                           O(mlogn)                            |
|       [partial_sort_copy](#sort)        |                                                           Copy and partially sort range                                                            | Y (if in-place) | algorithm |                           O(mlogn)                            |
|         [partial_sum](#number)          |                                             Compute partial sums of range and return to another place                                              |        N        |  numeric  |                             O(n)                              |
|         [partition](#partition)         |                         Partition range in two and the iterator returned points to the first element of the second group.                          |        Y        | algorithm |                             O(n)                              |
|     [partition_copy\*](#partition)      |                                                              Partition range into two                                                              |        N        | algorithm |                             O(n)                              |
|     [partition_point\*](#partition)     |                                  Get partition point and Returns an iterator to the first element in second part                                   |        N        | algorithm |                          O(logn + 2)                          |
|            [pop_heap](#heap)            |                                           Pop element from heap range. Range shrink and value is at end.                                           |        Y        | algorithm |                            O(logn)                            |
|    [prev_permutation](#permutation)     |                     Rearranges the elements in the range [first,last) into the previous lexicographically-ordered permutation.                     |        Y        | algorithm |                             O(n)                              |
|           [push_heap](#heap)            |                                                     Push element into heap range. Range extend                                                     |        Y        | algorithm |                            O(logn)                            |
|       [random_shuffle](#shuffle)        |                                                        Randomly rearrange elements in range                                                        |        Y        | algorithm |                             O(n)                              |
|            [remove](#remove)            |                                 Removed element equal to val and returns an iterator to the new end of that range.                                 |        Y        | algorithm |                             O(n)                              |
|         [remove_copy](#remove)          |                                                            Remove and copy to new place                                                            |        Y        | algorithm |                             O(n)                              |
|        [remove_copy_if](#remove)        |                                                        Remove in a given condition and copy                                                        |        Y        | algorithm |                             O(n)                              |
|          [remove_if](#remove)           |                                                            Remove in a given condition                                                             |        Y        | algorithm |                             O(n)                              |
|           [replace](#replace)           |                                       Assigns new_value to all the elements that compare equal to old_value                                        |        Y        | algorithm |                             O(n)                              |
|        [replace_copy](#replace)         |                                                                  Replace and copy                                                                  |        Y        | algorithm |                             O(n)                              |
|       [replace_copy_if](#replace)       |                                                       Replace in a given condition and copy                                                        |        Y        | algorithm |                             O(n)                              |
|         [replace_if](#replace)          |                                                            Replace in a given condition                                                            |        Y        | algorithm |                             O(n)                              |
|           [reverse](#reverse)           |                                            Reverses the order of the elements in the range [first,last)                                            |        Y        | algorithm |                             O(n)                              |
|        [reverse_copy](#reverse)         |                                              Copies the elements in [first,last) but in reverse order                                              |        Y        | algorithm |                             O(n)                              |
|            [rotate](#rotate)            |                                     Rotates the order of the elements and middle becomes the new first element                                     |        Y        | algorithm |                             O(n)                              |
|         [rotate_copy](#rotate)          |                                                                  Rotate and copy                                                                   |        Y        | algorithm |                             O(n)                              |
|            [search](#search)            |                                                            Search range for subsequence                                                            |        N        | algorithm |                            O(n\*m)                            |
|           [search_n](#search)           |                                                        Search range for n continue elements                                                        |        N        | algorithm |                             O(n)                              |
|         [set_difference](#set)          |                                                          Difference of two sorted ranges                                                           |     N(copy)     | algorithm |                          O(2(n+m)-1)                          |
|        [set_intersection](#set)         |                                                         Intersection of two sorted ranges                                                          |     N(copy)     | algorithm |                          O(2(n+m)-1)                          |
|    [set_symmetric_difference](#set)     |                                                     Symmetric difference of two sorted ranges                                                      |     N(copy)     | algorithm |                          O(2(n+m)-1)                          |
|            [set_union](#set)            |                                                             Union of two sorted ranges                                                             |     N(copy)     | algorithm |                          O(2(n+m)-1)                          |
|          [shuffle\*](#shuffle)          |                                                Randomly rearrange elements in range using generator                                                |        Y        | algorithm |                             O(n)                              |
|              [sort](#sort)              |                                                               Sort elements in range                                                               |        Y        | algorithm |                           O(nlogn)                            |
|           [sort_heap](#heap)            |                                                               Sort elements of heap                                                                |        Y        | algorithm |                           O(nlogn)                            |
|     [stable_partition](#partition)      |                                                      Partition range in two - stable ordering                                                      |        Y        | algorithm |          O(n) with enough space. Otherwise O(nlogn)           |
|          [stable_sort](#sort)           |                                                   Sort elements preserving order of equivalents                                                    |        Y        | algorithm |      O(nlogn) with enough space, otherwise O(nlognlogn)       |
|              [swap](#swap)              |                                                          Exchanges the values of a and b                                                           |        Y        | algorithm |                             O(1)                              |
|          [swap_ranges](#swap)           |                                                             Exchanges a range of value                                                             |        Y        | algorithm |                             O(n)                              |
|           [transform](#move)            |                                                                  Transform range                                                                   |        Y        | algorithm |                             O(n)                              |
|            [unique](#unique)            |                                                       Remove consecutive duplicates in range                                                       |        Y        | algorithm |                             O(n)                              |
|         [unique_copy](#unique)          |                                                           Copy range removing duplicates                                                           |        Y        | algorithm |                             O(n)                              |
|          [upper_bond](#search)          |                 Return iterator to upper bound. Since **[first, last)**, the value pointed by the iterator must larger than _val_                  |        N        | algorithm |    O(logn + 1) for random access iterator, otherwise O(n)     |

## Copy

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main(int argc, char const *argv[])
{
	vector<int> iv = {1,2,3,4,5,6};

	vector<int> iv2(6);
	copy(iv.begin(), iv.end(), iv2.begin());
	// iv2: 1 2 3 4 5 6

	vector<int> iv3(3);
	copy_if(iv.begin(), iv.end(), iv3.begin(), [](int a){return a % 2 == 0;});
	// iv3: 2 4 6

	vector<int> iv4(5);
	copy_n(iv.begin(), 5, iv4.begin());
	// iv4: 1 2 3 4 5 6

	vector<int> iv5(6);
	copy_backward(iv.begin(), iv.end(), iv5.end());
	// iv5: 1 2 3 4 5 6

	return 0;
}
```

[Back to top](#content)

## For each

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main(int argc, char const *argv[])
{
	vector<int> iv = {1,2,3,4,5,6};
	for_each(iv.begin(), iv.end(), [](int x){cout << x << " ";});
	// cout:1 2 3 4 5 6
	return 0;
}
```

[Back to top](#content)

## Generation

fill fill_n generate generate_n

```cpp
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

struct StartFrom
{
	int start;
	StartFrom(int s):start(s){};
	int operator() (){return start++;};
};

int main(int argc, char const *argv[])
{
	vector<int> iv1(8); //iv1: 0 0 0 0 0 0 0 0
	fill(iv1.begin(), iv1.begin()+4, 1);
	//iv1: 1 1 1 1 0 0 0 0
	fill_n(iv1.begin()+4, 3, 2);
	//iv1: 1 1 1 1 2 2 2 0

	vector<int> iv2(8); //iv2: 0 0 0 0 0 0 0 0

	StartFrom s1(5);
	generate(iv2.begin(), iv2.begin()+4, s1);
	//iv2: 5 6 7 8 0 0 0 0
	StartFrom s2(10);
	generate_n(iv2.begin()+4, 2, s2);
	//iv2: 5 6 7 8 10 11 0 0

	return 0;
}
```

[Back to top](#content)

## Heap

Heap algorithm need to cooperate with other container usually vector or array.

More detail about heap: [Here]({{< relref "posts/containers.md#heap" >}})

```cpp
#include <iostream>
#include <vector>
#include <algorithm> // heap
#include <functional>
using namespace std;

int main(int argc, char const *argv[]){
    int ia[10] = {0,1,2,3,4,5,6,7,8,9};
    vector<int> iv(ia, ia+10);

    //is_heap
    cout << boolalpha;
    cout << is_heap(iv.begin(), iv.end()) << endl; // false

    // make_heap
    make_heap(iv.begin(), iv.end(), greater<int>()); // 0 1 2 3 4 5 6 7 8 9
    cout << is_heap(iv.begin(), iv.end(), greater<int>()) << endl; // true

    make_heap(iv.begin(), iv.end()); // 9 8 6 7 4 5 2 0 3 1
    cout << is_heap(iv.begin(), iv.end()) << endl; // true

    // pop_heap
    pop_heap(iv.begin(), iv.end()); // 8 7 6 3 4 5 2 0 1 9
    cout << iv.back() << endl; // 9
    iv.pop_back();

    // push_heap
    iv.push_back(99);
    push_heap(iv.begin(), iv.end()); // 99 8 6 3 7 5 2 0 1 4

    // sort_heap
    sort_heap(iv.begin(), iv.end()); // 0 1 2 3 4 5 6 7 8 99

    // Base on array
    make_heap(ia, ia + 10); // 9 8 6 7 4 5 2 0 3 1
    pop_heap(ia, ia + 10);

    // is_heap_until
    // ia: 8 7 6 3 4 5 2 0 1 9
    auto iter = is_heap_until(ia, ia + 10);
    cout << *iter << endl; // 9
    return 0;
}
```

[Back to top](#content)

## Merge

Sort first!!

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main(int argc, char const *argv[])
{
	// merge
	vector<int> iv1 = {5,10,15,20,25};
	vector<int> iv2 = {50,40,30,20,10};
	vector<int> res1(10);
	sort(iv1.begin(), iv1.end());
	sort(iv2.begin(), iv2.end());

	merge(iv1.begin(), iv1.end(), iv2.begin(), iv2.end(), res1.begin());
	// res: 5 10 10 15 20 20 25 30 40 50

	// inplace_merge
	vector<int> res2(10);
	auto it = copy(iv1.begin(), iv1.end(), res2.begin());
	copy(iv2.begin(), iv2.end(), it);
	// res2: 5 10 15 20 25 10 20 30 40 50

	inplace_merge(res2.begin(), res2.begin() + 5, res2.end());
	// res2: 5 10 10 15 20 20 25 30 40 50

	return 0;
}
```

[Back to top](#content)

## Move

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
using namespace std;

int main(int argc, char const *argv[])
{
	vector<string> foo = {"air","water","fire","earth"};
	vector<string> bar (4);

	// move
	move(foo.begin(), foo.end(), bar.begin());
	// foo:                     // (for empty string)
	// bar: air water fire earth

	foo = move(bar);
	// foo: air water fire earth
	// bar:    // nothing here.

	// move_backward
	bar.resize(4);
	move_backward(foo.begin(), foo.end(), bar.end());
	// foo:                     // (for empty string)
	// bar: air water fire earth

	// transform
	vector<int> iv1 = {10,20,30,40,50,60};
	vector<int> iv2 = {1,2,3,4,5,6};

	transform(iv1.begin(), iv1.end(), iv2.begin(), [](int a){return ++a;});
	// iv1 + 1 and copy to iv2
	// iv1: 10 20 30 40 50 60
	// iv2: 11 21 31 41 51 61

	transform(iv1.begin(), iv1.end(), iv2.begin(), iv2.begin(), plus<int>());
	// range: ^    ....    ^; opStart: ^; tansform to: ^
	// iv1: 10 20 30 40 50 60
	// iv2: 21 41 61 81 101 121

	return 0;
}
```

[Back to top](#content)

## Number

**\<numberic\>:** iota accumulate inner_product partial_sum adjacent_differenet

**\<algorithm\>:** max min max_element min_element minmax count count_if

iota just make a increasing sequence start from a given number.

```cpp
#include <iostream>
#include <vector>
#include <numeric>
#include <algorithm>
#include <functional>
#include <utility>
using namespace std;

int main(int argc, char const *argv[])
{
	vector<int> iv(5);

	// iota
	iota(iv.begin(), iv.end(), 1); // 1 2 3 4 5

	// count
	cout << count(iv.begin(), iv.end(), 2) << endl; // 1

	// count_if
	cout << count_if(iv.begin(), iv.end(), [](int a){return a % 2 == 1;}) << endl; // 3

	// accumulate
	cout << accumulate(iv.begin(), iv.end(), 0) << endl; // 15
	// init + *iv + *(iv+1) + ...

	cout << accumulate(iv.begin(), iv.end(), 0, minus<int>()) << endl; // -15
	// init - *iv - *(iv+1) - ...

	// inner_product

	vector<int> iv1 = {10, 20, 30};
	vector<int> iv2 = {1, 2, 3};

	cout << inner_product(iv1.begin(), iv1.end(), iv2.begin(), 0) << endl;
	// 0 + 10 * 1 + 20 * 2 + 30 * 3 = 140

	cout << inner_product(iv1.begin(), iv1.end(), iv2.begin(), 0,
		minus<int>(), divides<int>()) << endl;
	// 0 - 10 / 1 - 20 / 2 - 30 / 3 = -30

	// partial_sum
	vector<int> res(5);
	partial_sum(iv.begin(), iv.end(), res.begin());
	// iv: 1 2 3 4 5
	// res: 1 3 6 10 15

	partial_sum(iv.begin(), iv.end(),res.begin(), minus<int>());
	// iv: 1 2 3 4 5
	// res: 1 -1 -4 -8 -13

	adjacent_difference(iv.begin(), iv.end(), res.begin());
	// iv: 1 2 3 4 5
	// res: 1 1 1 1 1

	adjacent_difference(iv.begin(), iv.end(), res.begin(), multiplies<int>());
	// iv: 1 2 3 4 5
	// res: 1 2 6 12 20

	// adjacent_difference calculate every two adjacent elements
	// y0 = x0
	// y1 = x1 - x0
	// y2 = x2 - x1
	// y3 = x3 - x2
	// y4 = x4 - x3  ...

	// partial_sum calculate all elements b
	// y0 = x0
	// y1 = x0 + x1
	// y2 = x0 + x1 + x2
	// y3 = x0 + x1 + x2 + x3
	// y4 = x0 + x1 + x2 + x3 + x4  ...

	// max
	cout << max(1, 3) << endl; // 3
	cout << max(2, 2) << endl; // 2

	// max element
	auto max_e = max_element(iv.begin(), iv.end());
	cout << *max_e << endl; // 5

	// min
	cout << min(1, 3) << endl; // 1
	cout << min(2, 2) << endl; // 2

	// min element
	auto min_e = min_element(iv.begin(), iv.end());
	cout << *min_e << endl; // 1

	// minmax
	pair<int, int> min_max = minmax({5,2,3,1,4});
	min_max = minmax(1,5);
	cout << min_max.first << " " << min_max.second << endl; // 1 5

	// minmax_element
	pair<vector<int>::iterator, vector<int>::iterator>
		min_max_element = minmax_element(iv.begin(), iv.end());
	cout << "max= "<< *min_max_element.first <<
		" at position " << min_max_element.first - iv.begin() << endl;
	// max= 1 at position 0
	cout << "min= "<< *min_max_element.first <<
		" at position " << min_max_element.second - iv.begin() << endl;
	// min= 1 at position 4

	return 0;
}
```

[Back to top](#content)

## Partition

is_partitioned partition stable_partition partition_copy partition_point

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>
using namespace std;

bool isOdd(int n){return (n % 2 == 1);}

int main(int argc, char const *argv[])
{
	vector<int> iv(8);
	iota(iv.begin(), iv.end(), 1);
	vector<int>::iterator bond;

	// partition
	bond = partition(iv.begin(), iv.end(), isOdd); // iv: 1 7 3 5 4 6 2 8

	cout << *bond << endl; // 4

	for (vector<int>::iterator i = iv.begin(); i != bond; ++i){
		cout << *i << " ";
	} cout << endl; // 1 7 3 5

	for (vector<int>::iterator i = bond; i != iv.end(); ++i){
		cout << *i << " ";
	} cout << endl; // 4 6 2 8


	// stable_partition
	iota(iv.begin(), iv.end(), 1); // iv: 1 2 3 4 5 6 7 8

	bond = stable_partition(iv.begin(), iv.end(), isOdd);
	// iv: 1 3 5 7 2 4 6 8

	cout << *bond << endl; // 2

	for (vector<int>::iterator i = iv.begin(); i != bond; ++i){
		cout << *i << " ";
	} cout << endl; // 1 3 5 7

	for (vector<int>::iterator i = bond; i != iv.end(); ++i){
		cout << *i << " ";
	} cout << endl; // 2 4 6 8


	// is_partitioned
	cout << boolalpha;
	// iv: 1 3 5 7 2 4 6 8
	cout << is_partitioned(iv.begin(), iv.end(), isOdd) << endl; // true

	iota(iv.begin(), iv.end(), 1);

	// iv: 1 2 3 4 5 6 7 8
	cout << is_partitioned(iv.begin(), iv.end(), isOdd) << endl; // false


	// partition_copy
	// iv: 1 2 3 4 5 6 7 8
	vector<int> even, odd;
	odd.resize(4); even.resize(4);

	partition_copy(iv.begin(), iv.end(), odd.begin(), even.begin(), isOdd);

	for (vector<int>::iterator i = odd.begin(); i != odd.end(); ++i){
		cout << *i << " ";
	} cout << endl; // 1 3 5 7

	for (vector<int>::iterator i = even.begin(); i != even.end(); ++i){
		cout << *i << " ";
	} cout << endl; // 2 4 6 8


	// partition_point
	partition(iv.begin(), iv.end(), isOdd); // iv: 1 7 3 5 4 6 2 8
	bond = partition_point(iv.begin(), iv.end(), isOdd);

	cout << *bond << endl; // 4

	return 0;
}
```

[Back to top](#content)

## Permutation

lexicographical_compare: Returns true if the range [first1,last1) compares lexicographically less than the range [first2,last2).

next_permutation: next lexicographically-ordered permutation. Return false when input is already the greatest lexicographic permutation.

prev_permutation: previous lexicographically-ordered permutation. Return false when input is already a ascending permutation.

THis code explain how to find next permutation(prev_permutation with same logic).

```cpp
template<class BidirIt> //BidirIt binary direction iterator
bool next_permutation(BidirIt first, BidirIt last) // [first, last)
{
    if (first == last) return false; //0 element
    BidirIt i = last;
    if (first == --i) return false; //one element

    while (true) {
        BidirIt i1, i2;
        i1 = i; // i1 is last element of ascending sequence
        if (*--i < *i1) { // i is prev of i1.
            i2 = last;
            while (*i > *--i2) // i ≤ i1 ≥ i2 // i2 will be last number bigger than i
                ;
            std::iter_swap(i, i2); // i2 should at i's position in the next permutation.
            std::reverse(i1, last); // make sure seq behind i1 become ascending.
            return true;
        }
        if (i == first) { // the whole sequence is descending.
            std::reverse(first, last);
            return false;
        }
    }
}
```

If you want go over all permutation, **sort** first.

```cpp
#include <iostream>     // std::cout
#include <algorithm>    // std::next_permutation, std::sort
#include <string>
#include <vector>
using namespace std;

int main () {
	// next_permutation
	vector<int> myints = {1,2,3};
	sort(myints.begin(), myints.end()); // 1 2 3

	do {
	std::cout << myints[0] << ' ' << myints[1] << ' ' << myints[2] << '\n';
	} while ( next_permutation(myints.begin(), myints.end()) );

	std::cout << "After loop: " << myints[0] << ' ' << myints[1] << ' ' << myints[2] << '\n';

	// prev_permutation
	reverse(myints.begin(), myints.end()); // 3 2 1

	do {
	std::cout << myints[0] << ' ' << myints[1] << ' ' << myints[2] << '\n';
	} while ( prev_permutation(myints.begin(), myints.end()) );

	std::cout << "After loop: " << myints[0] << ' ' << myints[1] << ' ' << myints[2] << '\n';

	// lexicographical_compare
	string myStr = "abc"; // string is also work
	next_permutation(myStr.begin(), myStr.end());
	cout << myStr << endl; // acb

	string myStr2 = "cba";
	cout << boolalpha;
	cout << lexicographical_compare(myStr.begin(), myStr.end(), myStr2.begin(), myStr2.end()) << endl;
	// acb < cba
	// true

	// is_permutation
	cout << is_permutation(myStr.begin(), myStr.end(), myStr2.begin()) << endl;
	// true

	return 0;
}
```

[Back to top](#content)

## Remove

```cpp
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main(int argc, char const *argv[])
{
	vector<int> iv = {10,20,30,30,20,10,10,20};

	//remove
	vector<int>::iterator newEnd = remove(iv.begin(), iv.end(), 20);
	//iv: 10 30 30 10 10 10 10 20
	//           newEnd: ^

	for (vector<int>::iterator i = iv.begin(); i != newEnd; ++i)
	{
		cout << *i << " ";
	}cout << endl; // res: 10 30 30 10 10

	vector<int> iv2 = {10,20,30,30,20,10,10,20};
	vector<int> iv3(5);

	// remove_copy
	remove_copy(iv2.begin(), iv2.end(), iv3.begin(), 20);
	// iv3: 10 30 30 10 10

	// remove_if
	vector<int> iv4 = {1,2,3,4,5,6,7,8,9};
	newEnd = remove_if(iv4.begin(), iv4.end(), [](int a){ return a % 2 == 0;});

	for (vector<int>::iterator i = iv4.begin(); i != newEnd; ++i)
	{
		cout << *i << " ";
	}cout << endl; // res: 1 3 5 7 9
	// iv4: 1 3 5 7 9 6 7 8 9

	// remove_copy_if
	vector<int> iv5 = {1,2,3,4,5,6,7,8,9};
	vector<int> iv6(5);
	remove_copy_if(iv4.begin(), iv4.end(), iv6.begin() , [](int a){ return a % 2 == 0;});
	// iv6: 1 3 5 7 9

	return 0;
}
```

[Back to top](#content)

## Replace

```cpp
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main(int argc, char const *argv[])
{
	vector<int> iv = {10, 20, 30, 30, 20, 10, 10, 20};

	// replace
	replace(iv.begin(), iv.end(), 20, 99);
	// iv: 10 99 30 30 99 10 10 99

	// replace_copy
	vector<int> iv2(8);
	replace_copy(iv.begin(), iv.end(), iv2.begin(), 99, 1);
	// iv2: 10 99 30 30 99 10 10 99

	// replace_if
	replace_if(iv.begin(), iv.end(), [](int a){return a % 2 == 0;}, 0);
	// iv: 0 99 0 0 99 0 0 99

	// replace_copy_if
	vector<int> iv3(8);
	replace_copy_if(iv.begin(), iv.end(), iv3.begin(), [](int a){return a % 2 == 0;}, 1);
	// iv3: 1 99 1 1 99 1 1 99

	return 0;
}
```

[Back to top](#content)

## Reverse

```cpp
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main(int argc, char const *argv[])
{
	vector<int> iv = {0,1,2,3,4,5,6,7};
	vector<int> iv2(8);

	// reverse
	reverse(iv.begin(), iv.end());
	// iv: 7 6 5 4 3 2 1 0

	// reverse_copy
	reverse_copy(iv.begin(), iv.end(), iv2.begin());
	// iv: 7 6 5 4 3 2 1 0
	// iv2: 0 1 2 3 4 5 6 7

	return 0;
}
```

[Back to top](#content)

## rotate

Here is how rotate achieve:

```cpp
template <class ForwardIterator>
  void rotate (ForwardIterator first, ForwardIterator middle,
               ForwardIterator last)
{
  ForwardIterator next = middle;
  while (first!=next)
  {
    swap (*first++,*next++);
    if (next==last) next=middle;
    else if (first==middle) middle=next;
  }
}
```

The idea is move a part to the end and adjust it

```
1 2 3 4 5 6 7 -> 4 5 6 1 2 3 7 -> 4 5 6 7 2 3 1 -> 4 5 6 7 1 3 2 -> 4 5 6 7 1 2 3

^     ^                ^     ^            ^   ^              ^ ^
```

```cpp
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main(int argc, char const *argv[])
{
	vector<int> iv = {0,1,2,3,4,5,6,7,8,9};
	vector<int> iv2(10);

	rotate(iv.begin(), iv.begin()+3, iv.end());
	// iv: 3 4 5 6 7 8 9 0 1 2

	rotate_copy(iv.begin(), iv.begin()+3, iv.end(), iv2.begin());
	// iv: [3 4 5] 6 7 8 9 0 1 2
	// iv2: 6 7 8 9 0 1 2 [3 4 5]

	return 0;
}
```

[Back to top](#content)

## Search

_lower_bound upper_bound equal_range._ These 3 method design like binary search. For example:

```cpp
template <class ForwardIterator, class T>
  ForwardIterator lower_bound (ForwardIterator first, ForwardIterator last, const T& val)
{
  ForwardIterator it;
  iterator_traits<ForwardIterator>::difference_type count, step;
  count = distance(first,last);
  while (count>0)
  {
    it = first; step=count/2; advance (it,step);
    if (*it<val) {// or: if (comp(*it,val)), for version (2)
      first=++it;
      count-=step+1;
    }
    else count=step;
  }
  return first;
}

template <class ForwardIterator, class T>
  pair<ForwardIterator,ForwardIterator>
    equal_range (ForwardIterator first, ForwardIterator last, const T& val)
{
  ForwardIterator it = std::lower_bound (first,last,val);
  return std::make_pair ( it, std::upper_bound(it,last,val) );
}
```

lower_bound is more like a binary search

binary_search search one element and return a boolean.

find search one element and return the first one position.

search is searching a pattern and return the first position.

find_end is searching a pattern and return the last one (compare with search).

find_first_of find the first element that pattern have.

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>
#include <utility> // pair
#include <functional> // greater<int>
using namespace std;

int main(int argc, char const *argv[])
{
	vector<int> iv = {10,20,30,30,20,10,10,20};

	sort(iv.begin(), iv.end()); // 10 10 10 20 20 20 30 30

	// lower_bound & upper_bound
	vector<int>::iterator low, up;
	low = lower_bound(iv.begin(), iv.end(), 20);
	up = upper_bound(iv.begin(), iv.end(), 20);

	cout << "lower bound position: " << low - iv.begin() << endl;
	// lower bound position: 3
	cout << "upper bound position: " << up - iv.begin() << endl;
	// upper bound position: 6

	vector<int> test = {1,2,3,0,0,0};
	//                    low ^
	low = lower_bound(iv.begin(), iv.end(), 0, greater<int>());

	// equal_range
	pair<vector<int>::iterator, vector<int>::iterator> bounds;
	bounds = equal_range(iv.begin(), iv.end(), 20);

	cout << "bounds at positions " << (bounds.first - iv.begin());
  	cout << " and " << (bounds.second - iv.begin()) << endl;
  	// 10 10 10 20 20 20 30 30
  	//          ^        ^
  	// bounds at positions 3 and 6

  	// mismatch
  	vector<int> mis = {10,10,10,20,20,30,30,40};
	pair<vector<int>::iterator, vector<int>::iterator> myPair;
	myPair = mismatch(iv.begin(), iv.end(), mis.begin());
	//  iv: 10 10 10 20 20 20 30 30
	//              first: ^
	// mis: 10 10 10 20 20 30 30 40
	//             second: ^
	cout << "First mismacth is: " << *myPair.first << " ";
	cout << "and " << *myPair.second << endl;
	// First mismacth is: 20 and 30

	++myPair.first; ++myPair.second;
	myPair = mismatch(myPair.first, iv.end(), myPair.second);
	cout << "First mismacth is: " << *myPair.first << " ";
	cout << "and " << *myPair.second << endl;
	// First mismacth is: 30 and 40

  	// binary_search
  	cout << boolalpha;
  	cout << binary_search(iv.begin(), iv.end(), 20) << endl; // true;

  	// search
  	vector<int> searchV;
  	for (int i = 0; i < 10; ++i) {
  		searchV.push_back(i*10);
  	}

  	vector<int> patternV1 = {30,40,50};
  	vector<int> patternV2 = {30,50};

  	vector<int>::iterator it = search(searchV.begin(), searchV.end(), patternV1.begin(), patternV1.end());

  	// searchV: 0 10 20 30 40 50 60 70 80 90
  	//       pattern1 = 30 40 50
  	if(it != searchV.end())
  		cout << "Pattern is find and position is start from: " << it - searchV.begin() << endl;
  	else
  		cout << "Pattern not find." << endl;
  	// Pattern is find and position is start from: 3



  	it = search(searchV.begin(), searchV.end(), patternV2.begin(), patternV2.end());
	// searchV: 0 10 20 30 40 50 60 70 80 90
  	// pattern1 = 30 50
  	if(it != searchV.end())
  		cout << "Pattern is find and position is start from: " << it - searchV.begin() << endl;
  	else
  		cout << "Pattern not find." << endl;
	// Pattern not find.


  	// search_n
  	it = search_n(iv.begin(), iv.end(), 3, 20);
  	// iv: 10 10 10 20 20 20 30 30
  	//             {20 20 20}
	if(it != iv.end())
  		cout << "Pattern is find and position is start from: " << it - iv.begin() << endl;
  	else
  		cout << "Pattern not find." << endl;
	// Pattern is find and position is start from: 3

  	it = search_n(iv.begin(), iv.end(), 4, 10);
  	// iv: 10 10 10 20 20 20 30 30
  	// {10 10 10 10}
	if(it != iv.end())
  		cout << "Pattern is find and position is start from: " << it - iv.begin() << endl;
  	else
  		cout << "Pattern not find." << endl;
	// Pattern not find.


  	// find
	// searchV: 0 10 20 30 40 50 60 70 80 90
	//                     ^
  	it = find(searchV.begin(), searchV.end(), 40);
  	if(it != searchV.end())
  		cout << "Element is find in position: " << it - searchV.begin() << endl;
  	else
  		cout << "Element not find." << endl;
	// Element is find in position 4


  	// find_if
	// searchV: 0 10 20 30 40 50 60 70 80 90
	//                  ^
  	it = find_if(searchV.begin(), searchV.end(),[](int a){return a!=0 && a%3==0;});

  	if(it != searchV.end())
  		cout << "Element is find in position: " << it - searchV.begin() << endl;
  	else
  		cout << "Element not find." << endl;
	// Element is find in position 3

  	// find_if_not
  	// searchV: 0 10 20 30 40 50 60 70 80 90
	//                     ^
  	it = find_if_not(searchV.begin(), searchV.end(),[](int a){return a < 40;});
  	if(it != searchV.end())
  		cout << "Element is find in position: " << it - searchV.begin() << endl;
  	else
  		cout << "Element not find." << endl;
	// Element is find in position 4


  	// find_end
  	vector<int> findV = {1,2,3,4,5,1,2,3,4};
  	vector<int> pattern3 = {1,2,3};
  	// findV: 1 2 3 4 5 1 2 3 4
	//    	   pattern: 1 2 3
  	it = find_end(findV.begin(), findV.end(), pattern3.begin(), pattern3.end());
  	if(it != findV.end())
  		cout << "Element is find in position: " << it - findV.begin() << endl;
  	else
  		cout << "Element not find." << endl;
	// Element is find in position 5


  	// find_first_of
  	vector<int> pattern4 = {0,4};
  	// findV: 1 2 3 4 5 1 2 3 4
	//   pattern: 0 4
	//              ^
  	it = find_first_of(findV.begin(), findV.end(), pattern4.begin(), pattern4.end());
  	if(it != findV.end())
  		cout << "Element is find in position: " << it - findV.begin() << endl;
  	else
  		cout << "Element not find." << endl;
	// Element is find in position 3

	// adjacent_find
  	// iv: 10 10 10 20 20 20 30 30
  	// 	   ^
  	//              ^
  	it = adjacent_find(iv.begin(), iv.end());
  	cout << "The first adjacent number is " << *it << endl; // 10

  	it = adjacent_find(++++it, iv.end());
  	cout << "The second adjacent number is " << *it << endl; // 20

	return 0;
}
```

[Back to top](#content)

## Set

Container must be sorted first. Set is ordered in this code.

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
#include <set>
using namespace std;

int main(int argc, char const *argv[])
{
	set<int> is1 = { 5,10,15,20,25};
	set<int> is2 = { 50,40,30,20,10};

	// set_union
	vector<int> iv_union(10);
	vector<int>::iterator it;
	it = set_union(is1.begin(), is1.end(), is2.begin(), is2.end(), iv_union.begin());
	iv_union.resize(it - iv_union.begin());
	// iv_union: 5 10 15 20 25 30 40 50

	// set_intersection
	vector<int> iv_intersection(10);
	it = set_intersection(is1.begin(), is1.end(), is2.begin(), is2.end(), iv_intersection.begin());
	iv_intersection.resize(it - iv_intersection.begin());
	// iv_intersection: 10 20

	// set_difference
	vector<int> iv_difference(10);
	it = set_difference(is1.begin(), is1.end(), is2.begin(), is2.end(), iv_difference.begin());
	iv_difference.resize(it - iv_difference.begin());
	// iv_difference: 5 15 25 // difference only in first container

	// set_symmetric_difference
	vector<int> iv_symmetric_difference(10);
	it = set_symmetric_difference(is1.begin(), is1.end(), is2.begin(), is2.end(), iv_symmetric_difference.begin());
	iv_symmetric_difference.resize(it - iv_symmetric_difference.begin());
	// iv_symmetric_difference: 5 15 25 30 40 50 // difference only in both containers

	return 0;
}
```

[Back to top](#content)

## Shuffle

1. The only difference is that random*shuffle uses \_rand()* function to randomize the items, while the shuffle uses _urng_ which is a better random generator, though with the particular overload of random_shuffle, we can get the same behavior (as with the shuffle).

2. shuffle is an improvement over random_shuffle, and we should prefer using the former for better results. But shuffle supported from C++11.

[reference](https://www.geeksforgeeks.org/shuffle-vs-random_shuffle-c/)

```cpp
#include <iostream>
#include <vector>
#include <algorithm> // random_shuffle shuffle
#include <numeric> // iota
#include <ctime> // std::time
#include <cstdlib> // rand, srand
#include <random>       // std::default_random_engine
#include <chrono>       // std::chrono::system_clock
using namespace std;

int myrandom(int i) { return rand()%i; }
int main(int argc, char const *argv[])
{
	srand(unsigned(time(0)));
	vector<int> iv(10);
	iota(iv.begin(), iv.end(), 0); // iv: 0 1 2 3 4 5 6 7 8 9

	random_shuffle(iv.begin(), iv.end()); // 6 0 3 5 7 8 4 1 2 9
	random_shuffle(iv.begin(), iv.end(), myrandom); // It is random, since srand set by time.

	iota(iv.begin(), iv.end(), 0); // iv: 0 1 2 3 4 5 6 7 8 9
	unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
	shuffle(iv.begin(), iv.end(), std::default_random_engine(seed)); // It is random

	return 0;
}
```

[Back to top](#content)

## Sort

sort() in c++ using intro sort which is combine quicksort and heap sort.

stable_sort() using merge sort. When space is enough, the complexity is O(nlogn). Otherwise, it is O(n*logn*logn) since many swapping occur in algorithm.

partial_sort using heapsort.

nth_element: Rearranges the elements in the range [first,last), in such a way that the element at the nth position is the element that would be in that position in a sorted sequence.

nth_element is quick selection. Find the nth element and put it the exact place. On the right part is smaller than nth element and bigger on the left without specific sequence.

Something different in java. You can see: [Here]({{< ref "posts/language-comparison-common-method.md" >}})

```cpp
#include <iostream>
#include <algorithm>
#include <functional>
#include <vector>
#include <utility> //pair
using namespace std;

struct less{
	bool operator() (pair<int,int> i, pair<int,int> j){return( i.first < j.first);}
} less_pair;

int main(int argc, char const *argv[])
{
	int myints[] = {32,71,12,45,26,80,53,33};
	vector<int> iv (myints, myints+8);

	// is_sort
	cout << boolalpha;
	cout << is_sorted(iv.begin(), iv.end()) << endl;

	// sort
	sort(myints, myints+8); // 12 26 32 33 45 53 71 80
	cout << is_sorted(myints, myints+8) << endl; // true
	sort(iv.begin(), iv.begin() + 4, greater<int>()); // (71 45 32 12) 26 80 53 33

	// is_sorted_until
	auto iter1 = is_sorted_until(myints, myints+8);
	auto iter2 = is_sorted_until(iv.begin(), iv.end(), greater<int>());
	cout << *iter1 << endl; // ???
	cout << *iter2 << endl; // 26

	// partial_sort
	vector<int> iv2 = {32,71,12,45,26,80,53,33};

	partial_sort(iv2.begin(), iv2.begin() + 4, iv2.end());
    // (12 26 32 33) 71 80 53 45
	partial_sort(iv2.begin(), iv2.begin() + 4, iv2.end(), greater<int>());
    // (80 71 53 45) 12 26 32 33

	// partial_sort_copy
	vector<int> res_copy(6);

	partial_sort_copy(iv2.begin(), iv2.end(), res_copy.begin(), res_copy.end());

	// iv2 --> 12 26 32 33 71 80 53 45
	// res_copy --> 12 26 32 33 45 53

	// stable_sort
	pair<int, int> p1(4, 1); pair<int, int> p2(2, 1); pair<int, int> p3(3, 1);
	pair<int, int> p4(2, 2); pair<int, int> p5(1, 1); pair<int, int> p6(2, 3);

	vector<pair<int, int>> iv3 = {p1, p2, p3, p4, p5, p6};

	stable_sort(iv3.begin(), iv3.end(), less_pair);
    //(1 1) (2 1) (2 2) (2 3) (3 1) (4 1)

	// nth_element
	vector<int> iv4 = {32,71,12,45,26,80,53,33};
	nth_element(iv4.begin(), iv4.begin()+4 , iv4.end());
	// 26 12 32 33 45 53 71 80
	//        n is ^
	return 0;
}
```

[Back to top](#content)

## Swap

iter_swap: Swap the value of two iterators.

swap: Only use for swap two variable

swap_ranges: Exchanges the values of each of the elements in the range [first1,last1) with those of their respective elements in the range beginning at first2.

```cpp
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main(int argc, char const *argv[])
{
	int a = 1, b = 2;
	swap(a, b); // b = 2, a = 1

	vector<int> iv = {1,2,3,4,5,6};

	int myints[] = {10,20,30,40,50,60};

	iter_swap(iv.begin(), iv.begin()+3); // 4 2 3 1 5 6
	iter_swap(myints, myints + 3); // 40 20 30 10 50 60

	iter_swap(iv.begin(), myints);
	// iv: 40 2 3 1 5 6
	// myints: 4 20 30 10 50 60

	// iv: 40 [2 3 1 5] 6
	// myints: [4 20 30 10] 50 60
	std::swap_ranges(iv.begin()+1, iv.end()-1, myints);
	// iv: 40 [4 20 30 10] 6
	// myints: [2 3 1 5] 50 60
}
```

[Back to top](#content)

## Test range

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
using namespace std;

int main(int argc, char const *argv[])
{
	cout << boolalpha;
	// all_of
	vector<int> iv = {1,2,3,4,5,6};
	cout << all_of(iv.begin(), iv.end(), [](int a){return a<10;}) << endl;
	//true

	// any_of
	cout << any_of(iv.begin(), iv.end(), [](int a){return a>10;}) << endl;
	// false

	// none_of
	cout << none_of(iv.begin(), iv.end(), [](int a){return a>10;}) << endl;
	// true

	// equal
	vector<int> iv2 = {1,2,3,4,5,6};
	vector<int> iv3 = {1,2,3,4,5};

	cout << equal(iv.begin(), iv.end(), iv2.begin()) << endl;
	// true
	cout << equal(iv.begin(), iv.end(), iv3.begin()) << endl;
	// false

	// includes
	cout << includes(iv2.begin(), iv2.end(), iv3.begin(), iv3.end()) << endl;
	// true

	return 0;
}
```

[Back to top](#content)

## Unique

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main(int argc, char const *argv[])
{
	vector<int> iv1 = {10,20,20,20,30,30,20,20,10};

	vector<int>::iterator it;

	// it point to the new end.
	it = unique(iv1.begin(), iv1.end());

	for (vector<int>::iterator i = iv1.begin(); i != it; ++i)
	{
		cout << *i << " ";
	}
	cout << endl;
	// 10 20 30 20 10

	vector<int> iv2 = {10,20,20,20,30,30,20,20,10};
	vector<int> iv3(5);

	it = unique_copy(iv2.begin(), iv2.end(), iv3.begin());
	for (vector<int>::iterator i = iv3.begin(); i != it; ++i)
	{
		cout << *i << " ";
	}
	cout << endl;
	// 10 20 30 20 10
	return 0;
}
```

[Back to top](#content)

