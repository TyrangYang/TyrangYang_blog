---
title: Miller Rabin Algorithm
date: 2020-01-13
author: Haolin Yang
categories: ['Alg&DataStr']
tags:
    - algorithm
    - data structure
---

## What is millerRabin algorithm

The Miller–Rabin primality test or Rabin–Miller primality test is a **primality test**: _an algorithm which determines whether a given number is prime, similar to the Fermat primality test and the Solovay–Strassen primality test._ It was first discovered by Russian mathematician M. M. Artjuhov in 1967.[1] Gary L. Miller rediscovered it in 1976; Miller's version of the test is deterministic, but its correctness relies on the unproven extended Riemann hypothesis.[2] Michael O. Rabin modified it to obtain an unconditional probabilistic algorithm in 1980.[3]

## PowerMod

### What problem it solve

When you want to mod a number which is the product of two big numbers, this algorithm is necessary.

Like `a^n mod m`.

### Code

```cpp
// a^n mod m
uint64_t powermod(uint64_t a, uint64_t n, uint64_t m){
	uint64_t prod = 1;
	// a^11 11 = 8 + 2 + 1 = 01011 // a^11 = a^(1+2+8) = a^1 * a^2 * a^8
	// the basic idea is shift the bit. It will more understandable than odd/even number.
	// if the last bit is 0, we make a become a^2.
	// if the last bit is 1, prod * a.
	while(n > 0){
		if(n % 2 != 0) // n&1 // n is odd, n&1 is true
			prod = prod * a % m;
		a = a * a % m; // can not be prod = prod * prod % m
		// Because prod * prod will multipul extra a inside.
		// For n = 11, n(binary)=01011, (((prod * a)^2 * a)^2^2 * a)^2. this is wrong
		// However, prod should be prod * a * a^2 * a^8.
		n = n / 2; // compiler n>>=1
	}
	return prod;
}//O(logn)
```

## How Miller-Rabin works

![millerRabin1](/images/2020-01-13-miller-rabin/millerRabin1.jpeg)

![millerRabin2](/images/2020-01-13-miller-rabin/millerRabin2.jpeg)

## Example code

Here is the sample code

```cpp
#include <iostream>
#include <cmath>
using namespace std;

uint64_t powermod(uint64_t a, uint64_t n, uint64_t m){
	uint64_t prod = 1;
	// a^11 11 = 8 + 2 + 1 = 01011 // a^11 = a^(1+2+8) = a^1 * a^2 * a^8
	// the basic idea is shift the bit. It will more understandable than odd/even number.
	// if the last bit is 0, we make a become a^2.
	// if the last bit is 1, prod * a.
	while(n > 0){
		if(n % 2 != 0) // n&1 // n is odd, n&1 is true
			prod = prod * a % m;
		a = a * a % m; // can not be prod = prod * prod % m
		// Because prod * prod will multiple extra a inside.
		// For n = 11, n(binary)=01011, (((prod * a)^2 * a)^2^2 * a)^2. this is wrong
		// However, prod should be prod * a * a^2 * a^8.
		n = n / 2; // compiler n>>=1
	}
	return prod;
}//O(logn)

// https://www.cnblogs.com/Norlan/p/5350243.html
bool MillerRabin(uint64_t p, int k){
	if(p < 2) return false;
	for (int i = 0; i < k ;i++){
		uint64_t a = random(2,p-2);
		uint64_t d = p-1;
		uint64_t s = 0;
		// cout << "MillerRabin a= "<< a << " p="<<	 p<< endl;
		while (d % 2 == 0) {// d & 1 == 0
			s++;
			d /= 2; //d >> =1
		}
		// cout <<"d=" << d << "  s=" << s << endl;
		// d*2^s = p-1 (d is odd number)
		// d contains high-order, non-zero bits(stripedd low zreo bits off)
		// s = #of bits that were stripp off
		uint64_t x = powermod(a,d,p);
		cout << "x= " << x << endl;
		if(x == 1 || x == p-1)
			continue;
		// kurger version //
		for(int j = 0; j < s-1; j++){
			x = x * x % p;
			if (x == 1)
				return false;
			if (x == p-1)
				goto nextTry;
		}
		return false;
		nextTry:;
		// ************** //
		// my version //
		// for (int j = 0; j < s-1; ++j)
		// {
		// 	x = x * x % p
		// 	if(x == 1)
		// 		return false;
		// 	if(x == p-1)
		// 		break;
		// }
		// if(x != p-1)
		// 	return false;
		// ************** //
	}
	return true; // probably?
}

```
