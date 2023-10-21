%%Leet Code exercise
%%46. Permutations
%%
%%Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.
%%Example 1:
%%Input: nums = [1,2,3]
%%Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
%%Example 2:
%%
%%Input: nums = [0,1]
%%Output: [[0,1],[1,0]]
%%Example 3:
%%
%%Input: nums = [1]
%%Output: [[1]]
%%
%%Constraints:
%%1 <= nums.length <= 6
%%-10 <= nums[i] <= 10
%%All the integers of nums are unique.

-module(permute).

-export([permute/1]).

-include_lib("eunit/include/eunit.hrl").

-spec permute(Nums :: [integer()]) -> [[integer()]].
permute([]) -> [[]];
permute(Nums) ->
  [[H|T] || H <- Nums, T <- permute(Nums--[H])].

permute_test() ->
    [[1]] = permute([1]).
permute2_test() ->
    [[0,1], [1,0]] = permute([0,1]).
permute3_test() ->
    [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]] = permute([1,2,3]).