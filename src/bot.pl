:- use_module(library(random)).
:- use_module(library(lists)).


% Generates a Random Move for the bot
random_bot(GameState,RandomMove,RandomColor):-
    achata_lista(GameState, Flat),
    random_member(RandomMove, Flat),
    random_member(RandomColor, [1,2,3]).

