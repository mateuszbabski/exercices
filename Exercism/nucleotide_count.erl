-module(nucleotide_count).

-export([count/2, nucleotide_counts/1]).

-include_lib("eunit/include/eunit.hrl").

count(Strand, Nucleotide) -> count(Strand, Nucleotide, 0).

count([], _Nucleotide, Acc) -> Acc;
count([H|_T], _Nucleotide, _Acc) when [H] =/= "A", 
                                     [H] =/= "C", 
                                     [H] =/= "G", 
                                     [H] =/= "T" -> 
    error("Invalid input");
count([H|T], Nucleotide, Acc) ->
    case [H] =:= Nucleotide of
        true -> 
            count(T, Nucleotide, Acc + 1);
        false -> 
            count(T, Nucleotide, Acc)
    end.

nucleotide_counts(Strand) ->  
             [{"A", count(Strand, "A")}, 
              {"C", count(Strand, "C")}, 
              {"G", count(Strand, "G")}, 
              {"T", count(Strand, "T")}].
        

first_test() ->
    [{"A", 0}, {"C", 0}, {"G", 0}, {"T", 0}] = nucleotide_counts([]).

second_test() ->
    [{"A", 0}, {"C", 0}, {"G", 1}, {"T", 0}] = nucleotide_counts("G").

third_test() ->
    [{"A", 0}, {"C", 0}, {"G", 7}, {"T", 0}] = nucleotide_counts("GGGGGGG").

fourth_test() ->
    7 = count("GGGGGGG", "G").

fifth_test() ->
    [{"A", 0}, {"C", 0}, {"G", 1}, {"T", 0}] = nucleotide_counts("G").

sixth_test() ->
    [{"A", 20}, {"C", 12}, {"G", 17}, {"T", 21}] = nucleotide_counts("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTG"
        "ATAGCAGC").

seventh_test() ->
    17 = count("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTG"
        "ATAGCAGC", "G").

