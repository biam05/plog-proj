%:-use_module(library(lists)).

:-dynamic(connected/2).
:-dynamic(color/2).

% EStes valores são experimentais para verificar se o código está a funciona

connected(h1,i2).
connected(i2,h3).
connected(h3,i4).
connected(i4,h5).
connected(h5,i6).
connected(i6,h7).
connected(h7,i8).
connected(i8,h9).
connected(h9,i10).
connected(i10,h11).
connected(h11,i12).
connected(h11,g12).
connected(i12,h13).



connected(e2,g2).
connected(g2,i2).
connected(i2,k2).
connected(k2,m2).
connected(m2,o2).
connected(o2,q2).
connected(q2,r3).
connected(r3,s4).
connected(s4,t5).
connected(t5,u6).
connected(u6,t7).
connected(t7,u8).
connected(u8,w8).

color(h1,1).
color(h3,1).
color(h5,1).
color(h7,1).
color(h9,1).
color(h11,3).
color(h13,1).
color(i2,1).
color(i4,3).
color(i6,1).    
color(i8,1).
color(i10,1).
color(i12,1).

/*
color(e2,2).
color(g2,2).
color(i2,2).
color(k2,2).
color(m2,2).
color(o2,2).
color(q2,2).
color(r3,2).
color(s4,2).
color(t5,2).    
color(u6,2).
color(t7,2).
color(u8,2).
color(w8,2).

*/



% check_color -> (Position,Color,Player)

%Player: 0 Color: Purple
check_color(Position,1,0):- color(Position,1).
check_color(Position,1,0):- color(Position,3).
%Player: 1 Color: Purple
check_color(Position,1,1):- color(Position,1).
check_color(Position,1,1):- color(Position,2).

%Player: 0 Color: Green
check_color(Position,2,0):- color(Position,2). 
check_color(Position,2,0):- color(Position,1).
%Player: 1 Color: Green
check_color(Position,2,1):- color(Position,2).
check_color(Position,2,1):- color(Position,3).

%Player: 0 Color: Orange
check_color(Position,3,0):- color(Position,3).
check_color(Position,3,0):- color(Position,2).
%Player: 1 Color: Orange
check_color(Position,3,1):- color(Position,3).
check_color(Position,3,1):- color(Position,1).


get_single_color(0,1,3). %purple wins with orange block
get_single_color(0,2,1). %green wins with purple block
get_single_color(0,3,2). %orange wins with purple block

%Player 1 
get_single_color(1,1,2). %purple wins with green block
get_single_color(1,2,3). %green wins with orange block
get_single_color(1,3,2). %orange wins with green block


coords_block(1,[
    e2-q2, e2-s2, e2-t3, e2-u4, e2-v5, e2-w6, e2-v7, e2-w8, e2-v9, e2-u10, e2-t11, e2-s12, e2-q12,
    d3-q2, d3-s2, d3-t3, d3-u4, d3-v5, d3-w6, d3-v7, d3-w8, d3-v9, d3-u10, d3-t11, d3-s12, d3-q12,
    c4-q2, c4-s2, c4-t3, c4-u4, c4-v5, c4-w6, c4-v7, c4-w8, c4-v9, c4-u10, c4-t11, c4-s12, c4-q12,
    b5-q2, b5-s2, b5-t3, b5-u4, b5-v5, b5-w6, b5-v7, b5-w8, b5-v9, b5-u10, b5-t11, b5-s12, b5-q12,
    a6-q2, a6-s2, a6-t3, a6-u4, a6-v5, a6-w6, a6-v7, a6-w8, a6-v9, a6-u10, a6-t11, a6-s12, a6-q12,
    b7-q2, b7-s2, b7-t3, b7-u4, b7-v5, b7-w6, b7-v7, b7-w8, b7-v9, b7-u10, b7-t11, b7-s12, b7-q12,
    a8-q2, a8-s2, a8-t3, a8-u4, a8-v5, a8-w6, a8-v7, a8-w8, a8-v9, a8-u10, a8-t11, a8-s12, a8-q12,
    b9-q2, b9-s2, b9-t3, b9-u4, b9-v5, b9-w6, b9-v7, b9-w8, b9-v9, b9-u10, b9-t11, b9-s12, b9-q12,
    c10-q2, c10-s2, c10-t3, c10-u4, c10-v5, c10-w6, c10-v7, c10-w8, c10-v9, c10-u10, c10-t11, c10-s12, c10-q12,
    d11-q2, d11-s2, d11-t3, d11-u4, d11-v5, d11-w6, d11-v7, d11-w8, d11-v9, d11-u10, d11-t11, d11-s12, d11-q12,
    e12-q2, e12-s2, e12-t3, e12-u4, e12-v5, e12-w6, e12-v7, e12-w8, e12-v9, e12-u10, e12-t11, e12-s12, e12-q12,
    g12-q2, g12-s2, g12-t3, g12-u4, g12-v5, g12-w6, g12-v7, g12-w8, g12-v9, g12-u10, g12-t11, g12-s12, g12-q12
]).


coords_block(2,[
    h1-b7, h1-a8, h1-b9, h1-c10, h1-d11, h1-e12, h1-g12, h1-h13, h1-j13, h1-l13, h1-n13, h1-p13, h1-q12,
    j1-b7, j1-a8, j1-b9, j1-c10, j1-d11, j1-e12, j1-g12, j1-h13, j1-j13, j1-l13, j1-n13, j1-p13, j1-q12,
    l1-b7, l1-a8, l1-b9, l1-c10, l1-d11, l1-e12, l1-g12, l1-h13, l1-j13, l1-l13, l1-n13, l1-p13, l1-q12,
    n1-b7, n1-a8, n1-b9, n1-c10, n1-d11, n1-e12, n1-g12, n1-h13, n1-j13, n1-l13, n1-n13, n1-p13, n1-q12,
    p1-b7, p1-a8, p1-b9, p1-c10, p1-d11, p1-e12, p1-g12, p1-h13, p1-j13, p1-l13, p1-n13, p1-p13, q2-q12,
    q2-b7, q2-a8, q2-b9, q2-c10, q2-d11, q2-e12, q2-g12, q2-h13, q2-j13, q2-l13, q2-n13, q2-p13, q2-q12,
    s2-b7, s2-a8, s2-b9, s2-c10, s2-d11, s2-e12, s2-g12, s2-h13, s2-j13, s2-l13, s2-n13, s2-p13, s2-q12,
    t3-b7, t3-a8, t3-b9, t3-c10, t3-d11, t3-e12, t3-g12, t3-h13, t3-j13, t3-l13, t3-n13, t3-p13, t3-q12,
    t3-b7, t3-a8, t3-b9, t3-c10, t3-d11, t3-e12, t3-g12, t3-h13, t3-j13, t3-l13, t3-n13, t3-p13, t3-q12,
    u4-b7, u4-a8, u4-b9, u4-c10, u4-d11, u4-e12, u4-g12, u4-h13, u4-j13, u4-l13, u4-n13, u4-p13, u4-q12,
    v5-b7, v5-a8, v5-b9, v5-c10, v5-d11, v5-e12, v5-g12, v5-h13, v5-j13, v5-l13, v5-n13, v5-p13, v5-q12,
    w6-b7, w6-a8, w6-b9, w6-c10, w6-d11, w6-e12, w6-g12, w6-h13, w6-j13, w6-l13, w6-n13, w6-p13, w6-q12 
]).

coords_block(3,[
    a6-h13, a6-j13, a6-l13, a6-n13, a6-p13, a6-q12, a6-s12, a6-t11, a6-u10, a6-v9, a6-v8, a6-v7,
    b5-h13, b5-j13, b5-l13, b5-n13, b5-p13, b5-q12, b5-s12, b5-t11, b5-u10, b5-v9, b5-v8, b5-v7,
    c4-h13, c4-j13, c4-l13, c4-n13, c4-p13, c4-q12, c4-s12, c4-t11, c4-u10, c4-v9, c4-v8, c4-v7,
    d3-h13, d3-j13, d3-l13, d3-n13, d3-p13, d3-q12, d3-s12, d3-t11, d3-u10, d3-v9, d3-v8, d3-v7,
    e2-h13, e2-j13, e2-l13, e2-n13, e2-p13, e2-q12, e2-s12, e2-t11, e2-u10, e2-v9, e2-v8, e2-v7,
    g2-h13, g2-j13, g2-l13, g2-n13, g2-p13, g2-q12, g2-s12, g2-t11, g2-u10, g2-v9, g2-v8, g2-v7,
    h1-h13, h1-j13, h1-l13, h1-n13, h1-p13, h1-q12, h1-s12, h1-t11, h1-u10, h1-v9, h1-v8, h1-v7,
    j1-h13, j1-j13, j1-l13, j1-n13, j1-p13, j1-q12, j1-s12, j1-t11, j1-u10, j1-v9, j1-v8, j1-v7,
    l1-h13, l1-j13, l1-l13, l1-n13, l1-p13, l1-q12, l1-s12, l1-t11, l1-u10, l1-v9, l1-v8, l1-v7,
    n1-h13, n1-j13, n1-l13, n1-n13, n1-p13, n1-q12, n1-s12, n1-t11, n1-u10, n1-v9, n1-v8, n1-v7,
    p1-h13, p1-j13, p1-l13, p1-n13, p1-p13, p1-q12, p1-s12, p1-t11, p1-u10, p1-v9, p1-v8, p1-v7,
    q2-h13, q2-j13, q2-l13, q2-n13, q2-p13, q2-q12, q2-s12, q2-t11, q2-u10, q2-v9, q2-v8, q2-v7
]).


coords(1,[
    h1-h13, h1-j13, h1-l13, h1-n13, h1-p13,
    j1-h13, j1-j13, j1-l13, j1-n13, j1-p13,
    l1-h13, l1-j13, l1-l13, l1-n13, l1-p13,
    n1-h13, n1-j13, n1-l13, n1-n13, n1-p13,
    p1-h13, p1-j13, p1-l13, p1-n13, p1-p13
]).

coords(2,[
    a6-w8, a6-v9, a6-u10, a6-t11, a6-s12,
    b5-w8, b5-v9, b5-u10, b5-t11, b5-s12,
    c4-w8, c4-v9, c4-u10, c4-t11, c4-s12,
    d3-w8, d3-v9, d3-u10, d3-t11, d3-s12,
    e2-w8, e2-v9, e2-u10, e2-t11, e2-s12
]).

coords(3,[
    a8-w6, a8-v5, a8-u4, a8-t3, a8-s2,
    b5-w6, b5-v5, b5-u4, b5-t3, b5-s2,
    c4-w6, c4-v5, c4-u4, c4-t3, c4-s2,
    d3-w6, d3-v5, d3-u4, d3-t3, d3-s2,
    e2-w6, e2-v5, e2-u4, e2-t3, e2-s2
]).

check_win_cl(_,_,0).
check_win_cl(_,_,1).
check_win_cl(Player,Color,_Value):-
    coords(Color,Coords),
    %write(Coords),nl,
    check_win_color(Coords,Player,Color).

check_win_color([],_,_).
check_win_color([C1-C2|T],Player,Color):-
    write(C1),
    write(C2),nl,
    \+resolva_profundidade(C1,C2,_Solution,Color,Player),
    check_win_color(T,Player,Color).

check_win_cl_block(_,_,0).
check_win_cl_block(_,_,1).
check_win_cl_block(Player,Color,_Value):-
    coords_block(Color,Coords),
    nl,write(Color),nl,
    get_single_color(Player,Color,ColorBlock),
    nl,write(ColorBlock),nl,
    check_win_color_block(Coords,Player,ColorBlock).
    
check_win_color_block([],_Player,_Color).
check_win_color_block([C1-C2|T],Player,Color):-
    %write(C1),
    %write(C2),nl,
    \+resolva_profundidade_bloqueio(C1,C2,_Solution,Color,Player),
    check_win_color_block(T,Player,Color).
    

check_wins_color(Player,Color,ValueColor,InitialGamestate,FinalGamestate):-
    check_win_cl(Player,Color,ValueColor),
    write('Checked normal'),nl,
    %check_win_cl_block(Player,Color,ValueColor),!,
    write('Checked block'),nl,
    FinalGamestate = InitialGamestate.

check_wins_color(Player,Color,_ValueColor,InitialGamestate,FinalGamestate):-
    write('hey'),nl,
    set_color_gamestate(Color,Player,InitialGamestate,FinalGamestate),!,
    format('Player ~w Won Color!! ~w ~n',[Player,Color]),
    write('set'),nl.



% Checks if there's a win for each color using the Player's win conditions    
check_win(Player,InitialGamestate,FinalGamestate):-
    write(Player),nl,

    won_color(1,InitialGamestate,ValuePurple),
    won_color(2,InitialGamestate,ValueGreen),
    won_color(3,InitialGamestate,ValueOrange),

    write(ValuePurple),nl,
    write(ValueGreen),nl,
    write(ValueOrange),nl,
    %write('entered check win'),nl,
    check_wins_color(Player,1,ValuePurple,InitialGamestate,FinalGamestate1),
    write('Exited won purple'),nl,
    %write('checked purple'),nl,
    check_wins_color(Player,2,ValueGreen,FinalGamestate1,FinalGamestate2),
    write('Exited won green'),nl,
    %write('checked green'),nl,
    check_wins_color(Player,3,ValueOrange,FinalGamestate2,FinalGamestate),
    write('Exited won orange'),nl.
    %write('checked orange'),nl,
    
resolva_profundidade(No_inicial,No_meta,Solucao,Color,Player) :-
    %write('prof'),nl,
    profundidade([],No_inicial,No_meta,Sol_inv,Color,Player),
    write(Sol_inv),
    reverse(Sol_inv,Solucao).

profundidade(Caminho,No_meta,No_meta,[No_meta|Caminho],_Color,_Player).
profundidade(Caminho,No,No_meta,Sol,Color,Player) :-
    connected(No,No1),
    write(Caminho),nl,
    %write(No),
    %write(No1),nl,  
    check_color(No,Color,Player),
    %write('color1 checked'),nl,
    check_color(No1,Color,Player),
    %write('color2 checked'),nl,
    \+member(No1,Caminho),
    profundidade([No|Caminho],No1,No_meta,Sol,Color,Player).

resolva_profundidade_bloqueio(No_inicial,No_meta,Solucao,Color,Player) :-
    profundidade_bloqueio([],No_inicial,No_meta,Sol_inv,Color,Player),
    reverse(Sol_inv,Solucao).
profundidade_bloqueio(Caminho,No_meta,No_meta,[No_meta|Caminho],_Color,_Player).
profundidade_bloqueio(Caminho,No,No_meta,Sol,Color,Player) :-
    connected(No,No1),
    %write(Caminho),nl,
    %write(No),
    %write(No1),nl,
    color(No,Color),
    color(No1,Color),
    \+member(No1,Caminho),
    profundidade_bloqueio([No|Caminho],No1,No_meta,Sol,Color,Player).


add_color(Row,Column,Color):-
    get_position_string(Row,Column,String),
    Clr = color(String,Color),
    assert(Clr).



addConection(A,B):-
    %\+connected(A,B),
    %\+connected(B,A),
    Conection = connected(A,B),
    ConectionReverse = connected(B,A),
    assert(Conection),
    assert(ConectionReverse).

add_connections(Row,Column):-
    get_adjacent(Row,Column,Adjacent),
    %write(Adjacent),nl,
    get_position_string(Row,Column,String),
    check_existance(Adjacent,String).

check_existance([],_).
check_existance([H1-H2|T],Position):-
    %write('reaches'),nl,
    index_to_letter(H1,Letter),
    get_position_string(Letter,H2,String),
    valid_move(String),
    %write(Letter),nl,
    %write(H2),nl,nl,
    %write('passed'),nl,
    addConection(String,Position),
    check_existance(T,Position).

check_existance([_H1-_H2|T],Position):-
    check_existance(T,Position).


f:-
    initial(Initial),
    add_connections(Initial,e,4).
    %write(added),nl.


xxx:-
    check_win_color(0,1).





    



