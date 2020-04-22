# Lambda in C++


Introduction of Lambda expression in C++ and how to use it.

## What is Lambda in C++

Lambda expression is a new feature since **c++11**. It is used to create anonymous function object to simplify programming process.

## How Lambda expressions are composed

[_capture_]\(_parameters_) _mutable_ -> _return type_ {_statement_}

```cpp
// ...
#include <functional>
// ...
std:function<int(int, int)> add = [](int a, int b) -> int {return a+b;};
```

### capture

Capture variables from context.

| capture statement |                        meaning                         |
| :---------------: | :----------------------------------------------------: |
|        []         |         not capture any variable from context          |
|      [x, &y]      |   capture x by passing value, y by passing reference   |
|        [&]        |       capture all variables by passing reference       |
|        [=]        |         capture all variables by passing value         |
|       [&,x]       | capture all variables by passing reference, expect _x_ |
|      [=,&x]       |   capture all variables by passing value, expect _x_   |

### parameter

Same as parameter in normal function. This part is optional actually when no parameter is needed. "()" parentheses can be omitted as well.

### mutable / exception

It is a optional keyword. In default, lambda return a _const_ range in another word you cannot change value captured from context. You can change it by adding `mutable` keyword.

`exception` is declare the exception type. like `throw(int)`

### return type

Same as function return type. It is optional part. It can be omitted when return type is void or just one return keyword in statement so that compiler can automatically recognize.

### statement

The function body where you can use variable captured from context and parameters. It can be empty but cannot be omitted.

## How to use it

### Functor

loop each element in a container (like `map` or `reduce`)

```cpp
std::vector<int> some_list;
int total = 0;
for (int i = 0; i < 5; ++i) some_list.push_back(i); // 0 1 2 3 4

std::for_each(begin(some_list), end(some_list), [](int& x)
{
    x++;
});
// some_list // 1 2 3 4 5

std::for_each(begin(some_list), end(some_list), [&total](int x)
{
    total += x;
});
// total 15

std::sort(begin(some_list), end(some_list), [](int a, int b){return a>b;});
// some_list // 5 4 3 2 1
```

### Function

```cpp
#include <iostream>
#include <functional>
using namespace std;

int main(void)
{
    int x = 8, y = 9;
    auto add = [](int a, int b) { return a + b; };
    std::function<int(int, int)> Add = [=](int a, int b) { return a + b; };

    cout << "add: " << add(x, y) << endl;
    cout << "Add: " << Add(x, y) << endl;

    return 0;
}
```

### Recursive

Same with function but you have to specify the type of function instead of `auto`. Because compiler cannot automatically detected the type recursive function when calling itself.

```cpp
#include <iostream>
#include <functional>
using namespace std;

int main(void)
{
    std::function<int(int)> recursion = [&recursion](int n) {
        return n < 2 ? 1 : recursion(n - 1) + recursion(n - 2);
    };

    cout << "recursion(2):" << recursion(2) << endl;
    cout << "recursion(3):" << recursion(3) << endl;
    cout << "recursion(4):" << recursion(4) << endl;

    return 0;
}
```

Meanwhile, tail recursion:

```cpp
#include <iostream>
#include <functional>
using namespace std;

int main(void)
{
    function<uint64_t(uint64_t, uint64_t, uint64_t,uint64_t)> fibo = [&fibo](uint64_t a, uint64_t b, uint64_t cur, uint64_t r){
    	if(cur != r)
	    	return fibo(b, a+b , cur+1, r );
  		return b;
    };

	function<uint64_t(uint64_t)> recursion = [&fibo](uint64_t n) {
		if (n < 2)
            return (uint64_t)1;
		return fibo(1, 1, 1, n);
	};

	uint64_t in = 35;
    cout << "recursion("<< in <<"):" << recursion(in) << endl;
    return 0;
}

```

