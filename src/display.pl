:- use_module(library(lists)).
:- use_module(library(random)).
% inicialização do array com o estado inicial de jogo

% Gameboard with initial variables
initial([
    % P, G, O
    [2, 2, 2],
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



% colors used to display the board
symbol(green, 'g').
symbol(purple,'p').
symbol(orange,'o').
symbol(gWall, 'G').
symbol(pWall, 'P').
symbol(oWall, 'O').

display_game(GameState,Player) :-
    Player2 is Player + 1,
    Player1 is mod(Player2, 2),
    nth0(0,GameState,Victories),
    %write('before header\n'),
    displayHeader(Player, Victories),
    displayTurn(Player, Player1),
    repeat,
    get_user_input(Row,Column,Color),
    %write(1),
    %checkPosition(GameState,Column,Row),
    set_value(GameState,GameState2,Row,Column,Color),
    %write(2),
    add_color(Row,Column,Color),
    %write(3),
    add_connections(GameState,Row,Column),
    %write(4),
    board(GameState2),!,
    %write(5),nl,
    check_win(Player),
    %write(6),
    display_game(GameState2,Player1).

display_game2(GameState,Player) :-
    Player2 is Player + 1,
    Player1 is mod(Player2, 2),
    nth0(0,GameState,Victories),
    displayHeader(0, Victories),
    board(GameState),
    displayTurn(Player, Player1), 
    displayHeader(1, Victories).

% move(+GameState,+Move,-NewGameState)
move(GameState, Move, GameState2):-
    get_user_input(Row,Column,Color),
    valid_move(GameState,Row,Column),
    write(1),nl,
    set_value(GameState,GameState2,Row,Column,Color),
    write(2),nl,
    add_color(Row,Column,Color),
    write(3),nl,
    %trace,
    add_connections(Row,Column),
    write(5),nl.

move(GameState, Move, GameState2):- 
    move(GameState, Move, GameState2).


% Function used to display if this turn belongs to Player 0 or Player 1
displayTurn(Player1, Player2) :-
    format('~n~*t ~w ~w ~w ~w ~53|~n', [32, 'Player', Player1, 'Turn; Next: Player', Player2]).

display_game([],_) :-
    write('\n\nWrong Player given\n').


/*
    *   Function used to display Players 0's header
    *   Victories: number os colors won
    *   Win conditions: colors that can be used to win a certain color
*/
displayHeader(0, Victories) :-
    count(Victories, 0, X),
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 0'), nl,
    write('----------------------------------------------------------------------------'), nl,
    format('Victories: ~w~n', X),
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Purple & Green ; Purple : Orange & Purple ; Orange : Green & Orange'), nl,
    write('----------------------------------------------------------------------------'), nl, nl.

/*
    *   Function used to display Players 1's header
    *   Victories: number os colors won
    *   Win conditions: colors that can be used to win a certain color
*/
displayHeader(1, Victories) :-
    count(Victories, 1, X),
    write(X),
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 1'), nl,
    write('----------------------------------------------------------------------------'), nl,
    format('Victories: ~w~n', X),
    write('\t\t\t     Win Conditions'), nl,
    write('Green : Orange & Green ; Purple : Green & Purple ; Orange : Purple & Orange'), nl, nl.


% function to print the game board (EXPERIMENTAL VERSION)
board(L) :-
    nth0(1,L,L0),
    nth0(2,L,L1),
    nth0(3,L,L2),
    nth0(4,L,L3),
    nth0(5,L,L4),
    nth0(6,L,L5),
    nth0(7,L,L6),
    nth0(8,L,L7),
    nth0(9,L,L8),
    nth0(10,L,L9),
    nth0(11,L,L10),
    nth0(12,L,L11),
    nth0(13,L,L12),
    nth0(14,L,L13),
    nth0(15,L,L14),
    nth0(16,L,L15),
    nth0(17,L,L16),
    nth0(18,L,L17),
    nth0(19,L,L18),
    nth0(20,L,L19),
    nth0(21,L,L20),
    nth0(22,L,L21),
    nth0(23,L,L22),
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


/*
    *   Relation between the user's input and the color written in the board
    *       1       - purple  (pp)
    *       2       - green   (gg)
    *       3       - orange  (oo)
    *       other   - error
*/
value(1, 'pp').
value(2, 'gg').
value(3, 'oo').
value(_, '').

/*
    *   Function used to read the user's input
    *       Column  - column ('a' to 'w')
    *       Row     - row    ('1' to '13')
    *       Color   - color  ('1' - purple; '2' - green; '3' - orange)
*/
get_user_input(Column,Row,Color) :-
    write('Please Enter the column letter: '),
    read(Column),
    write('Please Enter the row number :'),
    read(Row),
    write('please Enter the color to be written (purple - 1; green - 2; orange - 3)'),
    read(Color),
    write(Column),nl,
    write(Row),nl.



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
/*
fu:-
    initial(Initial),
    random_bot(Initial,Move),!,
    %write(Move),nl,
    %validMove(Initial,a6).
*/
    

choose_move(GameState,_,_, Move,Color):-
    random_bot(GameState,Move,Color).


printStartingMenu :-
    nl, nl, nl,
    write('                       _ _ _                                           \n'),
    write('                 /\\   | | (_)                                         \n'),
    write('                /  \\  | | |_  __ _ _ __   ___ ___  ___                \n'),
    write('               / /\\ \\ | | | |/ _` | \'_ \\ / __/ _ \\/ __|           \n'),
    write('              / ____ \\| | | | (_| | | | | (_|  __/\\__ \\             \n'),
    write('             /_/    \\_\\_|_|_|\\__,_|_| |_|\\___\\___||___/           \n'),
    write('                                                                       \n'),
    write('                       _________________________                       \n'),
    write('                      |                         |                      \n'),
    write('                      | 1. Player vs Player     |                      \n'),
    write('                      |                         |                      \n'),
    write('                      | 2. Player vs Computer   |                      \n'),
    write('                      |                         |                      \n'),
    write('                      | 3. Computer vs Computer |                      \n'),
    write('                      |                         |                      \n'),
    write('                      | 0. Exit                 |                      \n'),
    write('                      |_________________________|                      \n').

printDifficultyMenu :-
    nl, nl, nl,
    write('                       _ _ _                                           \n'),
    write('                 /\\   | | (_)                                         \n'),
    write('                /  \\  | | |_  __ _ _ __   ___ ___  ___                \n'),
    write('               / /\\ \\ | | | |/ _` | \'_ \\ / __/ _ \\/ __|           \n'),
    write('              / ____ \\| | | | (_| | | | | (_|  __/\\__ \\             \n'),
    write('             /_/    \\_\\_|_|_|\\__,_|_| |_|\\___\\___||___/           \n'),
    write('                                                                       \n'),
    write('                       _________________________                       \n'),
    write('                      |                         |                      \n'),
    write('                      | 1. Easy                 |                      \n'),
    write('                      |                         |                      \n'),
    write('                      | 0. Exit                 |                      \n'),
    write('                      |_________________________|                      \n').





    












