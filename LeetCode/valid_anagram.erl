%%  Leet code exercise
%%  242. Valid anagram
%%
%%
%%Given two strings s and t, return true if t is an anagram of s, and false otherwise.
%%
%%An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
%%
%% 
%%
%%Example 1:
%%
%%Input: s = "anagram", t = "nagaram"
%%Output: true
%%Example 2:
%%
%%Input: s = "rat", t = "car"
%%Output: false
%% 
%%
%%Constraints:
%%
%%1 <= s.length, t.length <= 5 * 104
%%s and t consist of lowercase English letters.
%% 
%%
%%Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?

-module(valid_anagram).

-include_lib("eunit/include/eunit.hrl").

-export([is_anagram/2]).

-spec is_anagram(Subject :: unicode:unicode_binary(), Candidate :: unicode:unicode_binary()) -> boolean().
is_anagram(Subject, Candidate) ->
    Sorted_Subj = lists:sort(binary_to_list(Subject)),
    Sorted_Head = lists:sort(binary_to_list(Candidate)),
    
    Sorted_Subj =:= Sorted_Head.