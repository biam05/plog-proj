%:-use_module(library(lists)).

:-dynamic(connected/2).

/*
ligado(a,b). 
ligado(a,c). 
ligado(b,d). 
ligado(b,e). 
ligado(b,f). 
ligado(c,g). 
ligado(d,h). 
ligado(d,i). 
ligado(f,i).
ligado(f,j).
ligado(f,k).
ligado(g,l).
ligado(g,m).
ligado(k,n).
ligado(l,o).
ligado(i,f).
*/


secondary([
    ['gg', 'a8'],
    ['gg', 'b7', 'b9'],
    ['gg', 'c6', 'c8', 'c10'],
    ['d3', 'd5', 'd7', 'd9', 'd11'],
    ['e2', 'gg', 'e6', 'e8', 'e10', 'e12'],
    ['gg', 'f5', 'f7', 'f9', 'f11'],
    ['g2', 'g4', 'g6', 'g8', 'g10', 'g12'],
    ['h1', 'gg', 'h5', 'h7', 'h9', 'h11', 'h13'],
    ['gg', 'i4', 'i6', 'i8', 'i10', 'i12'],
    ['gg', 'gg', 'j5', 'j7', 'j9', 'j11', 'j13'],
    ['k2', 'k4', 'k6', 'k8', 'k10', 'k12'],
    ['l1', 'l3', 'l5', 'l7', 'l9', 'l11', 'l13'],
    ['m2', 'm4', 'm6', 'm8', 'm10', 'm12'],
    ['n1', 'n3', 'n5', 'n7', 'n9', 'n11', 'n13'],
    ['o2', 'o4', 'o6', 'o8', 'o10', 'o12'],
    ['p1', 'p3', 'p5', 'p7', 'p9', 'p11', 'p13'],
    ['q2', 'q4', 'q6', 'q8', 'q10', 'q12'],
    ['r3', 'r5', 'r7', 'r9', 'r11'],
    ['s2', 's4', 's6', 's8', 's10', 's12'],
    ['t3', 't5', 't7', 't9', 't11'],
    ['u4', 'u6', 'u8', 'u10'],
    ['v5', 'v7', 'v9'],
    ['w6', 'w8']
]).



check_win:-
    resolva_profundidade(h1,h3,Solution).
    

resolva_profundidade(No_inicial,No_meta,Solucao) :-
    profundidade([],No_inicial,No_meta,Sol_inv),
    reverse(Sol_inv,Solucao).

profundidade(Caminho,No_meta,No_meta,[No_meta|Caminho]).

profundidade(Caminho,No,No_meta,Sol) :-
    connected(No,No1),
    \+member(No1,Caminho),
    profundidade([No|Caminho],No1,No_meta,Sol).


p:-
    addConection(a,b),
    connected(a,b).

hello:-
    write('Term').



addConection(A,B):-
    Conection = connected(A,B),
    ConectionReverse = connected(B,A),
    assert(Conection),
    assert(ConectionReverse).

add_connections(Gamestate,Row,Column):-
    get_adjacent(Row,Column,Adjacent),
    write(Adjacent),nl,
    get_position_string(Row,Column,String),
    check_existance(Adjacent,Gamestate,String).

check_existance([],_,_).
check_existance([H1-H2|T],Gamestate,Position):-
    index_to_letter(H1,Letter),
    get_value(Gamestate,Letter,H2,Value),
    get_position_string(Letter,H2,String),

    write(Value),nl,
    write(Letter),nl,
    write(H2),nl,nl,
    Value \= String,!,
    write(passed),nl,
    addConection(String,Position),
    addConection(Position,String),
    check_existance(T,Gamestate,Position).

check_existance([H1-H2|T],Gamestate,Position):-
    check_existance(T,Gamestate,Position).


f:-
    secondary(Initial),
    add_connections(Initial,e,4),
    write(added),nl,












    



