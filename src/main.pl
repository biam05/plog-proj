% Main Predicate of the game
% Calls display_game(GameState,Player).
% play/0. 

% Displays the game 
% display_game(GameState,Player).

% Returns the initial state of the game
% initial(GameState).

% inicialização do array com o estado inicial de jogo
initial([
    [empty,  empty,    empty,    empty,    empty,    empty,    empty,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    empty,    empty,    empty ,   empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall,    empty,    empty,    empty],
    [empty,  empty,    gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall,    empty,    empty],
    [empty,  gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall,   empty],
    [gWall,  position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall],
    [empty,  empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    empty],
    [pWall,  position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,     position, gWall],
    [empty,  pWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, gWall,    empty],    
    [empty,  empty,    pWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, gWall,    empty,    empty],
    [empty,  empty,    empty,    pWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, gWall,    empty,    empty,    empty],  
    [empty,  empty,    empty,    empty,    pWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, gWall,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    empty,    empty,    empty,    empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    empty,    empty,    empty,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty]
]).

% inicialização do array com o estado intermédio de jogo
intermediate([
    [empty,  empty,    empty,    empty,    empty,    empty,    empty,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    empty,    empty,    empty ,   empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall,    empty,    empty,    empty],
    [empty,  empty,    gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall,    empty,    empty],
    [empty,  gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    purple,   pWall,   empty],
    [gWall,  position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    green,    empty,    position, pWall],
    [empty,  empty,    position, empty,    position, empty,    position, empty,    purple,   empty,    purple,   empty,    green,    empty,    green,    empty,    purple,   empty,    position, empty,    purple,   empty,    position, empty,    empty],
    [pWall,  position, empty,    position, empty,    position, empty,    purple,   empty,    position, empty,    position, empty,    position, empty,    position, empty,    green,    empty,    green,    empty,    position, empty,     position, gWall],
    [empty,  pWall,    position, empty,    position, empty,    green,    empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, gWall,    empty],    
    [empty,  empty,    pWall,    purple  , empty,    purple,   empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, gWall,    empty,    empty],
    [empty,  empty,    empty,    pWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, gWall,    empty,    empty,    empty],  
    [empty,  empty,    empty,    empty,    pWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, gWall,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    empty,    empty,    empty,    empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    empty,    empty,    empty,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty]
]).

% inicialização do array com o estado final de jogo
final([
    [empty,  empty,    empty,    empty,    empty,    empty,    empty,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    empty,    empty,    empty ,   empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall,    empty,    empty,    empty],
    [empty,  empty,    gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, pWall,    empty,    empty],
    [empty,  gWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    purple,   pWall,   empty],
    [gWall,  orange,   empty,    green,    empty,    orange,   empty,    green,    empty,    orange,   empty,    green,    empty,    position, empty,    position, empty,    position, empty,    position, empty,    green,    empty,    position, pWall],
    [empty,  empty,    position, empty,    position, empty,    position, empty,    purple,   empty,    purple,   empty,    green,    empty,    green,    empty,    purple,   empty,    position, empty,    purple,   empty,    position, empty,    empty],
    [pWall,  position, empty,    position, empty,    position, empty,    purple,   empty,    position, empty,    position, empty,    orange,   empty,    position, empty,    green,    empty,    green,    empty,    position, empty,     position, gWall],
    [empty,  pWall,    position, empty,    position, empty,    green,    empty,    position, empty,    position, empty,    position, empty,    orange,   empty,    position, empty,    position, empty,    position, empty,    position, gWall,    empty],    
    [empty,  empty,    pWall,    purple  , empty,    purple,   empty,    position, empty,    position, empty,    position, empty,    position, empty,    orange,   empty,    position, empty,    position, empty,    position, gWall,    empty,    empty],
    [empty,  empty,    empty,    pWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    green,    empty,    orange,   empty,    green,    gWall,    empty,    empty,    empty],  
    [empty,  empty,    empty,    empty,    pWall,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, gWall,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    empty,    empty,    empty,    empty,    position, empty,    position, empty,    position, empty,    position, empty,    position, empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty],
    [empty,  empty,    empty,    empty,    empty,    empty,    empty,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    oWall,    empty,    empty,    empty,    empty,    empty,    empty,    empty,    empty]
]).


% Funções para dar draw e cada elemento
symbol(position, S)    :- S='_'.
symbol(empty, S)       :- S=' '.
symbol(green, S)       :- S='g'.
symbol(purple, S)      :- S='p'.
symbol(orange, S)      :- S='o'.
symbol(gWall, S)       :- S='G'.
symbol(pWall, S)       :- S='P'.
symbol(oWall, S)       :- S='O'.

% Funcão para percorrer a lista
display_game([Head|Tail],Player) :-
    write('\t\t\t'),
    printLine(Head),
    nl,
    display_game(Tail,Player).

display_game([],player1) :-
    write('Next turn for Player1').

display_game([],player2) :-
    write('Next turn for Player2').

display_game([],_) :-
    write('Wrong Player given\n').


printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    printLine(Tail).

printLine([]).

displayHeader(player1) :-
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 1'), nl,
    write('----------------------------------------------------------------------------'), nl,
    write('Victories: 0 '), nl,
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Purple & Green ; Purple : Orange & Purple ; Orange : Green & Orange'), nl,
    write('----------------------------------------------------------------------------'), nl, nl.

displayHeader(player2) :-
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 2'), nl,
    write('----------------------------------------------------------------------------'), nl,
    write('Victories: 0 '), nl,
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Orange & Green ; Purple : Green & Purple ; Orange : Purple & Orange'), nl, nl.

displayHeader(_) :-
    write('Wrong Player Name').

/*
play :-
    write('INITIAL BOARD\n\n'),
    initial(InitialState),    
    displayHeader(player1),
    display_game(InitialState,player1),
    displayHeader(player2),
    write('\n\nINTERMEDIATE BOARD\n\n'),
    intermediate(IntermediateState),
    display_game(IntermediateState,player1),
    write('\n\nFINAL BOARD\n\n'),
    final(FinalState),
    display_game(FinalState,player1).
*/

play :-
    displayHeader(player1),
    displayHeader(player2),
    initial(InitialState),    
    intermediate(IntermediateState),
    final(FinalState),
    write('\n\nINITIAL BOARD\n\n'),
    display_game(InitialState,player1),
    write('\n\nINTERMEDIATE BOARD\n\n'),
    display_game(IntermediateState,player1),
    write('\n\nFINAL BOARD\n\n'),
    display_game(FinalState,player1).


