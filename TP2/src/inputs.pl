readOption :-
    repeat,
        write('\tType Your Option:\n'),
        once(read(Option)),
        checkOption(Option),
    runOption(Option).

checkOption(Option) :- Option >= 0, Option =< 5.
checkOption(_) :- write('Invalid Option. Try Again\n'), fail.

runOption(0) :- write('Goodbye!\n').

runOption(1) :- chooseDimension.

% ----------- TODO ----------- 
runOption(2).
runOption(3).
runOption(4).
runOption(5).
% ----------------------------

chooseDimension :-
    repeat,
        write('\tWhat Dimension?\n'),
        once(read(Option)),
        checkDimension(Option),
    runDimension(Option).

checkDimension(Option) :- Option >= 3.
checkDimension(_) :- write('Invalid Option. Try Again\n'), fail.

runDimension(Dimension) :- runner(Dimension).