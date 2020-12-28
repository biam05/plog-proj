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
    
    RowValues = [R1,R2,R3,R4], % Valores na vertical (2,13,29,31)
    ColValues = [C1,C2,C3,C4], % Valores na horizontal (3,11,23,41)

    RowValues = [2,13,29,31],
    ColValues = [3,11,23,41],

    % Todos os valores
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
    domain(RowValues,0,56),
    domain(ColValues,0,56),

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
    mult_list(Row1,R1),
    mult_list(Row2,R2),
    mult_list(Row3,R3),
    mult_list(Row4,R4),

    mult_list(Col1,C1),
    mult_list(Col2,C2),
    mult_list(Col3,C3),
    mult_list(Col4,C4),


    % Cálculo de resultados
    labeling([],Table),
    labeling([],RowValues),
    labeling([],ColValues),

    write(Table),nl,
    write(Row1),write(R1),nl,
    write(Row2),write(R2),nl,
    write(Row3),write(R3),nl,
    write(Row4),write(R4),nl,nl,

    write(Col1),write(C1),nl,
    write(Col2),write(C2),nl,
    write(Col3),write(C3),nl,
    write(Col4),write(C4).
    


test(List):-

    List=[A,B,C],

    domain(List,0,4),

    all_distinct_except_0(List), % WOrks :) 

    
    labeling([],List).






main(Length):-

    % Para começar, vamos estabelecer que a matrix é 4x4

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


    % Cálculo de resultados
    labeling([],Table),
    labeling([],RowValues),
    labeling([],ColValues),

    write_table(ListOfLists),nl,
    write(RowValues),nl,
    write(ColValues).


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
    (Total #= Current) #\/ (Total #= Current + 1) #\/ (Total #= Current - 1).

mult_list([H|T],Current,Total):-
    H #= 0,
    mult_list(T,Current,Total).

mult_list([H|T],Current,Total):-
    Current2 #= Current * H,
    mult_list(T,Current2,Total).


exactly(_, [], 0).
exactly(X, [Y|L], N) :-
    X #= Y #<=> B,
    N #= M + B,
exactly(X, L, M).

write_table([]).
write_table([H|T]):-
    write(H),nl,
    write_table(T).