-module(sieve).

-export([primes/1]).

-include_lib("eunit/include/eunit.hrl").

primes(Limit) when Limit < 2 -> [];

primes(Limit) -> 
    List = lists:seq(2, Limit),
    primes(List, []).

primes([], Primes) -> lists:reverse(Primes);

primes([H|_T] = List, Primes) ->
    NewList = lists:flatten([[X] || X <- List, valid(X, H)]),
    primes(NewList, [H|Primes]).


valid(X, Y) -> 
    case X rem Y of
        0 -> false;
        _ -> true
    end.

primes_test() ->
    [2, 3, 5, 7] = primes(10),
    [2, 3, 5, 7, 11, 13] = primes(13),
    [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] = primes(30).