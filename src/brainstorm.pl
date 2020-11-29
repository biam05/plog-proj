:-dynamic(connected_bot/2).

/*
connected_bot(h1,i2).
connected_bot(i2,h3).
connected_bot(h3,i4).
connected_bot(i4,h5).
connected_bot(h5,i6).
connected_bot(i6,h7).
connected_bot(h7,i8).
connected_bot(i8,h9).
connected_bot(h9,i10).
connected_bot(i10,h11).
connected_bot(h11,i12).
connected_bot(h11,g12).
connected_bot(g12,h13).
connected_bot(i12,h13).

color(h1,1).
color(h3,1).
color(h5,1).
color(h7,1).
color(h9,1).
color(h11,1).
color(h13,1).
color(i2,1).
color(i4,1).
color(i6,1).    
color(i8,1).
color(i10,1).
color(i12,1).
color(g12,1).
*/

coords([
    % P, G, O
    ['a6', 'a8'],
    ['b5', 'b7', 'b9'],
    ['c4', 'c6', 'c8', 'c10'],
    ['d3', 'd5', 'd7', 'd9', 'd11'],
    ['e2', 'e4', 'e6', 'e8', 'e10', 'e12'],
    ['f3', 'f5', 'f7', 'f9', 'f11'],
    ['g2', 'g4', 'g6', 'g8', 'g10', 'g12'],
    ['h1', 'h3', 'h5', 'h7', 'h9', 'h11', 'h13'],
    ['i2', 'i4', 'i6', 'i8', 'i10', 'i12'],
    ['j1', 'j3', 'j5', 'j7', 'j9', 'j11', 'j13'],
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

flatt(List):-
    coords(X),
    achata_lista(X,List).

connect_all:-
    flatt(List),
    connect_all(List).
    %listing(connected_bot).

connect_all([]).
connect_all([H|T]):-
    add_connections_bot(H),
    connect_all(T).



add_conection_bot(A,B):-
    \+connected_bot(A,B),
    \+connected_bot(B,A),
    Conection = connected_bot(A,B),
    ConectionReverse = connected_bot(B,A),
    assert(Conection),
    assert(ConectionReverse).

add_conection_bot(_,_).

add_connections_bot(Position):-
    position_to_row_column(Position,Row,Column),
    get_adjacent(Row,Column,Adjacent),
    %write(Position),
    %write(Adjacent),nl,
    check_existance_bot(Adjacent,Position).

check_existance_bot([],_).
check_existance_bot([H1-H2|T],Position):-
    %write('reaches'),nl,
    index_to_letter(H1,Letter),
    get_position_string(Letter,H2,String),
    validMove(String),
    %write(Letter),nl,
    %write(H2),nl,nl,
    %write('passed'),nl,
    add_conection_bot(String,Position),
    check_existance_bot(T,Position).

check_existance_bot([_H1-_H2|T],Position):-
    check_existance_bot(T,Position).


resolva_profundidade_bot(No_inicial,No_meta,Solucao) :-
    profundidade_bot([],No_inicial,No_meta,Sol_inv),
    reverse(Sol_inv,Solucao).

profundidade_bot(Caminho,No_meta,No_meta,[No_meta|Caminho]).
profundidade_bot(Caminho,No,No_meta,Sol) :-
    connected_bot(No,No1),
    %write(Caminho),nl,
    %write(No),
    %write(No1),nl,  
    %check_color(No,Color,Player),
    %write('color1 checked'),nl,
    %check_color(No1,Color,Player),
    %write('color2 checked'),nl,
    \+member(No1,Caminho),
    profundidade_bot([No|Caminho],No1,No_meta,Sol).


yayaya:-
    connect_all,
    resolva_profundidade_bot(h1,h13,Solucao),
    write(Solucao).

rip2:-
    %connect_all,
    findall(Solucao,resolva_profundidade_bot(h1,h13,Solucao),Lista),
    write(Lista).

rr:-
    findall(Solucao,resolva_profundidade(h1,h13,Solucao,1,0),Lista),
    write(Lista).