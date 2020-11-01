
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


% predicados para dar draw e cada elemento
symbol(position, S)    :- S='_'.
symbol(empty, S)       :- S=' '.
symbol(green, S)       :- S='g'.
symbol(purple, S)      :- S='p'.
symbol(orange, S)      :- S='o'.
symbol(gWall, S)       :- S='G'.
symbol(pWall, S)       :- S='P'.
symbol(oWall, S)       :- S='O'.

% predicado para percorrer a lista
display_game([Head|Tail],Player) :-
    write('\t\t\t'),
    printLine(Head),
    nl,
    display_game(Tail,Player).

display_game([],player1).

display_game([],player2).

display_game([],_) :-
    write('Wrong Player given\n').

% predicado para imprimir cada linha
printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    printLine(Tail).

printLine([]).

%predicado para imprimir o headers de dados de jogo do player1 (hardcoded by now)
displayHeader(player1) :-
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 1'), nl,
    write('----------------------------------------------------------------------------'), nl,
    write('Victories: 0 '), nl,
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Purple & Green ; Purple : Orange & Purple ; Orange : Green & Orange'), nl,
    write('----------------------------------------------------------------------------'), nl, nl.

%predicado para imprimir o headers de dados de jogo do playe2 (hardcoded by now)
displayHeader(player2) :-
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 2'), nl,
    write('----------------------------------------------------------------------------'), nl,
    write('Victories: 0 '), nl,
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Orange & Green ; Purple : Green & Purple ; Orange : Purple & Orange'), nl, nl.

displayHeader(_) :-
    write('Wrong Player Name').

% Predicado que permite correr o jogo
% De momento está hardcoded para mostar os headers no inicio e os estados de jogo pedidos
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
    write('\nPlayer2 won 1 color! One more to go!!\n\n'),
    write('\n\nFINAL BOARD\n\n'),
    display_game(FinalState,player1),
    write('\nPlayer2 Victory!!').


