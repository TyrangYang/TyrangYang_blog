---
title: Makefile overview
date: 2020-01-12
author: Haolin Yang
categories: ['Overview']
tags:
    - makefile
---

What is makefile. How to write a makefile.

Ref: [https://opensource.com/article/18/8/what-how-makefile](https://opensource.com/article/18/8/what-how-makefile)

## What is makefile

A `makefile` is a file containing a set of directives used by a `make` build automation tool to generate a target/goal.

You may have used make to compile a program from source code.

## How to write makefile

To summarize, below is the syntax of a typical rule:

```makefile
target: prerequisites
<TAB> recipe
```

As an example, a _target_ might be a binary file that **depends on** _prerequisites_ (source files). On the other hand, a prerequisite can also be a target that depends on other dependencies:

```makefile
final_target: sub_target final_target.c
        Recipe_to_create_final_target

sub_target: sub_target.c
        Recipe_to_create_sub_target
```

**It is not necessary for the target and prerequisites to be a file**; it could be just a name for the recipe, as in our example. We call these "phony targets."

## Example

```makefile
run: test
	./test

test: test.o
	g++ test.o -o test

test.o: test.cc
	g++ -std=c++11 -c test.cc
```
