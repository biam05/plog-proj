
% Ficheiros que precisam de ser incluídos
:- ensure_loaded(display).
:- ensure_loaded(connections).

% Predicado que permite correr o jogo
% De momento está hardcoded para mostar os headers no inicio e os estados de jogo pedidos
play :-
    %displayHeader(0),
    initial2(GameState),
    board(GameState),
    display_game(GameState,0).
    %displayHeader(1).

