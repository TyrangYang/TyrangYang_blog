---
title: Structured binding
date: 2020-03-01
author: Haolin Yang
categories: ["C++"]
tag:
    - c++
---

Structured binding is a new feature since c++17

[cppreference.com](https://zh.cppreference.com/w/cpp/language/structured_binding)

`auto [ identifier-list ] = expression`

## Bind array

```cpp
 int main(int argc, char const *argv[])
{
	int test[3] = {1, 2, 3};

	auto [a, b, c] = test; // an new array e copy from test and a = e[0]; b = e[1]; c = e[2];
	auto &[x, y, z] = test; // x = test[0]; x = test[1]; x = test[2]

	cout << ++a << " " << ++b << " " << ++c << " " << endl;
	for (int &i : test)
		cout << i << " ";
	cout << endl;

	cout << ++x << " " << ++y << " " << ++z << " " << endl;
	for (int &i : test)
		cout << i << " ";
	cout << endl;

	return 0;
}
```

## tuple

```cpp
int main(int argc, char const *argv[])
{
	tuple<int, int, int> test(1, 2, 3);

	auto &[a, b, c] = test; // 1 2 3

	pair<int, char> test2(1, 'c');

	auto &[a2, b2] = test2; // 1 c

	return 0;
}
```

## struct

```cpp
struct test
{
    int a;
    int b;
};

int main(int argc, char const *argv[])
{

    test one;
    one.a = 1;
    one.b = 2;

    auto &[first, second] = one; // 1 ,2

    return 0;
}
```
