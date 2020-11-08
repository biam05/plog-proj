% coordenadas do tabuleiro
coordinates:-
    write('  A      B       C       D       E       F       G       H       I       J       K       L       M').

% inicialização do array com o estado inicial de jogo
initial([
    [empty],
    [empty],
    [empty],
    [empty],
    [empty],
    [empty],
    [empty],
    [empty],
    [empty],
    [empty],
    [empty],
    [empty]
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
display_game([Head|Tail],Player,Number) :-
    write('\t\t\t'),
    printLine(Head),nl,
    Number1 is Number + 1,
    write(Number1),nl,
    Player1 is Player + 1,
    Player2 is mod(Player1,2),
    display_game(Tail,Player2,Number1).

display_game([],1,_).

display_game([],0,_).

display_game([],_,_) :-
    write('Wrong Player given\n').

% predicado para imprimir cada linha
printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    printLine(Tail).

printLine([]).

%predicado para imprimir o headers de dados de jogo do player1 (hardcoded by now)
displayHeader(0) :-
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 1'), nl,
    write('----------------------------------------------------------------------------'), nl,
    write('Victories: 0 '), nl,
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Purple & Green ; Purple : Orange & Purple ; Orange : Green & Orange'), nl,
    write('----------------------------------------------------------------------------'), nl, nl.

%predicado para imprimir o headers de dados de jogo do playe2 (hardcoded by now)
displayHeader(1) :-
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 2'), nl,
    write('----------------------------------------------------------------------------'), nl,
    write('Victories: 0 '), nl,
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Orange & Green ; Purple : Green & Purple ; Orange : Purple & Orange'), nl, nl.

displayHeader(_) :-
    write('Wrong Player Name').