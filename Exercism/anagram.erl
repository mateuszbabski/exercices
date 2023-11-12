-module(anagram).

-export([find_anagrams/2]).

find_anagrams(Subject, Candidates) -> find_anagrams(Subject, Candidates, []).

find_anagrams(Subject, [], Result) -> Result;

find_anagrams(Subject, [H | T], Result) -> 
    Sorted_Subj = lists:sort(string:lowercase(Subject)),
    Sorted_Head = lists:sort(string:lowercase(H)),
    
    case string:lowercase(Subject) == string:lowercase(H) of
        true -> find_anagrams(Subject, T, Result);
        _ -> case Sorted_Subj == Sorted_Head of
                  true -> find_anagrams(Subject, T, [H | Result]);
                  _ -> find_anagrams(Subject, T, Result)
             end
    end.