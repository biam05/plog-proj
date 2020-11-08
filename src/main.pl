
% Ficheiros que precisam de ser incluídos
:- ensure_loaded(display).

% Predicado que permite correr o jogo
% De momento está hardcoded para mostar os headers no inicio e os estados de jogo pedidos
play :-
    displayHeader(0),
    coordinates,
    %initial(InitialState),
    form(Test),
    display_game(Test,1,0),
    displayHeader(1).

