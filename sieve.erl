-module(sieve).

-export([primes/1]).

-include_lib("eunit/include/eunit.hrl").

primes(Limit) when Limit < 2 -> [];

primes(Limit) -> 
    List = lists:seq(2, Limit),
    primes(List, []).

primes([], Primes) -> lists:reverse(Primes);

primes([H|T], Primes) ->
    NewList = ([X || X <- T, X rem H =/= 0]),
    primes(NewList, [H|Primes]).

primes_test() ->
    [2, 3, 5, 7] = primes(10),
    [2, 3, 5, 7, 11, 13] = primes(13),
    [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] = primes(30).