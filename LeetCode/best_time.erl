%%%%%%%%%%%%%%%%
%  Leet code exercise
%  121. Best time to buy and sell stock
%
% You are given an array prices where prices[i] is the price of a given stock on the ith day.
%
% You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
%
% Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
%
% 
%
% Example 1:
%
% Input: prices = [7,1,5,3,6,4]
% Output: 5
% Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
% Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
% Example 2:
%
% Input: prices = [7,6,4,3,1]
% Output: 0
% Explanation: In this case, no transactions are done and the max profit = 0.
%
%
% Constraints:
%
% 1 <= prices.length <= 105
% 0 <= prices[i] <= 104
%
%%%%%%%%%%%%%%%%
-module(best_time).

-export([max_profit/1]).

-include_lib("eunit/include/eunit.hrl").

-spec max_profit(Prices :: [integer()]) -> integer().
max_profit([Price | Prices]) ->
    calc(Prices, Price, 0).

calc([Price | Prices], Min, Acc) when Price > Min ->
    calc(Prices, Min, max(Acc, Price-Min));
calc([Price | Prices], Min, Acc) ->
    calc(Prices, Price, Acc);
calc([], Min, Acc) ->
    Acc.

best_time1_test() ->
    0 = max_profit([7,6,4,3,1]).
best_time2_test() ->
    5 = max_profit([7, 1, 5, 3, 6, 4]).
best_time3_test() ->
    2 = max_profit([2, 4, 1]).


