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

%connected(b5,a6).
%connected(a6,b5).

color(e2,1).
color(d3,1).
color(c4,1).
color(b5,1).
%color(a6,1).

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



/* 
*   check_color(+Position,+Color,+Player)
*       - checks if the Position has one of the colors needed to win the Color, having in
*   mind the Player's win conditions
*/
%   - Player: 0 Color: Purple
check_color(Position,1,0):- color(Position,1).
check_color(Position,1,0):- color(Position,3).
%   - Player: 1 Color: Purple
check_color(Position,1,1):- color(Position,1).
check_color(Position,1,1):- color(Position,2).
%    - Player: 0 Color: Green
check_color(Position,2,0):- color(Position,2). 
check_color(Position,2,0):- color(Position,1).
%    - Player: 1 Color: Green
check_color(Position,2,1):- color(Position,2).
check_color(Position,2,1):- color(Position,3).
%    - Player: 0 Color: Orange
check_color(Position,3,0):- color(Position,3).
check_color(Position,3,0):- color(Position,2).
%    - Player: 1 Color: Orange
check_color(Position,3,1):- color(Position,3).
check_color(Position,3,1):- color(Position,1).

/* 
*   get_single_color(+Player,+ColorWon,-ColorBlocked)
*       - gets the ColorBlocked that allowed the Player to win the ColorWon
*/
% Player 0
get_single_color(0,1,3). % purple wins with orange block
get_single_color(0,2,1). % green wins with purple block
get_single_color(0,3,2). % orange wins with purple block

% Player 1 
get_single_color(1,1,2). % purple wins with green block
get_single_color(1,2,3). % green wins with orange block
get_single_color(1,3,2). % orange wins with green block

/*
*    coords_blocking(+Color, -Coords)
*        - get the coordinates Coords that create a connection that blocks the
*    color Color
*/
% Purple blocking Coords
coords_blocking(1,Coords):-
    InitialNodes = [h1,g2,e2,d3,c4,b5,a6,b7,a8,b9,c10,d11,e12,g12,h13],
    FinalNodes = [p1,q2,s2,t3,u4,v5,w6,v7,w8,v9,u10,t11,s12,q12,p13],
    permutation_(InitialNodes,FinalNodes,Coords).
% Green blocking Coords
coords_blocking(2,Coords):-
    InitialNodes = [a6,b7,a8,b9,c10,d11,e12,g12,h13,j13,l13,n13,p13,q12,s12],
    FinalNodes = [e2,g2,h1,j1,l1,n1,p1,q2,s2,t3,u4,v5,w6,v7,w8],
    permutation_(InitialNodes,FinalNodes,Coords).
% Orange blocking Coords
coords_blocking(3,Coords):-
    InitialNodes = [s2,q2,p1,n1,l1,j1,h1,g2,e2,d3,c4,b5,a6,b7,a8],
    FinalNodes = [w6,v7,w8,v9,u10,t11,s12,q12,p13,n13,l13,j13,h13,g12,e12],
    permutation_(InitialNodes,FinalNodes,Coords).

/*
*    coords(+Color, -Coords)
*        - get the coordinates Coords that create a connection that wins the
*    color Color
*/
% Purple winning Coords
coords(1,Coords):-
    InitialNodes = [h1,j1,l1,n1,p1],
    FinalNodes = [h13,j13,l13,n13,p13],
    permutation_(InitialNodes,FinalNodes,Coords).
% Green winning Coords
coords(2,Coords):-
    InitialNodes = [e2,d3,c4,b5,a6],
    FinalNodes = [w8,v9,u10,t11,s12],
    permutation_(InitialNodes,FinalNodes,Coords).
% Orange winning Coords
coords(3,Coords):-
    InitialNodes = [a8,b9,c10,d11,e12],
    FinalNodes = [s2,t3,u4,v5,w6],
    permutation_(InitialNodes,FinalNodes,Coords).

/*
*   check_win_cl(+Player, +Color, +Value)
*        - verifies if it's necessary to research certain Color. If the
*   Value is equal to 0, the Color was won by Player 0, if the Value is
*   equal to 1, the Color was won by Player 1. Else, the Color can be one
*   by any Player.
*/
check_win_cl(_,_,0).
check_win_cl(_,_,1).
check_win_cl(Player,Color,_Value):-
    coords(Color,Coords),
    check_win_color(Coords,Player,Color).

/*
*   check_win_color(+Coords, +Player, +Color)
*        - searches the connecties to verify if the color Color was won
*   by the player Player.
*/
check_win_color([],_,_).
check_win_color([C1-C2|T],Player,Color):-
    \+resolva_profundidade(C1,C2,_Solution,Color,Player),
    check_win_color(T,Player,Color).

/*
*   check_win_cl_block(+Player, +Color, +Value)
*        - similar to check_win_cl, but with color blocks
*/
check_win_cl_block(_,_,0).
check_win_cl_block(_,_,1).
check_win_cl_block(Player,Color,_Value):-
    coords_blocking(Color,Coords),
    get_single_color(Player,Color,ColorBlock),
    check_win_color_block(Coords,Player,ColorBlock).

/*
*   check_win_color_block(+Coords, +Player, +ColorBlock)
*        - similar to check_win_color, but with color blocks
*/
check_win_color_block([],_Player,_Color).
check_win_color_block([C1-C2|T],Player,Color):-
    \+resolva_profundidade_bloqueio(C1,C2,_Solution,Color,Player),
    check_win_color_block(T,Player,Color).
    
/*
*   check_wins_color(+Player, +Color, +ValueColor, +InitialGamestate, -FinalGamestate)
*        - function that verifies if the Color was won by the Player, changing the
*   game state if necessary
*/
check_wins_color(Player,Color,ValueColor,InitialGamestate,FinalGamestate):-
    check_win_cl(Player,Color,ValueColor),
    check_win_cl_block(Player,Color,ValueColor),!,
    FinalGamestate = InitialGamestate.

check_wins_color(Player,Color,_ValueColor,InitialGamestate,FinalGamestate):-
    set_color_gamestate(Color,Player,InitialGamestate,FinalGamestate),!,
    format('           Player ~w Won Color!! ~w ~n',[Player,Color]).
 
/*
*   check_win(+Player, +InitialGamestate, -FinalGamestate)
*        - Checks if there's a win for each color using the Player's win conditions   
*/
check_win(Player,InitialGamestate,FinalGamestate):-
    won_color(1,InitialGamestate,ValuePurple),
    won_color(2,InitialGamestate,ValueGreen),
    won_color(3,InitialGamestate,ValueOrange),
    check_wins_color(Player,1,ValuePurple,InitialGamestate,FinalGamestate1),
    check_wins_color(Player,2,ValueGreen,FinalGamestate1,FinalGamestate2),
    check_wins_color(Player,3,ValueOrange,FinalGamestate2,FinalGamestate).

/*
*   resolva_profundidade(+No_inicial, +No_meta, -Solucao, +Color, +Player)
*       - makes a depth research, obtaining a path beggining in No_inicial and
*   ending in No_meta
*/ 
resolva_profundidade(No_inicial,No_meta,Solucao,Color,Player) :-
    profundidade([],No_inicial,No_meta,Sol_inv,Color,Player),
    reverse(Sol_inv,Solucao).

/*
*   profundidade(+Caminho, +No, +No_meta, -Sol, +Color, +Player)
*       - makes a depth research, creating connections between No and auxiliary
*   nodes, checking the colors used in the path having in mind the Color and Player
*/ 
profundidade(Caminho,No_meta,No_meta,[No_meta|Caminho],_Color,_Player).
profundidade(Caminho,No,No_meta,Sol,Color,Player) :-
    connected(No,No1),
    check_color(No,Color,Player),
    check_color(No1,Color,Player),
    \+member(No1,Caminho),
    profundidade([No|Caminho],No1,No_meta,Sol,Color,Player).

/*
*   resolva_profundidade_bloqueio(+No_inicial, +No_meta, -Solucao, +Color, +Player)
*       - similar to resolva_profundidade, but with blocks
*/
resolva_profundidade_bloqueio(No_inicial,No_meta,Solucao,Color,Player) :-
    profundidade_bloqueio([],No_inicial,No_meta,Sol_inv,Color,Player),
    reverse(Sol_inv,Solucao).

/*
*   profundidade_bloqueio(+Caminho, +No, +No_meta, -Sol, +Color, +Player)
*       - similar to profundidade, but with blocks
*/ 
profundidade_bloqueio(Caminho,No_meta,No_meta,[No_meta|Caminho],_Color,_Player).
profundidade_bloqueio(Caminho,No,No_meta,Sol,Color,Player) :-
    connected(No,No1),
    color(No,Color),
    color(No1,Color),
    \+member(No1,Caminho),
    profundidade_bloqueio([No|Caminho],No1,No_meta,Sol,Color,Player).

/*
*   add_color(+Row, +Column, +Color)
*       - ads Color to the position defined by Row and Column
*/
add_color(Row,Column,Color):-
    get_position_string(Row,Column,String),
    Clr = color(String,Color),
    assert(Clr).

/*
*   addConection(+A, +B)
*       - creates a connection between A and B
*/
addConection(A,B):-
    \+connected(A,B),
    \+connected(B,A),
    Conection = connected(A,B),
    ConectionReverse = connected(B,A),
    assert(Conection),
    assert(ConectionReverse).

/*
*   add_conections(+Row, +Column)
*       - creates connections between the position defined by Row and Column and
*   it's adjacents
*/
add_connections(Row,Column):-
    get_adjacent(Row,Column,Adjacent),
    get_position_string(Row,Column,String),
    check_existance(Adjacent,String).

/*
*   check_existance(+Adjacents, +Position)
*       - creates connections between the position defined by Row and Column and
*   it's adjacents
*/
check_existance([],_).
check_existance([H1-H2|T],Position):-
    index_to_letter(H1,Letter),
    get_position_string(Letter,H2,String),
    valid_move(String),
    addConection(String,Position),
    check_existance(T,Position).
check_existance([_H1-_H2|T],Position):-
    check_existance(T,Position).

