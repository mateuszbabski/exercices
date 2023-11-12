%%  Leet code exercise
%%  217. Contains Duplicate
%%
%%  Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
%%
%%
%%
%%  Example 1:
%%
%%  Input: nums = [1,2,3,1]
%%  Output: true
%%  Example 2:
%%
%%  Input: nums = [1,2,3,4]
%%  Output: false
%%  Example 3:
%%
%%  Input: nums = [1,1,1,3,3,4,3,2,4,2]
%%  Output: true
%% 
%%
%%  Constraints:
%%
%%  1 <= nums.length <= 105
%%  -109 <= nums[i] <= 109

-module(contains_duplicate).

-export([contains_duplicate/1]).

-include_lib("eunit/include/eunit.hrl").

-spec contains_duplicate(Nums :: [integer()]) -> boolean().
contains_duplicate(Nums) ->
  case Nums =:= lists:uniq(Nums) of
    true -> false;
    _ -> true
  end.

contains_duplicate_test() ->
    true = contains_duplicate([1,2,3,1]),
    false = contains_duplicate([1,2,3,4]),
    true = contains_duplicate([1,1,1,3,3,4,3,2,4,2]).