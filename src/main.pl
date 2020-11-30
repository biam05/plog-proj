% Ficheiros que precisam de ser incluídos
:- ensure_loaded(display).
:- ensure_loaded(connections).
:- ensure_loaded(bot).
:- ensure_loaded(utils).
:- ensure_loaded(coordinates).
:- ensure_loaded(brainstorm).
:- ensure_loaded(menus).

/*
*   play
*       - predicate that allows us to run the game
*/
play:-
    starting_menu.

/*
*   play_game(+GameState, +Player)
*       -  game loop when it's a Player vs. Player game
*/
play_game(GameState,Player) :-
    Player2 is Player + 1,
    Player1 is mod(Player2, 2),
    display_game(GameState,Player),
    \+game_over(GameState,_Winner),
    getUserInput(Row,Column,Color),
    move(GameState, Row,Column,Color, GameState2),
    check_win(Player,GameState2,GameState3),
    check_win(Player1,GameState3,GameState4),
    play_game(GameState4, Player1).
play_game(GameState,_Player) :-
    game_over(GameState, Winner),
    write('              Game Won by Player '), write(Winner).

/*
*   game_over(+GameState, -Winner)
*       - verifies if any of the players won the game, returning the
*   winner in Winner
*/
game_over(GameState, Winner) :-
    nth0(0, GameState, Victories),
    count(Victories, 0, VictoriesP0),
    count(Victories, 1, VictoriesP1),
    getWinner(VictoriesP0, VictoriesP1, Winner).

/*
*   getWinner(+V0, +V1, -Winner)
*       - verifies if any of the players won 2 colors. If so, the player
*   is returned in Winner
*/
getWinner(V0, _V1, 0) :- V0 >= 2.     % Player 0 won
getWinner(_V0, V1, 1) :- V1 >= 2.     % Player 1 won

botInputHandler :- once(read(_)).

/*
*   play_player_bot(+GameState, +Player)
*       -  game loop when it's a Player vs. Bot game (Bot is Player 1)
*/
play_player_bot(GameState,1):-
    display_game(GameState,1),
    \+game_over(GameState,_Winner),
    botInputHandler,
    choose_move(GameState,_Player,_, Move,Color),
    move(GameState,Move,Color,GameState2),
    check_win(1,GameState2,GameState3),
    check_win(0,GameState3,GameState4),
    play_player_bot(GameState4, 0).
play_player_bot(GameState,0):-
    display_game(GameState,0),
    \+game_over(GameState,_Winner),
    getUserInput(Row,Column,Color),
    move(GameState, Row,Column,Color, GameState2),
    check_win(0,GameState2,GameState3),
    check_win(1,GameState3,GameState4),
    play_player_bot(GameState4, 1).

/*
*   play_bot_player(+GameState, +Player)
*       -  game loop when it's a Bot vs. Player game (Bot is Player 0)
*/
play_bot_player(GameState,0):-
    display_game(GameState,0),
    \+game_over(GameState,_Winner),
    botInputHandler,
    choose_move(GameState,_Player,_, Move,Color),
    move(GameState,Move,Color,GameState2),
    check_win(0,GameState2,GameState3),
    check_win(1,GameState3,GameState4),
    play_bot_player(GameState4, 1).
play_bot_player(GameState,1):-
    display_game(GameState,1),
    \+game_over(GameState,_Winner),
    getUserInput(Row,Column,Color),
    move(GameState,Row,Column,Color,GameState2),
    check_win(1,GameState2,GameState3),
    check_win(0,GameState3,GameState4),
    play_bot_player(GameState4, 0).

/*
*   play_bot_player(+GameState, +Player)
*       -  game loop when it's a Bot vs. Bot game
*/
play_bot_bot(GameState,Player):-
    Player2 is Player + 1,
    Player1 is mod(Player2, 2),
    display_game(GameState,Player),
    \+game_over(GameState,_Winner),
    botInputHandler,
    choose_move(GameState,Player,_, Move,Color),
    move(GameState,Move,Color,GameState2),
    check_win(Player,GameState2,GameState3),
    check_win(Player1,GameState3,GameState4),
    play_bot_bot(GameState4, Player1).
