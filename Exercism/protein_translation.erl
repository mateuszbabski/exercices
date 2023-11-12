-module(protein_translation).

-export([proteins/1]).

-define(AMINO_ACIDS, [
    {"AUG", methionine},
    {"UGG", tryptophan},
    {"UUU", phenylalanine},
    {"UUC", phenylalanine},
    {"UUA", leucine},
    {"UUG", leucine},
    {"UCU", serine},
    {"UCC", serine},
    {"UCA", serine},
    {"UCG", serine},
    {"UAU", tyrosine},
    {"UAC", tyrosine},
    {"UGU", cysteine},
    {"UGC", cysteine},
    {"UAA", stop},
    {"UAG", stop},
    {"UGA", stop}
]).

proteins(Strand) -> proteins(Strand, []).

proteins([X, Y, Z | Tail], Names) ->
    case proplists:get_value([X, Y, Z], ?AMINO_ACIDS) of
        stop -> proteins([], Names);
        undefined -> {error, badarg};
        Protein -> proteins(Tail, [Protein | Names])
    end;

proteins([], Names) ->
    {ok, lists:reverse(Names)};

proteins(_, _) ->
    {error, badarg}.

% proteins(Strand) -> proteins(Strand, []).

% proteins([], Names) -> {ok, Names};

% proteins(Strand, Names) ->
%     case string:substr(Strand, 1, 3) of
%         "AUG" -> proteins(string:slice(Strand, 3), Names ++ [methionine]);
%         "UUU" -> proteins(string:slice(Strand, 3), Names ++ [phenylalanine]);
%         "UUC" -> proteins(string:slice(Strand, 3), Names ++ [phenylalanine]);
%         "UUA" -> proteins(string:slice(Strand, 3), Names ++ [leucine]);
%         "UUG" -> proteins(string:slice(Strand, 3), Names ++ [leucine]);
%         "UCU" -> proteins(string:slice(Strand, 3), Names ++ [serine]);
%         "UCC" -> proteins(string:slice(Strand, 3), Names ++ [serine]);
%         "UCA" -> proteins(string:slice(Strand, 3), Names ++ [serine]);
%         "UCG" -> proteins(string:slice(Strand, 3), Names ++ [serine]);
%         "UAU" -> proteins(string:slice(Strand, 3), Names ++ [tyrosine]);
%         "UAC" -> proteins(string:slice(Strand, 3), Names ++ [tyrosine]);
%         "UGU" -> proteins(string:slice(Strand, 3), Names ++ [cysteine]);
%         "UGC" -> proteins(string:slice(Strand, 3), Names ++ [cysteine]);
%         "UGG" -> proteins(string:slice(Strand, 3), Names ++ [tryptophan]);
%         "UAA" -> {ok, Names};
%         "UAG" -> {ok, Names};
%         "UGA" -> {ok, Names};
%         _ -> {error, badarg}
%     end.
