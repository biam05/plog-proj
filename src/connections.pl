%:-use_module(library(lists)).

:-dynamic(connected/2).
:-dynamic(color/2).

% EStes valores são experimentais para verificar se o código está a funcionar
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
connected(i12,h13).

color(h1,2).
color(h3,2).
color(h5,2).
color(h7,2).
color(h9,2).
color(h11,2).
color(h13,2).
color(i2,2).
color(i4,2).
color(i6,2).
color(i8,2).
color(i10,2).
color(i12,2).




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


check_win_color(Player,Color):-
    coords(Color,Coords),
    write(Coords),nl,
    check_win_color(Coords,Player,Color).
    
check_win_color([],_,_).
check_win_color([C1-C2|T],Player,Color):-
    write(C1),
    write(C2),nl,
    \+resolva_profundidade(C1,C2,Solution,Color,Player),
    check_win_color(T,Player,Color).


check_win_color_block(Player,Color):-
    coords(Color,Coords),
    get_single_color(Player,Color,ColorBlock),
    nl,nl,write(ColorBlock),nl,nl,
    check_win_color_block(Coords,Player,ColorBlock).
    
check_win_color_block([],Player,Color).
check_win_color_block([C1-C2|T],Player,Color):-
    write(C1),
    write(C2),nl,
    \+resolva_profundidade_bloqueio(C1,C2,Solution,Color,Player),
    check_win_color_block(T,Player,Color).
    



% Checks if there's a win for each color using the Player's win conditions    
check_win(Player):-
    write(Player),nl,
    write('entered check win'),nl,
    check_win_color(Player,1),
    write('checked purple'),nl,
    check_win_color(Player,2),
    write('checked green'),nl,
    check_win_color(Player,3),
    write('checked orange'),nl,
    check_win_color_block(Player,1),
    write('checked purple block'),nl.
    check_win_color_block(Player,2),
    write('checked purple block'),nl.
    check_win_color_block(Player,3),
    write('checked purple block'),nl.
    
resolva_profundidade(No_inicial,No_meta,Solucao,Color,Player) :-
    profundidade([],No_inicial,No_meta,Sol_inv,Color,Player),
    reverse(Sol_inv,Solucao).
profundidade(Caminho,No_meta,No_meta,[No_meta|Caminho],Color,Player).
profundidade(Caminho,No,No_meta,Sol,Color,Player) :-
    connected(No,No1),
    write(Caminho),nl,
    write(No),
    write(No1),nl,  
    check_color(No,Color,Player),
    write('color1 checked'),nl,
    check_color(No1,Color,Player),
    write('color2 checked'),nl,
    \+member(No1,Caminho),
    profundidade([No|Caminho],No1,No_meta,Sol,Color,Player).

resolva_profundidade_bloqueio(No_inicial,No_meta,Solucao,Color,Player) :-
    profundidade_bloqueio([],No_inicial,No_meta,Sol_inv,Color,Player),
    reverse(Sol_inv,Solucao).
profundidade_bloqueio(Caminho,No_meta,No_meta,[No_meta|Caminho],Color,Player).
profundidade_bloqueio(Caminho,No,No_meta,Sol,Color,Player) :-
    connected(No,No1),
    write(Caminho),nl,
    write(No),
    write(No1),nl,
    color(No,Color),
    color(No1,Color),
    \+member(No1,Caminho),
    profundidade_bloqueio([No|Caminho],No1,No_meta,Sol,Color,Player).


add_color(Row,Column,Color):-
    get_position_string(Row,Column,String),
    Clr = color(String,Color),
    assert(Clr).



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
    write('reaches'),nl,
    index_to_letter(H1,Letter),
    get_position_string(Letter,H2,String),
    validMove(String),
    write(Letter),nl,
    write(H2),nl,nl,
    write('passed'),nl,
    addConection(String,Position),
    check_existance(T,Gamestate,Position).

check_existance([H1-H2|T],Gamestate,Position):-
    check_existance(T,Gamestate,Position).


f:-
    initial(Initial),
    add_connections(Initial,e,4),
    write(added),nl.


xxx:-
    check_win_color(0,1).



    



