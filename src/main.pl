
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


final([
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


% Board hard coded
/*initial :-
    write('        O O O O O        '),nl,
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
    write('        O O O O O        '),nl.
*/

/*intermediate :-
    write('        O O O O O        '),nl,
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
    write('        O O O O O        '),nl.
*/

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

display_game([],_) :-
    write('Wrong Player given\n').

display_game([],player1) :-
    write('Player1 turn').

display_game([],player2) :-
    write('Player2 turn').


printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    printLine(Tail).

printLine([]).

displayHeader(player1) :-
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 1'), nl,
    write('----------------------------------------------------------------------------'), nl,
    write('Victories: '), nl,
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Purple & Green ; Purple : Orange & Purple ; Orange : Green & Orange'), nl,
    write('----------------------------------------------------------------------------'), nl, nl.

displayHeader(player2) :-
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 2'), nl,
    write('----------------------------------------------------------------------------'), nl,
    write('Victories: '), nl,
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Orange & Green ; Purple : Green & Purple ; Orange : Purple & Orange'), nl, nl.

displayHeader(_) :-
    write('Wrong Player Name').

play :-
    final(GameState),
    displayHeader(player1),
    display_game(GameState,player1),
    displayHeader(player2).

