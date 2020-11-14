
% Ficheiros que precisam de ser incluídos
:- ensure_loaded(display).
:- ensure_loaded(game_logic).

% Predicado que permite correr o jogo
% De momento está hardcoded para mostar os headers no inicio e os estados de jogo pedidos
play :-
    initial(GameState),
    display_game(GameState,0).

