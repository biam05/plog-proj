:- use_module(library(lists)).
:- use_module(library(random)).

/*
*   initial
*       - Gameboard with initial variables
*/
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

/*
*   display_game(+GameState, +Player)
*       - displays the board of the current game state so the user can visualize
*   the progress of the game
*/
display_game(GameState,Player) :-
    Player2 is Player + 1,
    Player1 is mod(Player2, 2),
    nth0(0,GameState,Victories),
    displayHeader(0, Victories),
    board(GameState),
    displayTurn(Player, Player1), 
    displayHeader(1, Victories).
display_game([],_) :-
    write('\n\nWrong Player given\n').

/* 
*   move(+GameState,+Move, +Color, -NewGameState)
*       - makes a Move with a Color, returning the new changes in GameState2
*/
move(GameState,Move,Color,GameState2):-
    position_to_row_column(Move,Row,Column),
    move(GameState,Row,Column,Color,GameState2).

/*   
*   move(+GameState,+Row,+Column,+Color,-NewGameState)
*       - makes a move defined by Row and Column with a Color, returning the new changes in GameState2
*/
move(GameState,Row,Column,Color,GameState2):-
    valid_move(GameState,Row,Column),
    set_value(GameState,GameState2,Row,Column,Color),
    add_color(Row,Column,Color),
    add_connections(Row,Column).

/*
*   displayTurn(+Player0, Player1)
*       - displays information about the current turn and the next turn
*/
displayTurn(Player1, Player2) :-
    format('~n~*t ~w ~w ~w ~w ~53|~n', [32, 'Player', Player1, 'Turn; Next: Player', Player2]).

/*
*   displayHeader(Player, Victories)
*       - displayes the Players information and Victories
*/
displayHeader(0, Victories) :-
    count(Victories, 0, X), nl,nl,nl,
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 0'), nl,
    write('----------------------------------------------------------------------------'), nl,
    format('Victories: ~w~n', X),
    write('\t\t\t     Win Conditions'), nl,
    write('Purple : Orange & Purple ; Green : Purple & Green ; Orange : Green & Orange'), nl,
    write('----------------------------------------------------------------------------'), nl, nl.
displayHeader(1, Victories) :-
    count(Victories, 1, X),
    write('----------------------------------------------------------------------------'), nl,
    write('\t\t\t\tPLAYER 1'), nl,
    write('----------------------------------------------------------------------------'), nl,
    format('Victories: ~w~n', X),
    write('\t\t\t     Win Conditions'), nl,
    write('Purple : Green & Purple ; Green : Orange & Green ; Orange : Purple & Orange'), nl,
    write('----------------------------------------------------------------------------'), nl, nl.


/*
*   board(GameState)
*       - displays the current game board defined by GameState
*/
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
    write('              |   1 |2 |3 |4 |5 |6 |7 |8 |9 |10|11|12|13|'),nl,
    write('            ---------------------------------------------'),nl,
    write('              |                GGGG    OOOO'),nl,
    format('            a |             GGGG/ ~w\\__/ ~w\\OOOO~n',L0),
    format('            b |          GGGG/ ~w\\__/ ~w\\__/ ~w\\OOOO~n',L1),
    format('            c |       GGGG/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\OOOO~n',L2),
    format('            d |    GGGG/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\OOOO~n',L3),
    format('            e |    G/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\O~n',L4),
    format('            f |    G\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/O~n',L5),
    format('            g |   __/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__~n',L6),
    format('            h | P/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\P~n',L7),
    format('            i | P\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/P~n',L8),
    format('            j | P/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\P~n',L9),
    format('            k | P\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/P~n',L10),
    format('            l | P/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\P~n',L11),
    format('            m | P\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/P~n',L12),
    format('            n | P/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\P~n',L13),
    format('            o | P\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/P~n',L14),
    format('            p | P/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\P~n',L15),
    format('            q | P\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/P~n',L16),
    format('            r |     \\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/~n',L17),
    format('            s |    O/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\G~n',L18),
    format('            t |    O\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/G~n',L19),
    format('            u |    OOOO\\__/ ~w\\__/ ~w\\__/ ~w\\__/ ~w\\__/GGGG~n',L20),
    format('            v |       OOOO\\__/ ~w\\__/ ~w\\__/ ~w\\__/GGGG~n',L21),
    format('            w |          OOOO\\__/ ~w\\__/ ~w\\__/GGGG~n',L22),
     write('              |             OOOO\\__/  \\__/GGGG'),nl,
     write('              |                OOOO    GGGG'),nl.


/*
*   choose_move(+GameState, +Player, +Level, -Move, +Color)​
*       - makes a move, depending on the Level of the bot
*/
choose_move(GameState,_,1, Move,Color):-
    random_bot(GameState,Move,Color).

choose_move(GameState,Player,2,Move,Color):-
    greedy_bot(GameState,Player,Move,Color).

/*
*   printStartingMenu
*       - prints the starting menu
*/
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
    write('                      |_________________________|                      \n\n\n').

/*
*   printDifficultyMenu
*       - prints the difficulty menu
*/
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
    write('                      | 2. Hard                 |                      \n'),
    write('                      |                         |                      \n'),
    write('                      | 0. Exit                 |                      \n'),
    write('                      |_________________________|                      \n\n\n').

/*
*   printBotPlayerMenu
*       - prints the bot player option menu
*/
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
    write('                      |_________________________|                      \n\n\n').




    












