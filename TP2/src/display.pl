display([],_,_,_).
display(ListOfLists, RowValues, ColValues, Length, TableValues) :-
    header,
    tab(1), print_ColValues(ColValues), nl,
    tab(1), print_horizontal_division(Length), nl,
    print_board(ListOfLists, RowValues, Length),
    new_line(2),
    tab(1), write('{1-'), write(TableValues), write('}').

menuDisplay :-
    header,
    menuOptions.

header :-
    clr,
    write('\t _    _                        ______              _            _       '), nl,
    write('\t| |  | |                       | ___ \\            | |          | |      '), nl,
    write('\t| |  | |_ __ ___  _ __   __ _  | |_/ / __ ___   __| |_   _  ___| |_ ___ '), nl,
    write('\t| |/\\| | \'__/ _ \\| \'_ \\ / _` | |  __/ \'__/ _ \\ / _\` | | | |/ __| __/ __|'), nl,
    write('\t\\  /\\  / | | (_) | | | | (_| | | |  | | | (_) | (_| | |_| | (__| |_\\__ \\'), nl,
    write('\t \\/  \\/|_|  \\___/|_| |_|\\__, | \\_|  |_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/'), nl,
    write('\t                         __/ |'), nl,
    write('\t                        |___/'),
    nl, nl, 
    write('\tPut the given numbers into the grid such that each'), nl,
    write('\tnumber appears exactly once in the grid and each'), nl, 
    write('\trow/column contains exactly two numbers. Each clue'), nl, 
    write('\toutside the grid is either one less or one more from'), nl,
    write('\tthe product of the two numbers in the corresponding row/column'), nl,    
    nl, nl, nl.

menuOptions :-
    write('                                 Options\n'),
    write('                     1 - I Want to Solve a Problem\n'),
    % --------------------------------------- TODO --------------------------------------- 
    write('                     2 - \n'),
    write('                     3 - \n'),
    write('                     4 - \n'),
    write('                     5 - \n'),    
    % ------------------------------------------------------------------------------------ 
    write('                     0 - Leave Program\n'),
    write('\n\n\n').


% ------------------------------------------------------------------------------------
% ------------------------------------------------------------------------------------
% ------------------------------------------------------------------------------------
% ------------------------------------------------------------------------------------

clr :- write('\33\[2J').

new_line(N) :-
    N > 1,
    nl,
    Next is N - 1,
    new_line(Next).
new_line(1) :- nl.

space(N) :-
    N > 1,
    write(' '),
    Next is N - 1,
    space(Next).
space(1) :- write(' ').

tab(N) :-
    N > 1,
    write('\t'),
    Next is N - 1,
    tab(Next).
tab(1) :- write('\t').


print_ColValues([]).
print_ColValues([H|T]) :-
    tab(1), write(H), tab(1), 
    print_ColValues(T).

print_board([],_,_).    
print_board([H|T], [R|RT], Length) :-
    write(R), tab(1),
    print_line(H), write('|'), nl,
    tab(1), print_horizontal_division(Length),  nl,
    print_board(T, RT, Length).

print_line([]).
print_line([0|T]):-
    write('|'), tab(1), write(' '), tab(1),
    print_line(T).
print_line([H|T]):-
    write('|'), tab(1), write(H), tab(1), 
    print_line(T).

print_horizontal_division(N) :-
    N > 0,
    write('+'),
    write('\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\'),
    Next is N - 1,
    print_horizontal_division(Next).
print_horizontal_division(0) :- write('+').   
