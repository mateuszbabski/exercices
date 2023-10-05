-module(pythagorean_triplet).

-export([triplets_with_sum/1]).

-include_lib("eunit/include/eunit.hrl").

triplets_with_sum(Limit) -> 
    [{A, B, Limit - A - B} ||
        A <- lists:seq(1, Limit div 3),
        B <- lists:seq(1, Limit div 2),
        A < B,
        A*A + B*B =:= (Limit - A - B)*(Limit - A - B)
    ].

first_test() ->
    [{200, 375, 425}] = triplets_with_sum(1000).

second_test() ->
    [{27, 36, 45}] = triplets_with_sum(108).

third_test() ->
    [] = triplets_with_sum(1001).