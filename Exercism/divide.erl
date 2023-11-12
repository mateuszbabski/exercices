-module(divide).

-export([divide/2]).

-include_lib("eunit/include/eunit.hrl").

-spec divide(Dividend :: integer(), Divisor :: integer()) -> integer().

divide(Dividend, Divisor) when Dividend =< -2147483648 -> divide(-2147483648, Divisor);
divide(Dividend, Divisor) when Dividend >= 2147483647 ->  divide(2147483647, Divisor);

divide(Dividend, 1) -> Dividend;
divide(Dividend, -1) -> -Dividend;

divide(Dividend, Divisor) when Dividend > 0, Divisor > 0 -> count(Dividend, Divisor, 0);
divide(Dividend, Divisor) when Dividend < 0, Divisor < 0 -> count(Dividend, Divisor, 0);
divide(Dividend, Divisor) -> -count(Dividend, Divisor, 0).

count(Dividend, Divisor, Acc) ->
    case abs(Divisor) =< abs(Dividend) of
        true -> count(abs(Dividend) - abs(Divisor), Divisor, Acc + 1);
        _ ->
            Acc
    end.

divide_test() ->
    3 = divide(10,3).
divide1_test() ->
    -1 = divide(-1,1).
divide2_test() ->
    1 = divide(-1,-1).
divide3_test() ->
    2147483648 = divide(-2147483648,-1).
divide4_test() ->
    -2147483648 = divide(-2147483648,1).
divide5_test() ->
    2147483647 = divide(2147483648,1).