-module(scrabble_score).

-export([score/1]).

-define(LETTER, [
    {"Q", 10},
    {"Z", 10},
    {"J", 8},
    {"X", 8},
    {"K", 5},
    {"F", 4},
    {"H", 4},
    {"V", 4},
    {"W", 4},
    {"Y", 4},
    {"B", 3},
    {"C", 3},
    {"M", 3},
    {"P", 3},
    {"D", 2},
    {"G", 2}
]).

score([]) -> 0;

score(Word) -> score(string:to_upper(Word), 0).

score([], Result) -> Result;

score([X | Tail] = _Word, Result) ->
    case proplists:get_value([X], ?LETTER) of
        undefined -> score(Tail, Result+1);
        Score -> score(Tail, Result+Score)
    end.