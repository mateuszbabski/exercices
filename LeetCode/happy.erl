%%%%%%%%%%%%%%%%%%%%
%  Leet code exercise
%  202. Happy number
%
% Write an algorithm to determine if a number n is happy.
%
% A happy number is a number defined by the following process:
%
% Starting with any positive integer, replace the number by the sum of the squares of its digits.
% Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
% Those numbers for which this process ends in 1 are happy.
% Return true if n is a happy number, and false if not.
%
% 
%
% Example 1:
%
% Input: n = 19
% Output: true
% Explanation:
% 12 + 92 = 82
% 82 + 22 = 68
% 62 + 82 = 100
% 12 + 02 + 02 = 1
% Example 2:
%
% Input: n = 2
% Output: false
%  
%
% Constraints:
%
% 1 <= n <= 231 - 1
%%%%%%%%%%%%%%%%%%%%

-module(happy).

-export([is_happy/1]).

-include_lib("eunit/include/eunit.hrl").

-spec is_happy(N :: integer()) -> boolean().
is_happy(1) -> true;
is_happy(7) -> true;
is_happy(N) when N < 10 -> false;
is_happy(N) ->
    DigitList = get_digits(N),
    PoweredInts = [X*X || X <- DigitList],
    Sum = lists:sum(PoweredInts),
    is_happy(Sum).

get_digits(Number) when is_integer(Number), Number >= 0 ->
    get_digits(Number, []).

get_digits(0, Digits) ->
    lists:reverse(Digits);
get_digits(Number, Digits) when Number > 0 ->
    {Quotient, Remainder} = divrem(Number, 10),
    get_digits(Quotient, [Remainder | Digits]).

divrem(X, Y) ->
    {X div Y, X rem Y}.

happy1_test() -> 
    true = is_happy(19).
happy2_test() -> 
    false = is_happy(2).   