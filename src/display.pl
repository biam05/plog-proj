:- use_module(library(lists)).
:- use_module(library(random)).
% inicialização do array com o estado inicial de jogo

initial([
    ['a6', 'a8'],
    ['b5', 'b7', 'b9'],
    ['c4', 'c6', 'c8', 'c10'],
    ['d3', 'd5', 'd7', 'd9', 'd11'],
    ['e2', 'e4', 'e6', 'e8', 'e10', 'e12'],
    ['f3', 'f5', 'f7', 'f9', 'f11'],
    ['g2', 'g4', 'g6', 'g8', 'g10', 'g12'],
    ['h1', 'h3', 'h5', 'h7', 'h9', 'h11', 'h13'],
    ['i2', 'i4', 'i6', 'i8', 'i10', 'i12'],
    ['j1', 'j3', 'j5', 'j7', 'j9', 'j11', 'j13'],
    ['k2', 'k4', 'k6', 'k8', 'k10', 'k12'],
    ['l1', 'l3', 'l5', 'l7', 'l9', 'l11', 'l13'],
    ['m2', 'm4', 'm6', 'm8', 'm10', 'm12'],
    ['n1', 'n3', 'n5', 'n7', 'n9', 'n11', 'n13'],
    ['o2', 'o4', 'o6', 'o8', 'o10', 'o12'],
    ['p1', 'p3', 'p5', 'p7', 'p9', 'p11', 'p13'],
    ['q2', 'q4', 'q6', 'q8', 'q10', 'q12'],
    ['r3', 'r5', 'r7', 'r9', 'r11'],
    ['s2', 's4', 's6', 's8', 's10', 's12'],
    ['t3', 't5', 't7', 't9', 't11'],
    ['u4', 'u6', 'u8', 'u10'],
    ['v5', 'v7', 'v9'],
    ['w6', 'w8']
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
    repeat,
    getPosition(Row,Column,Color),
    write(1),
    %checkPosition(GameState,Column,Row),
    set_value(GameState,GameState2,Row,Column,Color),
    write(2),
    add_color(Row,Column,Color),
    write(3),
    add_connections(GameState,Row,Column),
    write(4),
    board(GameState2),!,
    write(5),nl,
    check_win(Player),
    write(6),
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


value(1, 'pp').
value(2, 'gg').
value(3, 'oo').
value(_, '').

getPosition(Column,Row,Color) :-
    write('Please Enter the column letter: '),
    read(Column),
    write('Please Enter the row number :'),
    read(Row),
    write('please Enter the color to be written (purple - 1; green - 2; orange - 3)'),
    read(Color),
    write(Column),nl,
    write(Row),nl.

get_coordinates(Row,Column,RowIndex,ColumnIndex) :-
    initial(Initial),
    char_code(Row,Row2),nl,
    RowIndex is Row2 - 97,
    nth0(RowIndex,Initial,Col),
    numberToAtom(Column,ColumnAtom),
    atom_concat(Row, ColumnAtom, X),
    nth0(ColumnIndex,Col,X).

find_value(GameState,RowIndex,ColumnIndex,Value) :-
    nth0(RowIndex,GameState,Col),
    nth0(ColumnIndex,Col,Value).

h:- 
    initial(Initial),
    get_value(Initial,p,5,Value),
    write(Value).

get_value(GameState,Row,Column,Value):-
    get_coordinates(Row,Column,RowIndex,ColumnIndex),
    value(Value, S),
    find_value(GameState,RowIndex,ColumnIndex,S).
    
a:-
    initial(GameState),
    write(GameState),
    get_coordinates(GameState,a,2,Index),
    write(Index).

set_value(Initial,Final,Row,Column,Value):-
    char_code(Row,Row2),
    RowNumber is Row2 - 97,
    nth0(RowNumber,Initial,Col),
    numberToAtom(Column,ColumnAtom),
    atom_concat(Row, ColumnAtom, X),
    select(X,Col,Value,Changed),
    select(Col,Initial,Changed,Final).

set_value(Initial,Final,Row,Column,Value) :-
    write('Error reading coordinates.\n'),
    write('Trying again\n'),
    fail.


get_adjacent(Row,Column,Adjacent):-
    char_code(Row,Row2),nl,
    RowIndex is Row2 - 97,
    adjacent(RowIndex,Column,Adj),
    filterAdjacent(Adj,[],Adjacent).

adjacent(Row,Column,Adj):-
    BRow is Row -1,
    BBRow is Row -2,
    NRow is Row +1,
    NNRow is Row +2,
    BColumn is Column -1,
    NColumn is Column +1,
    Adj = [(BRow-BColumn),(BRow-NColumn),(NRow-BColumn),(NRow-NColumn),(BBRow-Column),(NNRow-Column)].

filterAdjacent([],X,X).
filterAdjacent([H1-H2|T],Current,Final):-
    checkBounds(H1-H2),
    filterAdjacent(T,[H1-H2|Current],Final),!.

filterAdjacent([H1-H2|T],Current,Final):-
    filterAdjacent(T,Current,Final).

checkBounds(Row-Column):-
    initial(Initial),
    RowCode is Row + 97,
    char_code(Letter,RowCode),
    numberToAtom(Column,ColumnAtom),
    atom_concat(Letter, ColumnAtom, Position),
    nth0(Row,Initial,Col),
    member(Position,Col).


numberToAtom(Number,Atom):-
    number_chars(Number, CharList),
    nAtoms(CharList,Atom).

nAtoms([H,H2],Atom):-
    atom_concat(H,H2,Atom).

nAtoms([H],H).

letter_to_index(Letter,Index):-
    char_code(Letter,Number),
    Index is Number - 97.


index_to_letter(Index,Letter):-
    Code is Index + 97,
    char_code(Letter,Code).

get_position_string(Row,Column,Position):-
    numberToAtom(Column,ColumnAtom),
    atom_concat(Row, ColumnAtom, Position).


achata_lista([],[]).
achata_lista(X,[X]):- atomic(X).
achata_lista([Cab|Rest],L):-
    achata_lista(Cab,L1),
    achata_lista(Rest,L2),
    append(L1,L2,L). 

random_bot(GameState,RandomMove):-
    achata_lista(GameState, Flat),
    random_member(RandomMove, Flat).

validMove(GameState,Position):-
    name(Position,ListPosition),
    get_list_head(ListPosition,Row),
    RowNumber is Row - 97,
    nth0(RowNumber,GameState,Col),
    select(Position,Col,_).

get_list_head([H|_],H).

/*
checkBounds(Row-Column):-
    initial(Initial),
    RowCode is Row + 97,
    char_code(Letter,RowCode),
    numberToAtom(Column,ColumnAtom),
    atom_concat(Letter, ColumnAtom, Position),
    nth0(Row,Initial,Col),
    member(Position,Col).
*/

z:-
    initial(Initial),
    random_bot(Initial,Move),
    write(Move),nl,
    validMove(Initial,a5).











    












