-module(armstrong_numbers).

-export([is_armstrong_number/1, sum_of_powers/2]).

is_armstrong_number(Numbers) -> 
    List = [[X] || X <- integer_to_list(Numbers)],
    List_Length = erlang:length(List),
    case List_Length of
        1 -> true;
        2 -> false;
        _ -> case sum_of_powers(List, List_Length) == Numbers of
                 true -> true;
                 _ -> false
             end
    end.

sum_of_powers(List, List_Length) -> 
   sum_of_powers(List, List_Length, 0).

sum_of_powers([H|T], List_Length, Acc) ->
    Number = list_to_integer(H),
    sum_of_powers(T, List_Length, math:pow(Number, List_Length) + Acc); 

sum_of_powers([], _, Acc) ->
   trunc(Acc).