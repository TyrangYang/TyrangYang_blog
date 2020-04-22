---
title: Concurrent Programming Course note 5
date: 2019-10-31
author: Haolin Yang
categories: ["Concurrent-programming"]
tags:
    - concurrent
    - course note
---

## Message passing

```erl
echo() ->
    receive
        {From, Msg} -> From ! {Msg}, echo();
        %^pattern^    %^response^   %^keep loop
        stop -> true
        %^pattern^  ^a return value and stop receiving
    end.
```
