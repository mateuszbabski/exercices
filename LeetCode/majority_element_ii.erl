%%  Leet code exercise
%%  229. Majority Element II
%%
%%  Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
%%
%%  The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.
%%
%%  Example 1:
%%
%%  Input: nums = [3,2,3]
%%  Output: [3]
%%
%%  Example 2:
%%
%%  Input: nums = [1]
%%  Output: [1]
%% 
%%  Example 3:
%%
%%  Input: nums = [1,2]
%%  Output: [1,2]
%%
%%  Constraints:
%%
%%  1 <= nums.length <= 5 * 104
%%  -109 <= nums[i] <= 109

-module(majority_element_ii).

-export([majority_element/1, majority/1]).

-include_lib("eunit/include/eunit.hrl").

-spec majority_element(Nums :: [integer()]) -> integer().
majority_element(Nums) ->
  Length = length(Nums),
  Occurrences = frequencies(Nums),
  find_keys(Occurrences, Length div 3).

frequencies(List) -> 
    frequencies(List, #{}).

frequencies([], Freq) ->
    maps:to_list(Freq);
frequencies([H|T], Freq) ->
    Incrementer = fun(Count) -> Count+1 end,
    NewFreq = maps:update_with(H, Incrementer, _Default=1, Freq),
    frequencies(T,NewFreq).

find_keys(List, Condition) ->
    find_keys(List, Condition, []).
find_keys([], _Condition, Result) -> lists:reverse(Result);
find_keys([H|T], Condition, Result) ->
    case H of
        {K, V} -> 
            case V > Condition of
                true -> 
                    find_keys(T,Condition,[K|Result]);
                _ -> 
                    find_keys(T, Condition, Result)
            end;
        _ -> find_keys(T, Condition)
    end.

majority1_test() ->
    [3] = majority_element([3,2,3]).

majority2_test() ->
    [1, 2] = majority_element([2,2,1,1,1,2,2]).

majority3_test() ->
    [1] = majority_element([1,1,1,1,1,2,2]).

majority4_test() ->
    [1, 2] = majority_element([1,2]).