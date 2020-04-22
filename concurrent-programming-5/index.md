# Concurrent Programming Course note 5


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

