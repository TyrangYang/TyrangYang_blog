---
title: Erlang overview
date: 2019-12-14
author: Haolin Yang
categories: ["Overview"]
tag:
    - erlang
---

## Basic

Documentation: [https://erlang.org/doc/search/](https://erlang.org/doc/search/)

### Functional language

Erlang is a functional language. Code need compile and running line by line.

Every line need finish by a `.`. like: `A = 1.`.

### Module

Every erlang file will consider as a module. You console will compile all module you want.

You have to add `-module(<filename>).` into first line. Module should be same with filename without suffix.

In erl console, run `c(<filename>).` to compile it. Run a function is like: `<moduleName>: <functionName>(...<argument>)`

Also you need export a list contained all function you expect to export. Like `-export([append/2,distance/2, double/1, drop/2]).` or `-compile(export_all).` to export all function.

> `append/2` means a function called append with 2 arguments.

### Variable & item

Variable a word starting with upper case. like `A` or `Result`.

item is a word starting from lower case. like `request` or `add`.

Variable store the value.

item use for matching.

### Bind

In erlang, **No concept** about assigning a value to a variable. It is actually bind a variable to a value. Once they are bound together you cannot to assign a new value to it.

```erl
A = 1. # right
B = 2. # right
A = B, # wrong. Because A is already bound.
```

## Function

Sample function:

```erl
sample(A) -> A.
```

The last line of Function is the return value. Use `;` to represent end point of a branch.

```erl
if
    (A == true) and (B == true) ->
        true;
    true ->
        false
end.
```

## Multi-thread

Erlang use message passing module to deal with multi thread. Each thread have own mailbox, stack and heap.

### thread id

Each thread have a id called Pid. You need use Pid as an address and sending the message through it.

### receive and send message

```erl
echo() ->
    receive
        {echo, From, Ref, Msg} ->
    From ! {responds, self(), Ref, Msg}, echo();
        {stop} -> ok
end.
```

### spawn

Reference: http://erlang.org/doc/man/erlang.html#spawn-1

We need `spawn/1, spawn/2, spawn/3` to generate new thread, usually we use `spawn/3`. The basic idea is giving a function that running initially at new thread. This function can calling another function inside the module.

`Pid = spawn(?MODULE, echo, [])`. This line means we generate a new thread with a function called echo in unknown module (usually self module). The argument list is empty and the thread id bind with `Pid`.

## special

### fold

This is a basic function which is same as `reduce()` in javascript.

In standard library, erlang have `lists:foldl(F,A,[H|T])`.

foldl is folding the list by a given function from left to right. foldr is from right to left.

```
foldl(_F, A, []) -> A;
foldl(F, A, [H|T]) -> fold(F, F(H, A), [T]).

foldr(_F, A, []) -> A;
foldr(F, A, [H|T]) -> F(H, foldr(F, A, T)).
```

> `_F` means `F` is unnecessary since first part of function not use `F`.

> `[H|T]` is unique characteristic of erlang. `H` is the first element. `T` is the rest.
> [H|T] = [1,2,3,4,5]. `H` is 1. `T` is [2,3,4,5]

We can run this function:`foldl(fun (H, A) -> H + A end, 0 , [1,2,3,4,5])`.

## MakeFile

Sample makefile from a erlang homework:

```makefile
all:
	erlc *erl
	erl -eval "lexgrm:start(), halt()" -noshell -detached

run: all
	erl

clean:
	rm -f *beam grm.erl lex.erl
```
