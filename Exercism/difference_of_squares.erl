-module(difference_of_squares).

-export([difference_of_squares/1, square_of_sum/1, sum_of_squares/1]).

difference_of_squares(Number) -> 
    square_of_sum(Number) - sum_of_squares(Number).

square_of_sum(Number) -> square_of_sum(Number, 0).

square_of_sum(0, Result) -> trunc(math:pow(Result, 2));

square_of_sum(Number, Result) -> square_of_sum(Number - 1, Result + Number).

sum_of_squares(Number) -> sum_of_squares(Number, 0).

sum_of_squares(0, Result) -> trunc(Result);

sum_of_squares(Number, Result) ->
    sum_of_squares(Number - 1, Result + math:pow(Number, 2)).