-module(hamming).

-export([distance/2]).

distance(Strand1, Strand2) -> 
    case length(Strand1) =:= length(Strand2) of
        false -> {error, badarg};
        _ -> count_diffs(Strand1, Strand2)
    end.

count_diffs(Strand1, Strand2) -> 
    case lists:sort(Strand1) == lists:sort(Strand2) of
        true -> 0;
        _ -> count_diffs(Strand1, Strand2, 0)
    end.

count_diffs([H1|T1], [H2|T2], Result) ->
    case H1 =/= H2 of
        true -> count_diffs(T1, T2, Result + 1);
        _ -> count_diffs(T1, T2, Result)
    end;

count_diffs([], [], Result) -> Result.