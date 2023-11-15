%%  Leet code exercise
%%  60. Permutation sequence
%%
%%  The set [1, 2, 3, ..., n] contains a total of n! unique permutations.
%%
%%  By listing and labeling all of the permutations in order, we get the following sequence for n = 3:
%%
%%  "123"
%%  "132"
%%  "213"
%%  "231"
%%  "312"
%%  "321"
%%  Given n and k, return the kth permutation sequence.
%%
%%  Example 1:
%%
%%  Input: n = 3, k = 3
%%  Output: "213"
%%  Example 2:
%%
%%  Input: n = 4, k = 9
%%  Output: "2314"
%%  Example 3:
%%
%%  Input: n = 3, k = 1
%%  Output: "123"
%% 
%%  Constraints:
%%
%%  1 <= n <= 9
%%  1 <= k <= n!

-module(get_permutation).

-export([get_permutation/2, permute_unique/1]).

-include_lib("eunit/include/eunit.hrl").

-spec get_permutation(N :: integer(), K :: integer()) -> unicode:unicode_binary().
get_permutation(N, K) ->
    Nums = lists:seq(1, N),
    SortedList = permute_unique(Nums),
    NthElement = lists:nth(K, SortedList),
    lists:concat(NthElement).

-spec permute_unique(Nums :: [integer()]) -> [[integer()]].
permute_unique([]) -> [[]];
permute_unique(Nums) ->
    [[H|T] || H <- Nums, T <- permute_unique(Nums--[H])].

permute_test() ->
    "213" = get_permutation(3,3).

permute2_test() ->
    "2314" = get_permutation(4,9).

permute3_test() ->
    "123" = get_permutation(3,1).
