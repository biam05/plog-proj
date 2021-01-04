% ------------------------------------------------------------------------------------
% ---------------- PRINCIPAIS FUNÇÕES DA LÓGICA RESOLUÇÃO DO PROBLEMA ----------------
% ------------------------------------------------------------------------------------

% generatePuzzle(+length,-RowValues,-ColValues)
% Receebe uma dimensão length e gera pistas para um problema resolúvel de dimensão Length
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
 
    % Garantir a restrição do produto em relação ao valor no exterior da tabela
    multiplication_restriction(ListOfLists,RowValues),
    multiplication_restriction(Transpose,ColValues),

    labeling([value(selRandom)],Table),nl,
    labeling([],RowValues),
    labeling([],ColValues).


% solver(+Length,+RowValues,+ColValues)
% Resolve o problema "Wrong Products", se possível, de dimensão Length, com as pistas no exterior da tabela RowValues e ColValues
% RowValues é o valor no exterior de cada linha da tabela e ColValues o de cada coluna
solver(Length,RowValues,ColValues):-

    length(RowValues,Length), % Valores na vertical (2,13,29,31 do problema do moodle)
    length(ColValues,Length), % Valores na horizontal (3,11,23,41  do problema do moodle))

    length(FinalRowValues,Length), % Valores finais na vertical 
    length(FinalColValues,Length), % Valores finais na horizontal 

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

    % Garantir a restrição do produto em relação ao valor no exterior da tabela, alterando o valor exterior
    multiplication_restriction2(ListOfLists,RowValues,FinalRowValues),
    multiplication_restriction2(Transpose,ColValues,FinalColValues),

    
    % default labeling
    %labeling([leftmost, step, up, satisfy],Table),

    labeling([],Table), 
    
    displayWithoutClean(ListOfLists, FinalRowValues, FinalColValues, Length, TableValues).


% runner(+Length)
% Predicado auxiliar que pode ser utilizado para gerar, resolver e dar display a um puzzle de dimensão Length
runner(Length):-
    generatePuzzle(Length,RowValues,ColValues),
    solver(Length,RowValues,ColValues).

% generateListofLists(+Length,-ListOfLists)
% gera uma Lista de Listas de dimensão Length.
generateListofLists(Length,ListOfLists):-
    length(ListOfLists,Length),
    generator(ListOfLists,Length).

% generator(-Row,+Length)
% gera uma linha de tamanho Length da lista de listas
generator([],_).
generator([H|T],Length):-
    length(H,Length),
    generator(T,Length).

% line_restriction(-RowList,+Amount)
% garante que existam exatamente Amount zeros na Lista RowList, de modo a cumprir a restrição de apenas 2 números por linha
line_restriction([],_).
line_restriction([H|T],Amount):-
     exactly(0,H,Amount),
     line_restriction(T,Amount).

% multiplication_restriction(+ListOfLists,+RowValues)
% garante que o produto de uma linha(Row) vai corresponder ao respetivo valor de RowValues +-1
multiplication_restriction(_,[]).
multiplication_restriction([H|T],[H2|T2]):-
    mult_list(H,H2),
    multiplication_restriction(T,T2).

% mult_list(-List,+Total)
% Função auxiliar de multiplication_restriction que recebe cada Row para garantir que a multiplicação equivale a Total +-1
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

% multiplication_restriction2(+ListOfLists,+RowValues)
% Igual a multiplication_restriction mas possui mais um argumento para guardar o valor final da multiplcação
% garante que o produto de uma linha(Row) vai corresponder ao respetivo valor de RowValues +-1
multiplication_restriction2(_,[],[]).
multiplication_restriction2([H|T],[H2|T2],[H3|T3]):-
    mult_list2(H,H2,H3),
    multiplication_restriction2(T,T2,T3).
    
% mult_list2(-List,+Total)
% Igual a multiplication_restriction mas possui mais um argumento para guardar o valor final da multiplcação
% Função auxiliar de multiplication_restriction2 que recebe cada Row para garantir que a multiplicação equivale a Total +-1
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


% exactly(+X, +List, +N)
% predicado fornecido no moodle
% garante que existem exatamente N valores iguais a X em List
exactly(_, [], 0).
exactly(X, [Y|L], N) :-
    X #= Y #<=> B,
    N #= M + B,
exactly(X, L, M).


% selRandom(Var, Rest, BB0, BB1)
% Gerador aleatório de valores fornecido no Moodle
% Predicado para utilizar no labeling para gerar valores de uma forma aleatória
selRandom(Var, Rest, BB0, BB1):- % seleciona valor de forma aleatória
    fd_set(Var, Set), fdset_to_list(Set, List),
    random_member(Value, List), % da library(random)
    ( first_bound(BB0, BB1), Var #= Value ;
    later_bound(BB0, BB1), Var #\= Value ).


% Inicializa um contador de tempo de execução a 0
reset_timer:-
    statistics(total_runtime,_).

% print_time(+Msg)
% Escreve Msg recebida seguida do tempo de xecução do programa após executar o prediado reset_timer
print_time(Msg):-
    statistics(total_runtime,[_,T]),
    TS is ((T//10)*10)/1000,nl,
    write(Msg),write(TS),write('s'),nl,nl. 






