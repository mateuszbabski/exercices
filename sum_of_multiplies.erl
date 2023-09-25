-module(sum_of_multiples).

-export([sum/2]).

sum(Factors, Limit) -> 
    All = [multiplies(Factor, Limit) || Factor <- Factors],
    Uniq = lists:umerge(All),
    lists:sum(Uniq).

multiplies(0, _) -> [0];

multiplies(Factor, Limit) -> 
    lists:seq(Factor, Limit - 1, Factor).