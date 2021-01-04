% ------------------------------------------------------------------------------------
% -------------------------------- FUNÇÕES DE LER INPUTS -----------------------------
% ------------------------------------------------------------------------------------

% readOption
% lê a opção de execução do utilizador
readOption :-
    repeat,
        write('\tType Your Option:\n'),
        once(read(Option)),
        checkOption(Option),
    runOption(Option).

% readRequest(+Dimension)
% lê se o utilizador que ver a solução do problema que foi apresentado
readRequest(Dimension) :-
    repeat,
        write('\tType 1 if you want to see the solution of the problem:\n'),
        once(read(Option)),
        checkEqual1(Option),
    runRequest(Dimension).

% readRandom(+Dimension, +RowValues, +ColValues)
% lê se o utilizador que ver a solução do problema que foi apresentado
readRandom(Dimension, RowValues, ColValues) :-
    repeat,
        write('\tType 1 if you want to see the solution of the problem:\n'),
        once(read(Option)),
        checkEqual1(Option),
    runRandom(Dimension, RowValues, ColValues).

% ------------------------------------------------------------------------------------
% ---------------------- FUNÇÕES DE VERIFICAÇÃO DE ERROS DE INPUTS -------------------
% ------------------------------------------------------------------------------------

% checkOption(+Option)
% verifica se a Option está entre 0 e 7
checkOption(Option) :- Option >= 0, Option =< 7.
checkOption(_) :- write('Invalid Option. Try Again\n'), fail.

% checkEqual1(+Option)
% verifica se a Option é igual a 1
checkEqual1(1).
checkEqual1(_) :- write('Invalid Option. Try Again\n'), fail.

% checkDimension(+Option)
% verifica se a Option está entre 2 e 10
checkDimension(Option) :- Option >= 2, Option =< 10.
checkDimension(_) :- write('Invalid Option. Try Again\n'), fail.

% ------------------------------------------------------------------------------------
% --------------------------- FUNÇÕES DE LIDAR COM OS INPUTS -------------------------
% ------------------------------------------------------------------------------------

% runOption(+Option)
% executa a opção de execução do programa escolhida pelo utilizador
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
runOption(6) :-
    repeat,
        write('\tType the Dimension of the Puzzle:\n'),
        once(read(Option)),
        checkDimension(Option),
    runDimension(Option).
runOption(_) :- write('Error running option').

% runRequest(+Option)
% executa e mostra a solução do problema escolhido para resolver pelo utilizador
runRequest(1) :- nl, nl, solver(3,[11,11,4],[2,9,23]).
runRequest(2) :- nl, nl, solver(4,[5,23,27,9],[13,19,47,2]).
runRequest(3) :- nl, nl, solver(5,[79,41,7,14,8],[44,3,5,69,47]).
runRequest(4) :- nl, nl, solver(6,[65,23,39,9,62,11],[83,8,19,19,32,47]).
runRequest(5) :- nl, nl, solver(7,[139,71,64,35,13,23,10],[43,6,11,38,59,79,125]).
runRequest(_) :- write('Error running request').

% runDimension(+Dimension)
% executa e mostra o problema aleatório com a dimensão escolhida pelo utilizador
runDimension(Dimension) :-
    MaxValue is Dimension * 2,
    generateListofLists(Dimension,ListOfLists),
    generatePuzzle(Dimension, RowValues, ColValues),
    display(ListOfLists, RowValues, ColValues, Dimension, MaxValue),
    readRandom(Dimension,RowValues, ColValues).
runDimension(_) :- write('Error running dimension').

% runRandom(+Dimension, +RowValues, +ColValues)
% executa e mostra o a solução do problema aleatório com a dimensão escolhida pelo utilizador
runRandom(Dimension, RowValues, ColValues) :- nl, nl, solver(Dimension, RowValues, ColValues).
runRandom(_,_,_) :- write('Error running random board').