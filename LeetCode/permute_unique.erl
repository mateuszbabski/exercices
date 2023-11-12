%%  Leet code exercise
%%  47. Permutations II
%%
%%  Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.
%%  Example 1:
%%
%%  Input: nums = [1,1,2]
%%  Output:
%%  [[1,1,2],
%%  [1,2,1],
%%  [2,1,1]]
%%  Example 2:
%%
%%  Input: nums = [1,2,3]
%%  Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]] 
%%
%%  Constraints:
%%
%%  1 <= nums.length <= 8
%%  -10 <= nums[i] <= 10

-module(permute_unique).

-export([permute_unique/1]).

-include_lib("eunit/include/eunit.hrl").

-spec permute_unique(Nums :: [integer()]) -> [[integer()]].
permute_unique([]) -> [[]];
permute_unique(Nums) ->
    lists:usort([[H|T] || H <- Nums, T <- permute_unique(Nums--[H])]).

permute_test() ->
    [[1,1,2],[1,2,1],[2,1,1]] = permute_unique([1, 1, 2]).
