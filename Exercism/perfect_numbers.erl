-module(perfect_numbers).

-export([classify/1]).

classify(Number) when Number > 0 -> sum_factors(Number).

sum_factors(Number) -> sum_factors(Number, 1, 0).

sum_factors(Number, N, Acc) when Number =< N, Number < Acc -> abundant;

sum_factors(Number, N, Acc) when Number =< N, Number > Acc -> deficient;

sum_factors(Number, N, Acc) when Number =< N -> perfect; 

sum_factors(Number, N, Acc) when Number rem N == 0 -> 
    sum_factors(Number, N+1, Acc+N);

sum_factors(Number, N, Acc) -> 
    sum_factors(Number, N+1, Acc).