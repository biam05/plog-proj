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

display_game(L,Player) :-
    displayHeader(Player),
    Player2 is Player + 1,
    Player1 is mod(Player2, 2),
    board(L),
    displayTurn(Player, Player2),
    displayHeader(Player2).
    
display_game(_,_).

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

displayHeader(_) :-
    write('Wrong Player Name').

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
    write('                __    __'),nl,
    format('             __/~w\\__/~w\\__~n',L0),
    format('          __/~w\\__/~w\\__/~w\\__~n',L1),
    format('       __/~w\\__/~w\\__/~w\\__/~w\\__~n',L2),
    format('    __/~w\\__ ~w\\__/~w\\__/~w\\__/~w\\__~n',L3),
    format('   /~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\~n',L4),
    format('   \\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~n',L5),
    format(' __/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__~n',L6),
    format('/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\~n',L7),
    format('\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~n',L8),
    format('/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\~n',L9),
    format('\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~n',L10),
    format('/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\~n',L11),
    format('\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~n',L12),
    format('/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\~n',L13),
    format('\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~n',L14),
    format('/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\~n',L15),
    format('\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~n',L16),
    format('   \\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~n',L17),
    format('   /~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\~n',L18),
    format('   \\__/~w\\__/~w\\__/~w\\__/~w\\__/~w\\__/~n',L19),
    format('      \\__/~w\\__/~w\\__/~w\\__/~w\\__/~n',L20),
    format('         \\__/~w\\__/~w\\__/~w\\__/~n',L21),
    format('            \\__/~w\\__/~w\\__/~n',L22),
     write('               \\__/  \\__/'),nl.
     

    