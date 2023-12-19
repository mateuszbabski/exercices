%%%%%%%%%%%%%%%%%%%%
%  Leet code exercise
%  70. Climbing stairs
%
% You are climbing a staircase. It takes n steps to reach the top.
%
% Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
%
% 
%
% Example 1:
%
% Input: n = 2
% Output: 2
% Explanation: There are two ways to climb to the top.
% 1. 1 step + 1 step
% 2. 2 steps
% Example 2:
%
% Input: n = 3
% Output: 3
% Explanation: There are three ways to climb to the top.
% 1. 1 step + 1 step + 1 step
% 2. 1 step + 2 steps
% 3. 2 steps + 1 step
% 
%
% Constraints:
%
% 1 <= n <= 45
%%%%%%%%%%%%%%%%%%%%
%%%
-module(counting_stairs).

-export([climb_stairs/1]).

-include_lib("eunit/include/eunit.hrl").

-spec climb_stairs(N :: integer()) -> integer().
climb_stairs(0) -> 0;
climb_stairs(1) -> 1;
climb_stairs(2) -> 2;
climb_stairs(N) ->
    count(1, 2, N - 2).

count(A, B, N) when N > 0 -> count(B, A + B, N - 1);
count(_A, B, _N) -> B.

climb_1_test() ->
    8 = climb_stairs(5).
climb_2_test() ->
    3 = climb_stairs(3).
climb_3_test() ->
    1836311903 = climb_stairs(45).