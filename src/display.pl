:- use_module(library(lists)).

coordinates :-
    write('     1| 2| 3| 4| 5| 6| 7| 8| 9|10|11|12|13|'), nl,
    write('------------------------------------------'), nl.
% inicialização do array com o estado inicial de jogo
initial([
    [gWall, a6, a8, oWall],
    [gWall, b5, b7, b9, oWall],
    [gWall, c4, c6, c8, c10, oWall],
    [gWall, d3, d5, d7, d9, d11, oWall],
    [gWall, e2, e4, e6, e8, e10, e12, oWall],
    [f3, f5, f7, f9, f11],
    [g2, g4, g6, g8, g10, g12],
    [pWall, h1, h3, h5, h7, h9, h11, h13, pWall],
    [pWall, i2, i4, i6, i8, i10, i12, pWall],
    [pWall, j1, j3, j5, j7, j9, j11, j13, pWall],
    [pWall, k2, k4, k6, k8, k10, k12, pWall],
    [pWall, l1, l3, l5, l7, l9, l11, l13, pWall],
    [pWall, m2, m4, m6, m8, m10, m12, pWall],
    [pWall, n1, n3, n5, n7, n9, n11, n13, pWall],
    [pWall, o2, o4, o6, o8, o10, o12, pWall],
    [pWall, p1, p3, p5, p7, p9, p11, p13, pWall],
    [q2, q4, q6, q8, q10, q12],
    [r3, r5, r7, r9, r11],
    [oWall, s2, s4, s6, s8, s10, s12, gWall],
    [oWall, t3, t5, t7, t9, t11, gWall],
    [oWall, u4, u6, u8, u10, gWall],
    [oWall, v5, v7, v9, gWall],
    [oWall, w6, w8, gWall]
]).

% colors
symbol(green, 'gg   ').
symbol(purple,'pp   ').
symbol(orange,'oo   ').
symbol(gWall, '').
symbol(pWall, '').
symbol(oWall, '').
symbol(o, ' ').
symbol(_, '__').

getletter(N, L) :- 
    Aux is 64 + N,
    char_code(L, Aux).

display_game(GameState,Player) :-
    Player2 is Player + 1,
    Player1 is mod(Player2, 2),
    write('before header\n'),
    displayHeader(Player),
    displayTurn(Player, Player1),
    repeat,
    getPosition(Column,Row,Color),
    %checkPosition(GameState,Column,Row),
    changeState(GameState,GameState2,Column,Row,Color),
    board(GameState2),
    display_game(GameState2,Player1).



% ------------------ INICIO DOS TESTES ----------------- 
display_game2([Head|Tail],Player,N) :-  
    getletter(N, L),
    write(L), write('|'),
    printBorder(L, Head),
    Number1 is N + 1,
    nl,
    display_game2(Tail,Player,Number1).

display_game2([],player1,_).

display_game2([],player2,_).

display_game2([],_,_) :-
    write('\n\nWrong Player given\n').

printBorder('A', L) :- write('               G'), printLine(L), write('O').
printBorder('B', L) :- write('            G'), printLine(L), write('O').
printBorder('C', L) :- write('         G'), printLine(L), write('O').
printBorder('D', L) :- write('      G'), printLine(L), write('O').
printBorder('E', L) :- write('   G'), printLine(L), write('O').
printBorder('F', L) :- write('        '), printLine(L).
printBorder('G', L) :- write('     '), printLine(L).
printBorder('H', L) :- write('P'), printLine(L), write('P').
printBorder('I', L) :- write('P   '), printLine(L), write('   P').
printBorder('J', L) :- write('P'), printLine(L), write('P').
printBorder('K', L) :- write('P   '), printLine(L), write('   P').
printBorder('L', L) :- write('P'), printLine(L), write('P').
printBorder('M', L) :- write('P   '), printLine(L), write('   P').
printBorder('N', L) :- write('P'), printLine(L), write('P').
printBorder('O', L) :- write('P   '), printLine(L), write('   P').
printBorder('P', L) :- write('P'), printLine(L), write('P').
printBorder('Q', L) :- write('     '), printLine(L).
printBorder('R', L) :- write('        '), printLine(L).
printBorder('S', L) :- write('   O'), printLine(L), write('G').
printBorder('T', L) :- write('      O'), printLine(L), write('G').
printBorder('U', L) :- write('         O'), printLine(L), write('G').
printBorder('V', L) :- write('            O'), printLine(L), write('G').
printBorder('W', L) :- write('               O'), printLine(L), write('G').

printBorder(_,_).

printLine([]).

% predicado para imprimir cada linha
printLine([Head|Tail]) :-
    symbol(Head, S),
    ((Head = gWall; Head = pWall; Head = oWall) -> write(S), write(' '); 
    ((Tail = [gWall]; Tail = [pWall]; Tail = [oWall]) -> write(S);
        (write(S), write('    ')))),
    printLine(Tail).

% ----------------- FIM DOS TESTES ----------------- 

displayTurn(Player1, Player2) :-
    format('~n~*t ~w ~w ~w ~w ~53|~n', [32, 'Player', Player1, 'Turn; Next: Player', Player2]).

display_game([],_) :-
    write('\n\nWrong Player given\n').


%predicado para imprimir o headers de dados de jogo do player1 (hardcoded by now)
displayHeader(0) :-
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 0'), nl,
    write('----------------------------------------------------------------------------'), nl,
    write('Victories: 0 '), nl,
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Purple & Green ; Purple : Orange & Purple ; Orange : Green & Orange'), nl,
    write('----------------------------------------------------------------------------'), nl, nl.

%predicado para imprimir o headers de dados de jogo do playe2 (hardcoded by now)
displayHeader(1) :-
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 1'), nl,
    write('----------------------------------------------------------------------------'), nl,
    write('Victories: 0 '), nl,
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Orange & Green ; Purple : Green & Purple ; Orange : Purple & Orange'), nl, nl.

%displayHeader(_) :-
 %   write('Wrong Player Name').

/*
board(L) :-
    nth0(0,L,L0),
    nth0(1,L,L1),
    nth0(2,L,L2),
    nth0(3,L,L3),
    nth0(4,L,L4),
    nth0(5,L,L5),
    nth0(6,L,L6),
    nth0(7,L,L7),
    nth0(8,L,L8),
    nth0(9,L,L9),
    nth0(10,L,L10),
    nth0(11,L,L11),
    nth0(12,L,L12),
    nth0(13,L,L13),
    nth0(14,L,L14),
    nth0(15,L,L15),
    nth0(16,L,L16),
    nth0(17,L,L17),
    nth0(18,L,L18),
    nth0(19,L,L19),
    nth0(20,L,L20),
    nth0(21,L,L21),
    nth0(22,L,L22),
    write('                GGGG    OOOO'),nl,
    format('             GGGG/~w\\__/~w\\OOOO~n',L0),
    format('          GGGG/~w\\__/~w\\__/~w\\OOOO~n',L1),
    format('       GGGG/~w\\__/~w\\__/~w\\__/~w\\OOOO~n',L2),
    format('    GGGG/~w\\__/~w\\__/~w\\__/~w\\__/~w\\OOOO~n',L3),
    format('    G/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\O~n',L4),
    format('    G\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/O~n',L5),
    format('   __/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__~n',L6),
    format(' P/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\P~n',L7),
    format(' P\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/P~n',L8),
    format(' P/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\P~n',L9),
    format(' P\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/P~n',L10),
    format(' P/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\P~n',L11),
    format(' P\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/P~n',L12),
    format(' P/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\P~n',L13),
    format(' P\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/P~n',L14),
    format(' P/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\P~n',L15),
    format(' P\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/P~n',L16),
    format('     \\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~n',L17),
    format('    O/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\G~n',L18),
    format('    O\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/G~n',L19),
    format('    OOOO\\__/~w\\__/~w\\__/~w\\__/~w\\__/GGGG~n',L20),
    format('       OOOO\\__/~w\\__/~w\\__/~w\\__/GGGG~n',L21),
    format('          OOOO\\__/~w\\__/~w\\__/GGGG~n',L22),
     write('             OOOO\\__/  \\__/GGGG'),nl,
     write('                OOOO    GGGG'),nl.
*/


replace(E,S,[],[]).
replace(E,S,[E|T1],[S|T2]):-replace(E,S,T1,T2).
replace(E,S,[H|T1],[H|T2]):-E\=H, replace(E,S,T1,T2).
     

getPosition(Column,Row,Color) :-
    write('Please Enter the column letter: '),
    read(Col),
    char_code(Col,Col2),
    Column is Col2 - 97,
    write('Please Enter the row number :'),
    read(Row),
    write('please Enter the color to be written'),
    read(Color),
    write(Column),nl,
    write(Row),nl.

checkPosition(GameState,Row,Column):-
    nth0(Row,GameState,Col),
    write(Col),nl,
    nth1(Column,Col,Val),
    write(Val),nl.


changeState(Initial,Final,Row,Column,Value) :-
    nth0(Row,Initial,Col),
    nth1(Column,Col,Val),!,
    select(Val,Col,Value,Changed),
    replace(Col,Changed,Initial,Final).

changeState(Initial,Final,Row,Column,Value) :-
    write('Error reading coordinates.\n'),
    write('Trying again\n'),
    fail.







