readOption :-
    repeat,
        write('\tType Your Option:\n'),
        once(read(Option)),
        checkOption(Option),
    runOption(Option).

checkOption(Option) :- Option >= 0, Option =< 7.
checkOption(_) :- write('Invalid Option. Try Again\n'), fail.

runOption(0) :- write('Goodbye!\n').

runOption(1) :- 
    display([[0,0,0],[0,0,0],[0,0,0]],[11,11,4],[2,9,23],3,6),
    readRequest(1).

runOption(2):- 
    display([[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],[5,23,27,9],[13,19,47,2],4,8),
    readRequest(2).

runOption(3) :-
    display([[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]],[79,41,7,14,8],[44,3,5,69,47],5,10),
    readRequest(3).

runOption(4) :-
    display([[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]],[65,23,39,9,62,11],[83,8,19,19,32,47],6,12),
    readRequest(4).

runOption(5) :-
    display([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]],[139,71,64,35,13,23,10],[43,6,11,38,59,79,125],7,14),
    readRequest(5).

readRequest(Dimension) :-
    repeat,
        write('\tType 1 if you want to see the solution of the problem:\n'),
        once(read(Option)),
        checkRequest(Option),
    runRequest(Dimension).

checkRequest(Option) :- Option = 1.
checkRequest(_) :- write('Invalid Option. Try Again\n'), fail.

runRequest(1) :- 
    nl, nl,
    solver(3,[11,11,4],[2,9,23]).

runRequest(2) :- 
    nl, nl,
    solver(4,[5,23,27,9],[13,19,47,2]).

runRequest(3) :- 
    nl, nl,
    solver(5,[79,41,7,14,8],[44,3,5,69,47]).

runRequest(4) :- 
    nl, nl,
    solver(6,[65,23,39,9,62,11],[83,8,19,19,32,47]).

runRequest(5) :- 
    nl, nl,
    solver(7,[139,71,64,35,13,23,10],[43,6,11,38,59,79,125]).