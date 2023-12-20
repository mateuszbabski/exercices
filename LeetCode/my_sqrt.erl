%%%%%%%%%%%%%%%%
%  Leet code exercise
%  60. Sqrt
%
% Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.
%
% You must not use any built-in exponent function or operator.
%
% For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.
% 
%
% Example 1:
%
% Input: x = 4
% Output: 2
% Explanation: The square root of 4 is 2, so we return 2.
% Example 2:
%
% Input: x = 8
% Output: 2
% Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
% 
%
% Constraints:
%
% 0 <= x <= 231 - 1
%
%%%%%%%%%%%%%%%%

-module(my_sqrt).

-export([my_sqrt/1]).

-include_lib("eunit/include/eunit.hrl").

-spec my_sqrt(X :: integer()) -> integer().
my_sqrt(0) -> 0;
my_sqrt(1) -> 1;
my_sqrt(X) -> 
    check_root(1, X, X).

check_root(Lower, Upper, X) when Lower > Upper -> Upper;
check_root(Lower, Upper, X) ->
    Root = Lower + ((Upper - Lower) div 2),
    if
        Root*Root =< X ->
            check_root(Root + 1, Upper, X);
        Root*Root > X ->
            check_root(Lower, Root - 1, X)
    end.

sqrt1_test() -> 
    2 = my_sqrt(4).
sqrt2_test() -> 
    2 = my_sqrt(8).