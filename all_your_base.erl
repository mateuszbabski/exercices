-module(all_your_base).

-export([rebase/3]).

-include_lib("eunit/include/eunit.hrl").

rebase(_Digits, InputBase, _OutputBase) when InputBase < 2 -> 
    {error, "input base must be >= 2"};

rebase(_Digits, _InputBase, OutputBase) when OutputBase < 2 -> 
    {error, "output base must be >= 2"};

rebase([], _, _) -> {ok, [0]};

rebase([0], _, _) -> {ok, [0]};

rebase([1], _, _) -> {ok, [1]};

rebase(Digits, InputBase, OutputBase) ->
    case lists:any(fun(X) ->
        0 > X orelse X >= InputBase end, Digits) of
            false -> 
                BaseCount = count_base(Digits, InputBase),
                count(BaseCount, OutputBase, []);
            true -> 
                {error, "all digits must satisfy 0 <= d < input base"}
    end.

count(0, _, []) -> {ok, [0]};
count(0, _, Acc) -> {ok, Acc};
count(Numbers, Base, Acc) ->
    count(Numbers div Base, Base, [Numbers rem Base | Acc]).

count_base(Numbers, Base) ->
    Length = count_length(Numbers),
    count_base(Numbers, Length-1, Base, 0).

count_base([], _Length, _Base, OutputValue) -> OutputValue;
count_base([H|T], Length, Base, OutputValue) ->
    count_base(T, Length-1, Base, trunc(H * math:pow(Base, Length)) + OutputValue).

count_length([]) -> 0;
count_length(List) -> count_length(List, 0).
count_length([], Length) -> Length;
count_length([_|T], Length) -> count_length(T, Length + 1).

rebase_ok_test() ->
    {ok, [2, 10]} = rebase([1, 1, 2, 0], 3, 16).
rebase_ok2_test() ->
    {ok, [1, 0, 1, 0, 1, 0]} = rebase([4, 2], 10, 2).
rebase_ok3_test() ->
    {ok, [6, 10, 45]} = rebase([3, 46, 60], 97, 73).

rebase_error_test() ->
    {error, "input base must be >= 2"} = rebase([0], 1, 10).
rebase_error2_test() ->
    {error, "input base must be >= 2"} = rebase([], 0, 10).
rebase_error3_test() ->
    {error, "input base must be >= 2"} = rebase([1], -2, 10).
rebase_error4_test() ->
    {error, "all digits must satisfy 0 <= d < input base"} = rebase([1, -1, 1, 0, 1, 0], 2, 10).