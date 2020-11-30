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
    valid_move(String),
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
