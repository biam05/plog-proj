
% Main Predicate of the game
% Calls display_game(GameState,Player).
% play/0. 

% Displays the game 
% display_game(GameState,Player).

% Returns the initial state of the game
% initial(GameState).~

/*
square :- 
    write(' ___ '), nl,
    put_code(9585), write('   '), put_code(9586), nl,
    put_code(9586), write('___'), put_code(9585).
*/

% inicialização do array com o estado inicial de jogo
initBoard :- [
    [empty,  empty,    empty,    empty,    empty, empty, empty, empty, orange, empty, orange, empty, orange, empty, orange, empty, empty, empty, empty, empty, empty, empty, empty],
    [empty,  empty,    empty,    empty,    empty, empty, empty, empty, position, empty, position, empty, position, empty, position, empty, empty, empty, empty, empty, empty, empty, empty],
    [empty,  empty,    empty,    empty,    green, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, purple, empty, empty, empty, empty],
    [empty,  empty,    empty,    green,    position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, purple, empty, empty, empty],
    [empty,  empty,    green,    position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, purple, empty, empty],
    [empty,  green,    position, empty,    position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, purple, empty],
    [green,  position, empty,    position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, purple],
    [empty,  empty,    position, empty,    position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, empty],
    [purple, position, empty,    position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, green],
    [empty,  purple,   position, empty,    position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, green, empty],    
    [empty,  empty,    purple,   position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, green, empty, empty],
    [empty,  empty,    empty,    purple,   position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, green, empty, empty, empty],  
    [empty,  empty,    empty,    empty,    purple, position, empty, position, empty, position, empty, position, empty, position, empty, position, empty, position, green, empty, empty, empty, empty],
    [empty,  empty,    empty,    empty,    empty, empty, empty, empty, position, empty, position, empty, position, empty, position, empty, empty, empty, empty, empty, empty, empty, empty],
    [empty,  empty,    empty,    empty,    empty, empty, empty, empty, orange, empty, orange, empty, orange, empty, orange, empty, empty, empty, empty, empty, empty, empty, empty],
].

% Board hard coded
printBoard :-
    write('        L L L L L        '),nl,
    write('        x x x x x        '),nl,
    write('    Gx x x x x x x xP    '),nl,
    write('   Gx x x x x x x x xP   '),nl,
    write('  Gx x x x x x x x x xP  '),nl,
    write(' Gx x x x x x x x x x xP '),nl,
    write('Gx x x x x x x x x x x xP'),nl,
    write('  x x x x x x x x x x x  '),nl,
    write('Px x x x x x x x x x x xG'),nl,
    write(' Px x x x x x x x x x xG '),nl,
    write('  Px x x x x x x x x xG  '),nl,
    write('   Px x x x x x x x xG   '),nl,
    write('    Px x x x x x x xG    '),nl,
    write('        x x x x x        '),nl,
    write('        L L L L L        '),nl.


% Funções para dar draw e cada elemento
symbol(position) :- write('x').
symbol(empty) :- write(' ').
symbol(greenPlayer) :- write('g').
symbol(purplePlayer) :- write('p').
symbol(orangePlayer) :- write('o').
symbol(green) :- write('G').
symbol(purple):- write('P').
symbol(orange) :- write('O').

% Funcão para percorrer a lista
looping([]).
looping([H|T]) :-
    symbol(H),
    looping(T).



