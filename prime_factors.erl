-module(prime_factors).

-export([factors/1]).

factors(Value) -> factors(Value, 2, []).

factors(1, N, Result) -> Result;

factors(Value, N, Result) when Value rem N == 0 -> 
    factors(Value div N, N, [N|Result]);

factors(Value, N, Result) -> 
    factors(Value, N+1, Result).