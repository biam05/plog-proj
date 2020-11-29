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
    displayHeader(0, Victories),
    board(GameState),
    displayTurn(Player, Player1), 
    displayHeader(1, Victories).

% move(+GameState,+Move,-NewGameState)
move(GameState,Move,Color,GameState2):-
    position_to_row_column(Move,Row,Column),
    move(GameState,Row,Column,Color,GameState2).

move(GameState,Row,Column,Color,GameState2):-
    valid_move(GameState,Row,Column),
    write('Move is Valid'),
    set_value(GameState,GameState2,Row,Column,Color),
    add_color(Row,Column,Color),
    add_connections(Row,Column).

    


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
    write('Green : Orange & Green ; Purple : Green & Purple ; Orange : Purple & Orange'), nl,
    write('----------------------------------------------------------------------------'), nl, nl.


% function to print the game board (EXPERIMENTAL VERSION)
board(GameState) :-
    keep_number_lists_of_lists(GameState,L),
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
    write('   |               GGGG    OOOO'),nl,
    format('a |             GGGG/ ~w\\__/ ~w\\OOOO~n',L0),
    format('b |          GGGG/ ~w\\__/ ~w\\__/ ~w\\OOOO~n',L1),
    format('c |       GGGG/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\OOOO~n',L2),
    format('d |    GGGG/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\OOOO~n',L3),
    format('e |    G/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\O~n',L4),
    format('f |    G\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/O~n',L5),
    format('g |   __/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__~n',L6),
    format('h | P/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\P~n',L7),
    format('i | P\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/P~n',L8),
    format('j | P/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\P~n',L9),
    format('k | P\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/P~n',L10),
    format('l | P/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\P~n',L11),
    format('m | P\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/P~n',L12),
    format('n | P/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\P~n',L13),
    format('o | P\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/P~n',L14),
    format('p | P/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\P~n',L15),
    format('q | P\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/P~n',L16),
    format('r |     \\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',L17),
    format('s |    O/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\G~n',L18),
    format('t |    O\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/G~n',L19),
    format('u |    OOOO\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/GGGG~n',L20),
    format('v |       OOOO\\__/ ~w\\__/ ~w\\__/ ~w\\__/GGGG~n',L21),
    format('w |          OOOO\\__/ ~w\\__/ ~w\\__/GGGG~n',L22),
     write('  |             OOOO\\__/  \\__/GGGG'),nl,
     write('  |                OOOO    GGGG'),nl.


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
getUserInput(Column, Row, Color) :-
    repeat,
        write('Please Enter Valid Coordinates'),nl,
        getUserColumn(Column),
        getUserRow(Row),
        getUserColor(Color).


getUserColumn(Column) :-
    repeat,
        write('Enter the column letter:\n'),
        once(read(Column)),
        checkReadColumn(Column),!.

checkReadColumn(Column) :- atom(Column), char_code(Column,Number), Number >= 97, Number =< 119.
checkReadColumn(_) :- write('Invalid Column. Has to be between \'a\' and \'w\'. Try Again\n'), fail.

getUserRow(Row) :-
    repeat,
        write('Enter the row number:\n'),
        once(read(Row)),
        checkReadRow(Row),!.

checkReadRow(Row) :- integer(Row), Row >= 1, Row =< 13.
checkReadRow(_) :- write('Invalid Row. Has to be between \'1\' and \'13\'. Try Again\n'), fail.

getUserColor(Color) :-
    repeat,
        write('Enter the color number (purple - 1; green - 2; orange - 3):\n'),
        once(read(Color)),
        checkReadColor(Color),!.

checkReadColor(Color) :- integer(Color), Color >= 1, Color =< 3.
checkReadColor(_) :- write('Invalid Color. Try Again\n'), fail.

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
    write('                               Game Mode                               \n'),
    write('                       _________________________                       \n'),
    write('                      |                         |                      \n'),
    write('                      | 1. Player vs Player     |                      \n'),
    write('                      |                         |                      \n'),
    write('                      | 2. Player vs Bot        |                      \n'),
    write('                      |                         |                      \n'),
    write('                      | 3. Bot vs Bot           |                      \n'),
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
    write('                               Difficulty                              \n'),
    write('                       _________________________                       \n'),
    write('                      |                         |                      \n'),
    write('                      | 1. Easy                 |                      \n'),
    write('                      |                         |                      \n'),
    write('                      | 0. Exit                 |                      \n'),
    write('                      |_________________________|                      \n').

printBotPlayerMenu :-
    nl, nl, nl,
    write('                       _ _ _                                           \n'),
    write('                 /\\   | | (_)                                         \n'),
    write('                /  \\  | | |_  __ _ _ __   ___ ___  ___                \n'),
    write('               / /\\ \\ | | | |/ _` | \'_ \\ / __/ _ \\/ __|           \n'),
    write('              / ____ \\| | | | (_| | | | | (_|  __/\\__ \\             \n'),
    write('             /_/    \\_\\_|_|_|\\__,_|_| |_|\\___\\___||___/           \n'),
    write('                                                                       \n'),
    write('                               Bot Player                              \n'),
    write('                       _________________________                       \n'),
    write('                      |                         |                      \n'),
    write('                      | 1. Bot is Player 0      |                      \n'),
    write('                      |                         |                      \n'),
    write('                      | 2. Bot is Player 1      |                      \n'),
    write('                      |                         |                      \n'),
    write('                      | 0. Exit                 |                      \n'),
    write('                      |_________________________|                      \n').




    












