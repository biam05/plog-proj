
% Main Predicate of the game
% Calls display_game(GameState,Player).
% play/0. 

% Displays the game 
% display_game(GameState,Player).

% Returns the initial state of the game
% initial(GameState).~

square :- 
    write(' ___ '), nl,
    put_code(9585), write('   '), put_code(9586), nl,
    put_code(9586), write('___'), put_code(9585).

/*
write('        L L L L L        '),nl.
write('        x x x x x        '),nl.
write('    Gx x x x x x x xP    '),nl.
write('   Gx x x x x x x x xP   '),nl.
write('  Gx x x x x x x x x xP  '),nl.
write(' Gx x x x x x x x x x xP '),nl.
write('Gx x x x x x x x x x x xP'),nl.
write('  x x x x x x x x x x x  '),nl.
write('Px x x x x x x x x x x xG'),nl.
write(' Px x x x x x x x x x xG '),nl.
write('  Px x x x x x x x x xG  '),nl.
write('   Px x x x x x x x xG   '),nl.
write('    Px x x x x x x xG    '),nl.
write('        x x x x x        '),nl.
write('        L L L L L        '),nl.
*/

square.
square.

