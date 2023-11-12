-module(isbn_verifier).

-export([is_valid/1]).

is_valid(Isbn) ->
    FormattedIsbn = flatten(Isbn),
    RegExpression = "^[0-9]{9}[0-9X]{1}$",
    case re:run(FormattedIsbn, RegExpression) of
        {match, _Captured} -> check_isbn(FormattedIsbn);
        nomatch -> false
    end.

check_isbn(Number) ->
    ParsedNumbers = lists:map(fun parse/1, Number),
    check_isbn(ParsedNumbers, 10, 0).

check_isbn([], _, Result) -> Result rem 11 == 0;

check_isbn([H|T], Multiply, Result) ->
    check_isbn(T, Multiply - 1, Result + (H * Multiply)).

parse($X) -> 10;
parse(D) -> D - 48.

flatten(String) -> 
    TruncString = string:replace(String, "-", "", all),
    lists:reverse(flatten(TruncString,[])).

flatten([],Acc) -> Acc;
flatten([H|T],Acc) when is_list(H) -> flatten(T, flatten(H,Acc));
flatten([H|T],Acc) -> flatten(T,[H|Acc]).