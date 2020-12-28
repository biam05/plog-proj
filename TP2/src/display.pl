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

display([],_,_,_).
display(ListOfLists, RowValues, ColValues, Length) :-
    clr, 
    tab(1), print_ColValues(ColValues), nl,
    tab(1), print_horizontal_division(Length), nl,
    print_board(ListOfLists, RowValues, Length).

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
