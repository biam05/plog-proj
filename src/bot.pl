:- use_module(library(random)).
:- use_module(library(lists)).


t:-
    initial(Initial),
    random_bot(Initial,Move,Color),
    write(Move),nl,
    write(Color).


% Generates a Random Move for the bot
random_bot(GameState,RandomMove,RandomColor):-
    achata_lista(GameState, Flat),
    random_member(RandomMove, Flat),
    random_member(RandomColor, [1,2,3]).


%random_between(0, 22, Rand),
%write(Rand),nl.