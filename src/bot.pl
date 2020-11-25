:- use_module(library(random)).
:- use_module(library(lists)).


t:-
    initial(Initial),
    random_bot(Initial,Move),
    write(Move).


random_bot(GameState,RandomMove):-
    achata_lista(GameState, Flat),
    random_member(RandomMove, Flat).



%random_between(0, 22, Rand),
%write(Rand),nl.
