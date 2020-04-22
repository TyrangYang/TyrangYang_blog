# Iterator in c++


## Iterator 设计思维

STL 中 container 和 algorithm 是相对独立的，本身设计也是泛型化的。Iterator 就是用来将这两者联系在一起的。

## Iterator 是一种 smart pointer

可以不用 delete

## Iterator 属性

iterator_traits 是用来抽取 iterator 中的类型(特指 value type)的。

这是 iterator 中常见的五种属性。

```cpp
template <class I>
struct iterator_traits
{
    typedef typename I::iterator_category iterator_category; //category
    typedef typename I::value_type value_type; // type
    typedef typename I::difference_type difference_type; //
    typedef typename I::pointer pointer; // T*
    typedef typename I::reference reference; // T&
};
```

```cpp
#include <iostream>     // std::cout
#include <iterator>     // std::iterator_traits
#include <typeinfo>     // typeid
using namespace std;

int main() {
  typedef std::iterator_traits<double*> traits;
  cout << typeid(traits::iterator_category).name() << endl;
  cout << typeid(traits::value_type).name() << endl;
  cout << typeid(traits::difference_type).name() << endl;
  cout << typeid(traits::pointer).name() << endl;
  cout << typeid(traits::reference).name() << endl;
  return 0;
}
```

```
NSt3__126random_access_iterator_tagE
d
l
Pd
d
yanghaoli
```

## iterator_category

1. **Input iterator**: Read only. Cannot be change.
2. **Output iterator**: Write only.
3. **Forward iterator**: Allow write and only one direction.(only operator++). Some algorithms use one direction enough.(like _replace()_)
4. **Bidirectional iterator**: For some algorithm will move both direction. Support operator++ and operator--.
5. **Random access iterator**: Support more operator. p+n, p-n, p[n], p1-p2, p1 < p2.

{{< mermaid >}}
graph LR;
    Input_Iterator --> Forward_Iterator ;
    Output_Iterator --> Forward_Iterator ;
    Forward_Iterator --> Bidirectional_Iterator;
    Bidirectional_Iterator --> Random_Access_Iterator;
{{< /mermaid >}}

## iterator & const_iterator

const_iterator is read only.

```cpp
#include <iostream>
#include <vector>

using namespace std;

int main(int argc, char const *argv[])
{
  vector<int> iv = {1,2,3,4,5};
  vector<int>::iterator a = iv.begin();
  vector<int>::const_iterator b = iv.begin();

  *a = 12;
  cout << *a << endl;

  // *b = 100; // NOT WORK
  cout << *b << endl;
}
```

