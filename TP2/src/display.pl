% ------------------------------------------------------------------------------------
% ------------------------- PRINCIPAIS FUNÇÕES DE DISPLAY ----------------------------
% ------------------------------------------------------------------------------------

% display(+ListOfLists, +RowValues, +ColValues, +Length, +TableValues))
% dá display a um problema, passando pela limpeza de ecrã e imprimindo um header
display([],_,_,_).
display(ListOfLists, RowValues, ColValues, Length, TableValues) :-
    header,
    tab(1), print_ColValues(ColValues), nl,
    tab(1), print_horizontal_division(Length), nl,
    print_board(ListOfLists, RowValues, Length),
    nl, nl,
    tab(1), write('{1-'), write(TableValues), write('}'), nl, nl.

% displayWithoutClean(+ListOfLists, +RowValues, +ColValues, +Length, +TableValues))
% semelhante ao predicado display, mas sem limpar o ecrã e sem imprimir um header
displayWithoutClean([],_,_,_).
displayWithoutClean(ListOfLists, RowValues, ColValues, Length, TableValues) :-
    tab(1), print_ColValues(ColValues), nl,
    tab(1), print_horizontal_division(Length), nl,
    print_board(ListOfLists, RowValues, Length),
    nl, nl,
    tab(1), write('{1-'), write(TableValues), write('}'), nl, nl.

% menuDisplay
% imprime um header e imrpime as opções que podem ser escolhidas pelo utilizador
menuDisplay :-
    header,
    menuOptions.

% header
% imprime um header
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

% menuOptions
% imprime as opções que podem ser escolhidas pelo utilizador
menuOptions :-
    write('                                 Options\n'),
    write('                     1 - Solve Problem of Length 3\n'),
    write('                     2 - Solve Problem of Length 4\n'),
    write('                     3 - Solve Problem of Length 5\n'),
    write('                     4 - Solve Problem of Length 6\n'),
    write('                     5 - Solve Problem of Length 7\n'),  
    write('                     6 - Show Random Problem\n'),    
    write('                     0 - Leave Program\n'),
    write('\n\n\n').


% ------------------------------------------------------------------------------------
% ---------------------------- FUNÇÕES AUXILIARES DE DISPLAY -------------------------
% ------------------------------------------------------------------------------------

% clr
% limpa o ecrã
clr :- write('\33\[2J').

% tab(+N)
% imprime N tabs
tab(N) :-
    N > 1,
    write('\t'),
    Next is N - 1,
    tab(Next).
tab(1) :- write('\t').

% print_ColValues(+L)
% imprime recursivamente os valores das colunas do tabuleiro, que se encontram na lista L
print_ColValues([]).
print_ColValues([H|T]) :-
    tab(1), write(H), tab(1), 
    print_ColValues(T).

% print_board(+L, +R, +Length)
% imprime recursivamente um tabuleiro de dimensão Length, imprimindo o valor da linha atual
% e o conteúdo dessa mesma linha
print_board([],_,_).    
print_board([H|T], [R|RT], Length) :-
    write(R), tab(1),
    print_line(H), write('|'), nl,
    tab(1), print_horizontal_division(Length),  nl,
    print_board(T, RT, Length).

% print_line(+L)
% imprime recursivamente o conteúdo de uma linha de um tabuleiro
print_line([]).
print_line([0|T]):-
    write('|'), tab(1), write(' '), tab(1),
    print_line(T).
print_line([H|T]):-
    write('|'), tab(1), write(H), tab(1), 
    print_line(T).

% print_horizontal_division(+N)
% imprime uma linha horizontal do tabuleiro
print_horizontal_division(N) :-
    N > 0,
    write('+'),
    write('\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\\x2015\'),
    Next is N - 1,
    print_horizontal_division(Next).
print_horizontal_division(0) :- write('+').   
