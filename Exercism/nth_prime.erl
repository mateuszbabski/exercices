-module(nth_prime).

-export([prime/1]).

-include_lib("eunit/include/eunit.hrl").

prime(0) -> error;
prime(1) -> 2;
prime(N) -> 
    get_nth_prime(N, 1, []).

get_nth_prime(N, Acc, [H|_T]) when N =:= Acc -> H;

get_nth_prime(N, Acc, Result) when Acc rem 2 =/= 0; 
                                   Acc rem 3 =/= 0; 
                                   Acc rem 5 =/= 0 ->
                                    get_nth_prime(N, Acc + 1, [Acc|Result]).                                

prime_test() ->
    3 = prime(2),
    13 = prime(6),
    104743 = prime(10001).