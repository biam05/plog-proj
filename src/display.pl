:- use_module(library(lists)).

% coordenadas do tabuleiro
coordinates:-
    write('     A   |   B   |   C   |   D   |   E   |   F   |   G   |   H   |   I   |   J   |   K   |   L   |   M'), nl,
    write('-----------------------------------------------------------------------------------------------------').

% inicialização do array com o estado inicial de jogo
initial([
    [f1, h1],
    [e2, g2, i2],
    [d3, f3, h3, j3],
    [c4, e4, g4, i4, k4],
    [b5, d5, f5, h5, j5, l5],
    [c6, e6, g6, i6, k6],
    [b7, d7, f7, h7, j7, l7],
    [a8, c8, e8, g8, i8, k8, m8],
    [b9, d9, f9, h9, j9, l9],
    [a10, c10, e10, g10, i10, k10, m10],
    [b11, d11, f11, h11, j11, l11],
    [a12, c12, e12, g12, i12, k12, m12],
    [b13, d13, f13, h13, j13, l13],
    [a14, c14, e14, g14, i14, k14, m14],
    [b15, d15, f15, h15, j15, l15],
    [a16, c16, e16, g16, i16, k16, m16],
    [b17, d17, f17, h17, j17, l17],
    [c18, e18, g18, i18, k18],
    [b19, d19, f19, h19, j19, l19],
    [c20, e20, g20, i20, k20],
    [d21, f21, h21, j21],
    [e22, g22, i22],
    [f23, h23]
]).

% predicados para dar draw e cada elemento
/*symbol(position, S)    :- S='_'.
symbol(empty, S)       :- S=' '.
symbol(green, S)       :- S='g'.
symbol(purple, S)      :- S='p'.
symbol(orange, S)      :- S='o'.
symbol(gWall, 'G ').
symbol(pWall, S)       :- S='P'.
symbol(oWall, S)       :- S='O'.
symbol(f, '                                      ').
symbol(horizontal, ' ___').
symbol(leftbar, '/').
symbol(rightbar, '\\').
symbol(newline, '\n').
symbol(f1, '   ').*/

symbol(green, 'g').
symbol(purple,'p').
symbol(orange,'o').
symbol(gWall, 'G').
symbol(pWall, 'P').
symbol(oWall, 'O').
symbol(_, ' ').


% predicado para percorrer a lista
/*display_game([Head|Tail],Player,Number) :-
    write('\t\t\t'),
    nl,
    Number1 is Number + 1,
    write(Number1), write(' |'),
    printLine(Head),
    Player2 is Player + 1,
    Player1 is mod(Player2,2) + 1,
    nl, write('---'),
    display_game(Tail,Player,Number1).*/

display_game([Head|Tail],Player,Number) :-
    printLine(Head),
    display_game(Tail, Player, Number).

/*display_game(_,Player,_) :-
    Player1 is Player + 1,
    format('~n~*t ~w ~w ~w ~w ~53|~n', [32, 'Player', Player, 'Turn; Next: Player', Player1]).

display_game([],_,_) :-
    write('\n\nWrong Player given\n').*/

% predicado para imprimir cada linha
/*printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    printLine(Tail).*/

printLine([Head|Tail]) :-
    Head,
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

/*form :-
     write('                __    __'),nl,
    format('             __/ ~w\\__/ ~w\\__~n',['2','2']),
    format('          __/ ~w\\__/ ~w\\__/ ~w\\__~n',['3','3','3']),
    format('       __/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__~n',['4','4','4','4']),
    format('    __/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__~n',['5','5','5','5','5']),
    format('   / ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['6','6','6','6','6','6']),
    format('   \\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['5','5','5','5','5']),
    format(' __/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__~n',['6','6','6','6','6','6']),
    format('/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['7','7','7','7','7','7','7']),
    format('\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['6','6','6','6','6','6']),
    format('/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['7','7','7','7','7','7','7']),
    format('\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['6','6','6','6','6','6']),
    format('/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['7','7','7','7','7','7','7']),
    format('\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['6','6','6','6','6','6']),
    format('/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['7','7','7','7','7','7','7']),
    format('\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['6','6','6','6','6','6']),
    format('/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['7','7','7','7','7','7','7']),
    format('\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['6','6','6','6','6','6']),
    format('   \\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['5','5','5','5','5']),
    format('   / ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['6','6','6','6','6','6']),
    format('   \\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['5','5','5','5','5']),
    format('      \\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['4','4','4','4']),
    format('         \\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['3','3','3']),
    format('            \\__/ ~w\\__/ ~w\\__/~n',['2','2']),
     write('               \\__/  \\__/'),nl.
*/

form([
    [write('                            __    __')],
    [format('             __/ ~w\\__/ ~w\\__~n',['2','2'])],
    [format('          __/ ~w\\__/ ~w\\__/ ~w\\__~n',['3','3','3'])],
    [format('       __/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__~n',['4','4','4','4'])],
    [format('    __/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__~n',['5','5','5','5','5'])],
    [format('   / ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['6','6','6','6','6','6'])],
    [format('   \\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['5','5','5','5','5'])],
    [format(' __/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__~n',['6','6','6','6','6','6'])],
    [format('/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['7','7','7','7','7','7','7'])],
    [format('\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['6','6','6','6','6','6'])],
    [format('/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['7','7','7','7','7','7','7'])],
    [format('\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['6','6','6','6','6','6'])],
    [format('/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['7','7','7','7','7','7','7'])],
    [format('\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['6','6','6','6','6','6'])],
    [format('/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['7','7','7','7','7','7','7'])],
    [format('\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['6','6','6','6','6','6'])],
    [format('/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['7','7','7','7','7','7','7'])],
    [format('\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['6','6','6','6','6','6'])],
    [format('   \\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['5','5','5','5','5'])],
    [format('   / ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\~n',['6','6','6','6','6','6'])],
    [format('   \\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['5','5','5','5','5'])],
    [format('      \\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['4','4','4','4'])],
    [format('         \\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',['3','3','3'])],
    [format('            \\__/ ~w\\__/ ~w\\__/~n',['2','2'])],
    [write('               \\__/  \\__/')]
]).
    