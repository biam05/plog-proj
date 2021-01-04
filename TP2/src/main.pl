:- use_module(library(lists)).
:- use_module(library(random)). % POde ser necessário retirar no fim se não se usar
:- use_module(library(clpfd)). % Permite utilizar o módulo de restrições

main(Length):-
    % Declaração de variáveis
    
    length(RowValues,Length), % Valores na vertical (2,13,29,31)
    length(ColValues,Length), % Valores na horizontal (3,11,23,41)

    %RowValues = [2,13,29,31], % Valores na vertical (2,13,29,31)
    %ColValues = [3,11,23,41], % Valores na horizontal (3,11,23,41)

    % Gerar uma lista de listas dinâmica tendo em conta o parâmetro fornecido
    generateListofLists(Length,ListOfLists),

    % Gerar a matriz transposta para poder aceder às colunas
    transpose(ListOfLists,Transpose),
    
    % Dar flatten à lista de modo a que seja possível atribuir um domínio
    append(ListOfLists,Table),

    % Restrições de domínio
    TableValues is Length * 2,
    TableMaxValue is TableValues * (TableValues - 1),

    domain(Table,0,TableValues), % 8 porque é 2*número_de_rows(aka 4)
    domain(RowValues,0,TableMaxValue),
    domain(ColValues,0,TableMaxValue),

    % Condições de jogo

    % Os valores têm que ser todos distintios, quando diferentes de 0
    all_distinct_except_0(Table),

    % Cada linha ou coluna deve ter exatamente 2 valores diferentes de 0
    Amount is Length - 2,

    % Linhas
    line_restriction(ListOfLists,Amount),
    %Colunas
    line_restriction(Transpose,Amount),

    % Ensuring lines and columns multiply to correct value
    multiplication_restriction(ListOfLists,RowValues),
    multiplication_restriction(Transpose,ColValues),

    % Cálculo de resultados
    labeling([],Table),
    labeling([],RowValues),
    labeling([],ColValues),

    display(ListOfLists, RowValues, ColValues, Length, TableValues).


generateListofLists(Length,ListOfLists):-
    length(ListOfLists,Length),
    generator(ListOfLists,Length).

generator([],_).
generator([H|T],Length):-
    length(H,Length),
    generator(T,Length).


line_restriction([],_).
line_restriction([H|T],Amount):-
     exactly(0,H,Amount),
     line_restriction(T,Amount).


multiplication_restriction(_,[]).
multiplication_restriction([H|T],[H2|T2]):-
    mult_list(H,H2),
    multiplication_restriction(T,T2).
    

mult_list(List,Total):-
    mult_list(List,1,Total).

mult_list([],Current,Total):-
    (Total #= Current + 1) #\/ (Total #= Current - 1).

mult_list([H|T],Current,Total):-
    H #= 0,
    mult_list(T,Current,Total).

mult_list([H|T],Current,Total):-
    Current2 #= Current * H,
    mult_list(T,Current2,Total).

multiplication_restriction2(_,[],[]).
multiplication_restriction2([H|T],[H2|T2],[H3|T3]):-
    mult_list2(H,H2,H3),
    multiplication_restriction2(T,T2,T3).
    

mult_list2(List,Total,ActualValue):-
    mult_list2(List,1,Total,ActualValue).

mult_list2([],Current,Total,Current):-
    (Total #= Current + 1) #\/ (Total #= Current - 1).

mult_list2([H|T],Current,Total,ActualValue):-
    H #= 0,
    mult_list2(T,Current,Total,ActualValue).

mult_list2([H|T],Current,Total,ActualValue):-
    Current2 #= Current * H,
    mult_list2(T,Current2,Total,ActualValue).



exactly(_, [], 0).
exactly(X, [Y|L], N) :-
    X #= Y #<=> B,
    N #= M + B,
exactly(X, L, M).



selRandom(Var, Rest, BB0, BB1):- % seleciona valor de forma aleatória
    fd_set(Var, Set), fdset_to_list(Set, List),
    random_member(Value, List), % da library(random)
    ( first_bound(BB0, BB1), Var #= Value ;
    later_bound(BB0, BB1), Var #\= Value ).


generatePuzzle(Length,RowValues,ColValues):-
    % Declaração de variáveis
    
    length(RowValues,Length), % Valores na vertical (2,13,29,31)
    length(ColValues,Length), % Valores na horizontal (3,11,23,41)

    % Gerar uma lista de listas dinâmica tendo em conta o parâmetro fornecido
    generateListofLists(Length,ListOfLists),

    % Gerar a matriz transposta para poder aceder às colunas
    transpose(ListOfLists,Transpose),

    % Dar flatten à lista de modo a que seja possível atribuir um domínio
    append(ListOfLists,Table),

    % Restrições de domínio
    TableValues is Length * 2,
    TableMaxValue is TableValues * (TableValues - 1),

    domain(Table,0,TableValues), % 8 porque é 2*número_de_rows(aka 4)
    domain(RowValues,0,TableMaxValue),
    domain(ColValues,0,TableMaxValue),

    % Condições de jogo

    % Os valores têm que ser todos distintios, quando diferentes de 0
    all_distinct_except_0(Table),

    % Cada linha ou coluna deve ter exatamente 2 valores diferentes de 0
    Amount is Length - 2,

    % Linhas
    line_restriction(ListOfLists,Amount),
    %Colunas
    line_restriction(Transpose,Amount),

    % Ensuring lines and columns multiply to correct value
    multiplication_restriction(ListOfLists,RowValues),
    multiplication_restriction(Transpose,ColValues),

    labeling([value(selRandom)],Table),nl,
    labeling([],RowValues),
    labeling([],ColValues).


solver(Length,RowValues,ColValues):-

    length(RowValues,Length), % Valores na vertical (2,13,29,31)
    length(ColValues,Length), % Valores na horizontal (3,11,23,41)

    length(FinalRowValues,Length), % Valores na vertical (2,13,29,31)
    length(FinalColValues,Length), % Valores na horizontal (3,11,23,41)

    % Gerar uma lista de listas dinâmica tendo em conta o parâmetro fornecido
    generateListofLists(Length,ListOfLists),

    % Gerar a matriz transposta para poder aceder às colunas
    transpose(ListOfLists,Transpose),

    % Dar flatten à lista de modo a que seja possível atribuir um domínio
    append(ListOfLists,Table),

    % Restrições de domínio
    TableValues is Length * 2,
    TableMaxValue is TableValues * (TableValues - 1),

    domain(Table,0,TableValues), % 8 porque é 2*número_de_rows(aka 4)
    domain(RowValues,0,TableMaxValue),
    domain(ColValues,0,TableMaxValue),

    % Condições de jogo

    % Os valores têm que ser todos distintios, quando diferentes de 0
    all_distinct_except_0(Table),

    % Cada linha ou coluna deve ter exatamente 2 valores diferentes de 0
    Amount is Length - 2,

    % Linhas
    line_restriction(ListOfLists,Amount),
    %Colunas
    line_restriction(Transpose,Amount),

    % Ensuring lines and columns multiply to correct value
    multiplication_restriction2(ListOfLists,RowValues,FinalRowValues),
    multiplication_restriction2(Transpose,ColValues,FinalColValues),

    labeling([],Table),

    display(ListOfLists, FinalRowValues, FinalColValues, Length, TableValues).


runner(Length):-
    generatePuzzle(Length,RowValues,ColValues),
    solver(Length,RowValues,ColValues).   



