%:-use_module(library(lists)).

:-dynamic(connected/2).
:-dynamic(color/2).

% EStes valores são experimentais para verificar se o código está a funciona

/*
connected(e2,d3).
connected(d3,e2).

connected(d3,c4).
connected(c4,d3).

connected(c4,b5).
connected(b5,c4).

connected(b5,a6).
connected(a6,b5).

color(e2,1).
color(d3,1).
color(c4,1).
color(b5,1).
color(a6,1).
*/
/*
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
*/
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

coords_blocking(1,Coords):-
    InitialNodes = [h1,g2,e2,d3,c4,b5,a6,b7,a8,b9,c10,d11,e12,g12,h13],
    FinalNodes = [p1,q2,s2,t3,u4,v5,w6,v7,w8,v9,u10,t11,s12,q12,p13],
    permutation_(InitialNodes,FinalNodes,Coords).

coords_blocking(2,Coords):-
    InitialNodes = [a6,b7,a8,b9,c10,d11,e12,g12,h13,j13,l13,n13,p13,q12,s12],
    FinalNodes = [e2,g2,h1,j1,l1,n1,p1,q2,s2,t3,u4,v5,w6,v7,w8],
    permutation_(InitialNodes,FinalNodes,Coords).

coords_blocking(3,Coords):-
    InitialNodes = [s2,q2,p1,n1,l1,j1,h1,g2,e2,d3,c4,b5,a6,b7,a8],
    FinalNodes = [w6,v7,w8,v9,u10,t11,s12,q12,p13,n13,l13,j13,h13,g12,e12],
    permutation_(InitialNodes,FinalNodes,Coords).

coords(1,Coords):-
    InitialNodes = [h1,j1,l1,n1,p1],
    FinalNodes = [h13,j13,l13,n13,p13],
    permutation_(InitialNodes,FinalNodes,Coords).

coords(2,Coords):-
    InitialNodes = [e2,d3,c4,b5,a6],
    FinalNodes = [w8,v9,u10,t11,s12],
    permutation_(InitialNodes,FinalNodes,Coords).

coords(3,Coords):-
    InitialNodes = [a8,b9,c10,d11,e12],
    FinalNodes = [s2,t3,u4,v5,w6],
    permutation_(InitialNodes,FinalNodes,Coords).


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
    coords_blocking(Color,Coords),
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
    check_win_cl_block(Player,Color,ValueColor),!,
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
    \+connected(A,B),
    \+connected(B,A),
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





    

should(X):-
    coords_blocking(2,List),
    member(X,List).

