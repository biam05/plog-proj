
% Ficheiros que precisam de ser incluídos
:- ensure_loaded(display).
:- ensure_loaded(connections).
:- ensure_loaded(bot).
:- ensure_loaded(utils).
:- ensure_loaded(coordinates).
:- ensure_loaded(brainstorm).


% Predicado que permite correr o jogo
% De momento está hardcoded para mostar os headers no inicio e os estados de jogo pedidos


play:-
    initial(GameState),
    play_game(GameState,0).


play_game(GameState,Player) :-
    Player2 is Player + 1,
    Player1 is mod(Player2, 2),
    display_game2(GameState,Player),
    \+game_over(GameState,Winner),
    move(GameState, Move, GameState2),
    write(4),nl,
    check_win(Player,GameState2,GameState3),
    write('checked vic'),nl,
    play_game(GameState3, Player1).

play_game(GameState,Player) :-
    write('checking'),
    game_over(GameState, Winner),
    write('Game Won by Player '), write(Winner).

game_over(GameState, Winner) :-
    nth0(0, GameState, Victories),
    count(Victories, 0, VictoriesP0),
    count(Victories, 1, VictoriesP1),
    getWinner(VictoriesP0, VictoriesP1, Winner).

getWinner(V0, V1, 0) :- V0 >= 2.     % Player 0 won
getWinner(V0, V1, 1) :- V1 >= 2.     % Player 1 won

/*
play_game :-
    %displayHeader(0),
    initial(GameState),
    board(GameState),
    display_game(GameState,0).
    %displayHeader(1).

play_game :-
    write('Game Won!!').
*/

%Bot is Player 1
play_player_bot(GameState,1):-
    display_game2(GameState,0),
    \+game_over(GameState,Winner),
    choose_move(GameState,Player,_, Move,Color),
    move(GameState, Move, GameState2),
    check_win(Player,GameState2,GameState3),
    write('checked vic'),nl,
    play_player_bot(GameState3, 0).

play_player_bot(GameState,0):-
    display_game2(GameState,0),
    \+game_over(GameState,Winner),
    move(GameState, Move, GameState2),
    check_win(Player,GameState2,GameState3),
    write('checked vic'),nl,
    play_player_bot(GameState3, 1).



play_bot_player(GameState,0):-
    display_game2(GameState,0),
    \+game_over(GameState,Winner),
    move(GameState, Move, GameState2),
    check_win(Player,GameState2,GameState3),
    write('checked vic'),nl,
    play_bot_player(GameState3, 1).

play_bot_player(GameState,1):-
    display_game2(GameState,0),
    \+game_over(GameState,Winner),
    choose_move(GameState,Player,_, Move,Color),
    move(GameState, Move, GameState2),
    check_win(Player,GameState2,GameState3),
    write('checked vic'),nl,
    play_bot_player(GameState3, 0).
