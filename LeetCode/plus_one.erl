%%%%%%%%%%%%%%%%%%%%
%  Leet code exercise
%  66. Plus one
% You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
%
% Increment the large integer by one and return the resulting array of digits.
%
% 
%
%E xample 1:
%
% Input: digits = [1,2,3]
% Output: [1,2,4]
% Explanation: The array represents the integer 123.
% Incrementing by one gives 123 + 1 = 124.
% Thus, the result should be [1,2,4].
% Example 2:
%
% Input: digits = [4,3,2,1]
% Output: [4,3,2,2]
% Explanation: The array represents the integer 4321.
% Incrementing by one gives 4321 + 1 = 4322.
% Thus, the result should be [4,3,2,2].
% Example 3:
%
% Input: digits = [9]
% Output: [1,0]
% Explanation: The array represents the integer 9.
% Incrementing by one gives 9 + 1 = 10.
% Thus, the result should be [1,0].
% 
%
% Constraints:
%
% 1 <= digits.length <= 100
% 0 <= digits[i] <= 9
% digits does not contain any leading 0's.
%
%%%%%%%%%%%%%%%%%%%%

-module(plus_one).

-export([plus_one/1]).

-include_lib("eunit/include/eunit.hrl").

-spec plus_one(Digits :: [integer()]) -> [integer()].
plus_one(Digits) ->
  NewResult = merge(Digits) + 1,
  get_digits(NewResult).

merge(Digits) ->
    merge(Digits, 0).
merge([], Res) -> Res;
merge([H|T], Res) ->
    merge(T, Res * 10 + H).

get_digits(Number) when is_integer(Number), Number >= 0 ->
    get_digits(Number, []).

get_digits(0, Digits) ->
    Digits;
get_digits(Number, Digits) when Number > 0 ->
    {Quotient, Remainder} = divrem(Number, 10),
    get_digits(Quotient, [Remainder | Digits]).

divrem(X, Y) ->
    {X div Y, X rem Y}.

plus1_test() -> 
    [1,2,4] = plus_one([1,2,3]).
plus2_test() -> 
    [1,0,0] = plus_one([9,9]).
plus3_test() -> 
    [4,3,2,2] = plus_one([4,3,2,1]).
