:- use_module(library(lists)).

% inicialização do array com o estado inicial de jogo
initial([
    ['a1', 'a2'],
    ['b1', 'b2', 'b3'],
    ['c1', 'c2', 'c3', 'c4'],
    ['d1', 'd2', 'd3', 'd4', 'd5'],
    ['e1', 'e2', 'e3', 'e4', 'e5', 'e6'],
    ['f1', 'f2', 'f3', 'f4', 'f5'],
    ['g1', 'g2', 'g3', 'g4', 'g5', 'g6'],
    ['h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'h7'],
    ['i1', 'i2', 'i3', 'i4', 'i5', 'i6'],
    ['j1', 'j2', 'j3', 'j4', 'j5', 'j6', 'j7'],
    ['k1', 'k2', 'k3', 'k4', 'k5', 'k6'],
    ['l1', 'l2', 'l3', 'l4', 'l5', 'l6', 'l7'],
    ['m1', 'm2', 'm3', 'm4', 'm5', 'm6'],
    ['n1', 'n2', 'n3', 'n4', 'n5', 'n6', 'n7'],
    ['o1', 'o2', 'o3', 'o4', 'o5', 'o6'],
    ['p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7'],
    ['q1', 'q2', 'q3', 'q4', 'q5', 'q6'],
    ['r1', 'r2', 'r3', 'r4', 'r5'],
    ['s1', 's2', 's3', 's4', 's5', 's6'],
    ['t1', 't2', 't3', 't4', 't5'],
    ['u1', 'u2', 'u3', 'u4'],
    ['v1', 'v2', 'v3'],
    ['w1', 'w2']
]).

% colors
symbol(green, 'g').
symbol(purple,'p').
symbol(orange,'o').
symbol(gWall, 'G').
symbol(pWall, 'P').
symbol(oWall, 'O').

display_game(GameState,Player) :-
    Player2 is Player + 1,
    Player1 is mod(Player2, 2),
    write('before header\n'),
    displayHeader(Player),
    displayTurn(Player, Player1),
    getPosition(Column,Row,Color),
    write('gonna check now\n'),
    checkPosition(GameState,Column,Row),
    write(Row),nl,
    write(Column),nl,
    write('checkPassed\n'),
    changeState(GameState,GameState2,Column,Row,Color),
    write('state changed\n'),
    board(GameState2),
    display_game(GameState2,Player1).


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
    write('                 GGGG    OOOO'),nl,
    format('              GGGG/~w\\__/~w\\OOOO~n',L0),
    format('           GGGG/~w\\__/~w\\__/~w\\OOOO~n',L1),
    format('        GGGG/~w\\__/~w\\__/~w\\__/~w\\OOOO~n',L2),
    format('     GGGG/~w\\__/~w\\__/~w\\__/~w\\__/~w\\OOOO~n',L3),
    format('     G/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\O~n',L4),
    format('     G\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/O~n',L5),
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
    nth1(Column,Col,Val),
    select(Val,Col,Value,Changed),
    replace(Col,Changed,Initial,Final).







