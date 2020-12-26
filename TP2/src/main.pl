:- use_module(library(lists)).
:- use_module(library(random)). % POde ser necessário retirar no fim se não se usar
:- use_module(library(clpfd)). % Permite utilizar o módulo de restrições



/* Passos

1 - Só pode haver 2 valores em cada linha
2 - Só pode haver 2 valores em cada coluna  (é preciso fazer uma transposta de uma matrix prob)
3 - A Multiplicação dos valores de cada linha deve corresponder ao respetivo valor de RowValues (com variação de de 1 unidade)
4 - A Multiplicação dos valores de cada coluna deve corresponder ao respetivo valor de ColumnValues(com variação de de 1 unidade)(transposta yet again)
5 - É necessário ter uma função que multiplique valores ignorando zeros
6 - Todos os valores na tabela têm que ser distintos
7 - Cada número aparece exatamente 1 vez


transposing funciona!!
*/

example(Table):-

    % Declaração de variáveis
    /*
    RowValues = [R1,R2,R3,R4], % Valores na vertical (2,13,29,31)
    ColValues = [C1,C2,C3,C4], % Valores na horizontal (3,11,23,41)
    */

    R1 = 2,

    Table = [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P], % Células que podem ser preenchidas


    % Need to add this dynamicly later
    Row1 = [A,B,C,D],
    Row2 = [E,F,G,H],
    Row3 = [I,J,K,L],
    Row4 = [M,N,O,P],

    %Must do a dynamic transpose matrix later
    Col1 = [A,E,I,M],
    Col2 = [B,F,J,N],
    Col3 = [C,G,K,O],
    Col4 = [D,H,L,P],


    % Restrições de domínio
    domain(Table,0,8), % 8 porque é 2*número_de_rows(aka 4)
    %domain(RowValues,1,56), % 8 * (8 - 1)
    %domain(ColValues,1,56), % 8 * (8 - 1)


    % Condições de jogo

    % Os valores têm que ser todos distintios, quando diferentes de 0
    all_distinct_except_0(Table),

    % Cada linha ou coluna deve ter exatamente 2 valores diferentes de 0
    % Linhas
    exactly(0,Row1,2), % Deve haver obrigatoriamente 2 ocorrências de 0, garantindo 2 ocurrências do resto :)
    exactly(0,Row2,2),
    exactly(0,Row3,2),
    exactly(0,Row4,2),

    
    %Colunas
    exactly(0,Col1,2),
    exactly(0,Col2,2),
    exactly(0,Col3,2),
    exactly(0,Col4,2),
    
    % Ensuring lines and columns multiply to correct value
    %mult_list(Row1,2),


    % Cálculo de resultados
    labeling([],Table),

    write(Table),nl,
    write(Row1),nl,
    write(Row2),nl,
    write(Row3),nl,
    write(Row4),nl,nl,

    write(R1),nl,

    
    write(Col1),nl,
    write(Col2),nl,
    write(Col3),nl,
    write(Col4).
    


test(List):-

    List=[A,B,C],

    domain(List,0,4),

    all_distinct_except_0(List), % WOrks :) 

    
    labeling([],List).


/*multiply_list([],Value,Value).
multiply_list([],Value,Value + 1).
multiply_list([],Value,Value - 1).
multiply_list([H|T],Current,Total):-
    H #\= 0,
    Current2 #= Current * H,
    multiply_list(T,Current2,Total).
    
multiply_list([H|T],Current,Total):-
    multiply_list(T,Current,Total).


mult_list([],Current,Total).
mult_list([H|T],Total):-
    mult_list(T,Total*H).*/

mult_list(List,Total):-
    mult_list(List,0,Total).

mult_list([],Total,Total).
mult_list([H|T],Current,Total):-
    H = 0,
    mult_list(T,Current,Total).

mult_list([H|T],Current,Total):-
    mult_list(T,Current * H,Total).


exactly(_, [], 0).
exactly(X, [Y|L], N) :-
    X #= Y #<=> B,
    N #= M + B,
exactly(X, L, M).





