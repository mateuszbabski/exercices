%%  Leet code exercise
%%  169. Majority Element
%%
%%
%%  Given an array nums of size n, return the majority element.
%%
%%  The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.
%%
%%
%%  Example 1:
%%
%%  Input: nums = [3,2,3]
%%  Output: 3
%%  Example 2:
%%
%%  Input: nums = [2,2,1,1,1,2,2]
%%  Output: 2
%% 
%%
%%  Constraints:
%%
%%  n == nums.length
%%  1 <= n <= 5 * 104
%%  -109 <= nums[i] <= 109

-module(majority_element).

-export([majority_element/1, majority/1]).

-include_lib("eunit/include/eunit.hrl").

-spec majority_element(Nums :: [integer()]) -> integer().
majority_element(Nums) ->
  Length = length(Nums),
  Occurrences = frequencies(Nums),
  find_key(Occurrences, Length div 2).

frequencies(List) -> 
    frequencies(List, #{}).

frequencies([], Freq) ->
    maps:to_list(Freq);
frequencies([H|T], Freq) ->
    Incrementer = fun(Count) -> Count+1 end,
    NewFreq = maps:update_with(H, Incrementer, _Default=1, Freq),
    frequencies(T,NewFreq).

find_key([H|T], Condition) ->
    case H of
        {K, V} -> 
            case V > Condition of
                true -> K;
                _ -> find_key(T, Condition)
            end;
        _ -> find_key(T, Condition)
    end.

% FASTER SOLUTION BUT MORE MEMORY USAGE
majority(N) ->
    [X|Xs] = lists:sort(N),

    Results = lists:foldl(
      fun (Elem, Acc) ->
        [R|Rest] = Acc,
        {Count, Type} = R,
        case Elem of
          Type -> [{Count + 1, Type}|Rest];
          _ -> [{1, Elem}|Acc]
        end
      end, [{1, X}], Xs),
      
    [{_, Num}|_] = lists:sort(
      fun(A, B) ->
        {A_size, _} = A,
        {B_size, _} = B,
        A_size > B_size
      end, Results),
      
    Num.

majority1_test() ->
    3 = majority_element([3,2,3]),
    3 = majority([3,2,3]).

majority2_test() ->
    2 = majority_element([2,2,1,1,1,2,2]),
    2 = majority([2,2,1,1,1,2,2]).

majority3_test() ->
    1 = majority_element([1,1,1,1,1,2,2]),
    1 = majority([1,1,1,1,1,2,2]).